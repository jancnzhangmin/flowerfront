define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var userid = 0;

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		$('.x-modal-button.x-modal-button-bold.Yes')[0].innerText = '否';
		$('.x-modal-button.x-modal-button-bold.No')[0].innerText = '是';
		this.comp('messageDialog1').set({
			message : '确定需要改变' + event.params.title + '的季度考核状态？'
		});

		if (event.params) {
			this.comp('titlebar1').set({
				title : event.params.title
			});

			var self = this;
			$.ajax({
				async : true,
				url : publicurl + '/api/get_directagent_detail',
				type : "GET",
				dataType : 'jsonp',
				jsonp : 'callback',
				timeout : 5000,
				data : {
					id : event.params.id
				},
				success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
					userid = jsonstr.agent.userid;
					$(self.getElementByXid("image1")).attr('src', jsonstr.agent.headurl);
					$(self.getElementByXid("span2")).text(jsonstr.agent.agentlevel);
					$(self.getElementByXid("span3")).text('￥' + parseFloat(jsonstr.agent.agentpayment).toFixed(2));
					$(self.getElementByXid("span5")).text('￥' + parseFloat(jsonstr.agent.examination).toFixed(2));
					$(self.getElementByXid("span7")).text(jsonstr.agent.lastagentlevel);
					$(self.getElementByXid("span9")).text('￥' + parseFloat(jsonstr.agent.examination_quota).toFixed(2));

					var data = self.comp('examinationData');
					data.clear();
					var options = {
						defaultValues : [ {
							examination : jsonstr.agent.quarter_assessment
						} ]
					};
					data.newData(options);

					self.comp('button1').set({
						'label' : jsonstr.monthlist[2]
					});
					self.comp('button2').set({
						'label' : jsonstr.monthlist[1]
					});
					self.comp('button3').set({
						'label' : jsonstr.monthlist[0]
					});
					self.get_current_echarts(jsonstr.monthlist[0]);
				},
				error : function(xhr) {
					// justep.Util.hint("错误，请检查网络");
				}
			});

		}
	};

	Model.prototype.get_current_echarts = function(month) {
		this.comp('contents1').to('content4');
		var params = {
			month : month,
			userid : userid
		};
		this.comp('windowContainer3').load(require.toUrl('./directagent_examination_echars.w'), params);
	};

	Model.prototype.toggle3Change = function(event) {

		// event.source.value = !event.source.value;
		// this.comp('toggle3').set({checked:!this.comp('toggle3').val()});
		var row = this.comp('examinationData').getFirstRow();
		this.comp('toggle3').val(row.val('examination'));
		this.comp('messageDialog1').show();
		return false;

	};

	Model.prototype.button1Click = function(event) {
		var params = {
			month : event.source.label,
			userid : userid
		};
		this.comp('windowContainer1').load(require.toUrl('./directagent_examination_echars.w'), params);
		// this.comp('windowContainer1').refresh();
	};

	Model.prototype.button2Click = function(event) {
		var params = {
			month : event.source.label,
			userid : userid
		};
		this.comp('windowContainer2').load(require.toUrl('./directagent_examination_echars.w'), params);
	};

	Model.prototype.button3Click = function(event) {
		var params = {
			month : event.source.label,
			userid : userid
		};
		this.comp('windowContainer3').load(require.toUrl('./directagent_examination_echars.w'), params);
	};

	Model.prototype.messageDialog1No = function(event) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/change_agent_examination',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				userid : userid,
				examination : !self.comp('toggle3').val()
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var row = self.comp('examinationData').getFirstRow();
				if (row.val('examination') == 1) {
					row.val('examination', 0)
				} else {
					row.val('examination', 1)
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.row1Click = function(event) {
		var params = {
			title : this.comp('titlebar1').get('title'),
			userid : userid
		}
		justep.Shell.showPage(require.toUrl("./change_directagentlevel.w"), params);
	};

	Model.prototype.modelLoad = function(event) {
		justep.Shell.on("agentdirectdetail_change_directagentlevel", this.agentdirectdetail_change_directagentlevel, this);
	};

	Model.prototype.agentdirectdetail_change_directagentlevel = function(agentlevel) {
		$(this.getElementByXid("span2")).text(agentlevel);
	};

	return Model;
});