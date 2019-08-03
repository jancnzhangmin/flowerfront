define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var timer;
	var timerstep = 0;
	var pwdstep = 0;
	var pwd1 = "";
	var pwd2 = "";

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
	pwdstep = 0;
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_user_phone',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				self.comp('phoneinput').val(jsonstr.phone);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});

		$('.mz').text('请输入操作密码');
		$(".xiaq_tb").click(function() {
			$(".numb_box").slideUp(100);
		});
		$(".mm_box").click(function() {
			$(".numb_box").slideDown(100);
		});

		$(".nub_ggg li .zf_num").click(function() {
			if (pwdstep < 6) {
				$(".change_box li").eq(pwdstep).addClass("mmdd");
				$(".change_box li").eq(pwdstep).attr("data", $(this).text());
				pwdstep++
				if (pwdstep == 6) {
					var data = "";
					$(".change_box li").each(function() {
						data += $(this).attr("data");
					});

					if (pwd1.length == 0) {
						pwd1 = data;
						setTimeout(function() {
							$(".change_box li").removeClass("mmdd");
							$(".change_box li").attr("data", "");
						}, 500);
						$('.mz').text('请再次输入操作密码');
						pwdstep = 0;
					} else if (pwd2.length == 0) {
						pwd2 = data;
						if (pwd1 == pwd2) {
							$.ajax({
								async : true,
								url : publicurl + '/api/set_user_password',
								type : "GET",
								dataType : 'jsonp',
								jsonp : 'callback',
								timeout : 5000,
								data : {
									openid : openid,
									password : pwd1
								},
								success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
									self.close();
								},
								error : function(xhr) {
									// justep.Util.hint("错误，请检查网络");
								}
							});
						} else {
							setTimeout(function() {
								$(".change_box li").removeClass("mmdd");
								$(".change_box li").attr("data", "");
							}, 500);
							$('.mz').text('两次密码不一致，请重新输入');
							pwdstep = 0;
							pwd1 = '';
							pwd2 = '';
						}
					}
				}
				;
			}
		});

		$(".nub_ggg li .zf_del").click(function() {
			if (pwdstep > 0) {
				pwdstep--
				$(".change_box li").eq(pwdstep).removeClass("mmdd");
				$(".change_box li").eq(pwdstep).attr("data", "");
			}
		});

		$(".nub_ggg li .zf_empty").click(function() {
			$(".change_box li").removeClass("mmdd");
			$(".change_box li").attr("data", "");
			pwdstep = 0;
		});

	};

	Model.prototype.vcodebtnClick = function(event) {
		if (!this.comp('phoneinput').val()) {
			justep.Util.hint("手机号码不能为空", {
				"tyep" : "info",
				"position" : "middle",
				"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
			});
			return false;
		}
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/send_user_vcode',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				phone : self.comp('phoneinput').val()
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
		this.comp('vcodebtn').set({
			disabled : true
		});
		this.comp('phoneinput').set({
			disabled : true
		});
		this.comp('vcodebtn').set({
			label : '重新发送(59)'
		});
		timerstep = 59;
		timer = setInterval(function() {
			timerstep--;
			if (timerstep <= 0) {
				self.comp('vcodebtn').set({
					disabled : false
				});
				self.comp('phoneinput').set({
					disabled : false
				});
				self.comp('vcodebtn').set({
					label : '获取验证码'
				})
				clearInterval(timer);
			} else {
				self.comp('vcodebtn').set({
					label : '重新发送(' + timerstep + ')'
				})
			}
		}, 1000);
	};

	Model.prototype.modelUnLoad = function(event) {
		clearInterval(timer);
	};

	Model.prototype.vcodeinputKeyup = function(event) {
		var self = this;
		if (event.currentTarget.value.length == 6) {
			$.ajax({
				async : true,
				url : publicurl + '/api/validation_user_vcode',
				type : "GET",
				dataType : 'jsonp',
				jsonp : 'callback',
				timeout : 5000,
				data : {
					openid : openid,
					vcode : event.currentTarget.value
				},
				success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
					if (jsonstr.status == 1) {
					event.target.blur();
						self.comp('passwordpopOver').show();
					}
				},
				error : function(xhr) {
					// justep.Util.hint("错误，请检查网络");
				}
			});
		}
	};

	Model.prototype.i2Click = function(event) {
		this.comp('passwordpopOver').hide();
		$(".mm_box li").removeClass("mmdd");
		$(".mm_box li").attr("data", "");
		$('.mz').text('请输入密码');
		pwdstep = 0;
		pwd1 = '';
		pwd2 = '';
	};

	return Model;
});