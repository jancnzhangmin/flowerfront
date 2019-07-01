define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var userid = 0;
	var pwdstep = 0;

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.params) {
			this.comp('title1').set({
				title : event.params.title
			});
			userid = event.params.userid;

			var self = this;
			$.ajax({
				async : true,
				url : publicurl + '/api/get_directagnet_agentlevel_list',
				type : "GET",
				dataType : 'jsonp',
				jsonp : 'callback',
				timeout : 5000,
				data : {
					userid : userid,
					openid : openid
				},
				success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
					var data = self.comp('agentlevelData');
					$.each(jsonstr.agentlevels, function(i, item) {
						var options = {
							defaultValues : [ {
								id : item.id,
								name : item.name,
								corder : item.corder,
								grant : item.grant,
								amount : item.amount,
								task : item.task
							} ]
						};
						data.newData(options);
					});
					var options = {
						defaultValues : [ {
							id : 0,
							name : '零售',
							amount : 0,
							task : 0
						} ]
					}
					data.newData(options);
					self.comp('select1').val(jsonstr.currentlevel_id)
				},
				error : function(xhr) {
					// justep.Util.hint("错误，请检查网络");
				}
			});

		}
	};

	Model.prototype.button1Click = function(event) {
		this.comp('passwordpopOver').show();
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		$('.mz').text('');
		$(".mm_box li").removeClass("mmdd");
		$(".mm_box li").attr("data", "");
		pwdstep = 0;
		$(".xiaq_tb").click(function() {
			$(".numb_box").slideUp(100);
		});
		$(".mm_box").click(function() {
			$(".numb_box").slideDown(100);
		});

		$(".nub_ggg li .zf_num").click(function() {

			if (pwdstep < 6) {
				$(".mm_box li").eq(pwdstep).addClass("mmdd");
				$(".mm_box li").eq(pwdstep).attr("data", $(this).text());
				pwdstep++
				if (pwdstep == 6) {

					var data = "";
					$(".mm_box li").each(function() {
						data += $(this).attr("data");
					});

					$.ajax({
						async : true,
						url : publicurl + '/api/validation_user_password',
						type : "GET",
						dataType : 'jsonp',
						jsonp : 'callback',
						timeout : 5000,
						data : {
							openid : openid,
							password : data
						},
						success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
							if (jsonstr.status == 0) {
								$('.mz').text('密码错误');
								setTimeout(function() {

									$(".mm_box li").removeClass("mmdd");
									$(".mm_box li").attr("data", "");
									pwdstep = 0;
								}, 100);
							} else {
								self.change_directlevel();
							}
						},
						error : function(xhr) {
							// justep.Util.hint("错误，请检查网络");
						}
					});

				}
				;
			}
		});

		$(".nub_ggg li .zf_del").click(function() {
			if (pwdstep > 0) {
				pwdstep--
				$(".mm_box li").eq(pwdstep).removeClass("mmdd");
				$(".mm_box li").eq(pwdstep).attr("data", "");
			}
		});

		$(".nub_ggg li .zf_empty").click(function() {
			$(".mm_box li").removeClass("mmdd");
			$(".mm_box li").attr("data", "");
			pwdstep = 0;
		});

	};

	Model.prototype.change_directlevel = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/change_directagentlevel',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				userid : userid,
				agentlevel : self.comp('select1').val()
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var rows = self.comp('agentlevelData').find([ 'id' ], [ self.comp('select1').val() ], true);
				justep.Shell.fireEvent("agentdirectdetail_change_directagentlevel", rows[0].val('name'));
				self.close();
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.i2Click = function(event) {
		this.comp('passwordpopOver').hide();
		$('.mz').text('');

		$(".mm_box li").removeClass("mmdd");
		$(".mm_box li").attr("data", "");
		pwdstep = 0;

	};

	Model.prototype.forgetbtnClick = function(event) {
		justep.Shell.showPage(require.toUrl("../ower/change_password.w"));
	};

	return Model;
});