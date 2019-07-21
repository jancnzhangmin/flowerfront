define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var realnamestatus = 0;
	var examinestatus = 0;
	var adjust = 0;

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_self_agent',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("span2")).text(jsonstr.agentlevel);
				$(self.getElementByXid("span5")).text('￥' + parseFloat(jsonstr.agentpayment).toFixed(2));
				$(self.getElementByXid("span12")).text('￥' + parseFloat(jsonstr.deposit).toFixed(2));
				$(self.getElementByXid("span7")).text(jsonstr.phone);
				if (jsonstr.showphone == 1) {
					self.comp('toggle3').set({
						'checked' : true
					});
				} else {
					self.comp('toggle3').set({
						'checked' : false
					});
				}
				if (jsonstr.autoupgrade == 1) {
					self.comp('toggle2').set({
						'checked' : true
					});
				} else {
					self.comp('toggle2').set({
						'checked' : false
					});
				}
				realnamestatus = jsonstr.realnamestatus;
				examinestatus = jsonstr.examinestatus;
				adjust = jsonstr.adjust;
				if (realnamestatus == 0) {
					$(self.getElementByXid("realnamespan")).text('未实名');
				} else if (adjust == 1) {
					$(self.getElementByXid("realnamespan")).text('需要调整');
				} else if (examinestatus == 1) {
					$(self.getElementByXid("realnamespan")).text('审核中');
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
		justep.Shell.on("agent_ower_setphone", this.agent_ower_setphone, this);
		justep.Shell.on("agent_change_realname", this.agent_change_realname, this);
	};

	Model.prototype.agent_ower_setphone = function(phone) {
		$(this.getElementByXid("span7")).text(phone);
	};

	Model.prototype.agent_change_realname = function(params) {
		realnamestatus = 1;
		examinestatus = 1;
		$(this.getElementByXid("realnamespan")).text('审核中');
	};

	Model.prototype.toggle2Change = function(event) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/set_autoupgrade',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				autoupgrade : self.comp('toggle2').val()
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.toggle3Change = function(event) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/set_showphone',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				showphone : self.comp('toggle3').val()
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.row4Click = function(event) {
		var params = {
			phone : $(this.getElementByXid("span7")).text()
		}
		justep.Shell.showPage(require.toUrl("./owerphone.w"), params);
	};

	Model.prototype.row2Click = function(event) {
		if (realnamestatus == 0 || adjust == 1) {
			justep.Shell.showPage(require.toUrl("./realname.w"));
		} else if (realnamestatus == 1 && examinestatus == 0 && adjust == 0) {
			justep.Shell.showPage(require.toUrl("./agentcertificate.w"));
		}
	};

	return Model;
});