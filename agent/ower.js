define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

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
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
		justep.Shell.on("agent_ower_setphone", this.agent_ower_setphone, this);
	};
	
	Model.prototype.agent_ower_setphone = function(phone){
	$(this.getElementByXid("span7")).text(phone);
	};

	Model.prototype.toggle2Change = function(event){
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
				autoupgrade:self.comp('toggle2').val()
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.toggle3Change = function(event){
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
				showphone:self.comp('toggle3').val()
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.row4Click = function(event){
	var params = {
	phone:$(this.getElementByXid("span7")).text()
	}
justep.Shell.showPage(require.toUrl("./owerphone.w"),params);
	};

	Model.prototype.row2Click = function(event){
justep.Shell.showPage(require.toUrl("./agentcertificate.w"));
	};

	return Model;
});