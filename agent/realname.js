define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var idfrontsize = 0;
	var idbacksize = 0;
	var timer;

	var Model = function() {
		this.callParent();
	};

	Model.prototype.idfrontinputChange = function(event) {
		var self = this;
		if ($(self.getElementByXid("idfrontinput")).val()) {
			var oFile = event.target.files[0];
			var vFD = new FormData();
			vFD.append("idfront", oFile);
			vFD.append('openid', openid);
			oXHR = new XMLHttpRequest();
			oXHR.addEventListener('load', function(resUpload) {
				// 成功
				$(self.getElementByXid("idfrontspan")).css({
					"position" : "relative",
					"display" : "inline-block",
					"overflow" : "hidden",
					"background-image" : "url(" + publicurl + JSON.parse(resUpload.currentTarget.response).idfront + ")",
					"background-size" : "100% 100%",
					"width" : "300px",
					"height" : "188px"
				});
				idfrontsize = JSON.parse(resUpload.currentTarget.response).idfrontsize;
			}, false);
			oXHR.open('POST', publicurl + "api/set_idcard");
			oXHR.send(vFD);
		}
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_idcard",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				if (jsonstr.idfrontsize > 0) {
					idfrontsize = jsonstr.idfrontsize;
					$(self.getElementByXid("idfrontspan")).css({
						"position" : "relative",
						"display" : "inline-block",
						"overflow" : "hidden",
						"background-image" : "url(" + publicurl + jsonstr.idfront + ")",
						"background-size" : "100% 100%",
						"width" : "300px",
						"height" : "188px"
					});
				}
				if (jsonstr.idbacksize > 0) {
					idbacksize = jsonstr.idbacksize;
					$(self.getElementByXid("idbackspan")).css({
						"position" : "relative",
						"display" : "inline-block",
						"overflow" : "hidden",
						"background-image" : "url(" + publicurl + jsonstr.idback + ")",
						"background-size" : "100% 100%",
						"width" : "300px",
						"height" : "188px"
					});
				}
				self.comp('nameinput').val(jsonstr.name);
				self.comp('phoneinput').val(jsonstr.phone);
				if(jsonstr.adjust == 1){
				$(self.getElementByXid("adjustsummaryrow")).show();
				$(self.getElementByXid("adjustsummaryspan")).text(jsonstr.adjustsummary);
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});

	};

	Model.prototype.idbackinputChange = function(event) {
		var self = this;
		if ($(self.getElementByXid("idbackinput")).val()) {
			var oFile = event.target.files[0];
			var vFD = new FormData();
			vFD.append("idback", oFile);
			vFD.append('openid', openid);
			oXHR = new XMLHttpRequest();
			oXHR.addEventListener('load', function(resUpload) {
				// 成功
				$(self.getElementByXid("idbackspan")).css({
					"position" : "relative",
					"display" : "inline-block",
					"overflow" : "hidden",
					"background-image" : "url(" + publicurl + JSON.parse(resUpload.currentTarget.response).idback + ")",
					"background-size" : "100% 100%",
					"width" : "300px",
					"height" : "188px"
				});
				idbacksize = JSON.parse(resUpload.currentTarget.response).idbacksize;
			}, false);
			oXHR.open('POST', publicurl + "api/set_idcard");
			oXHR.send(vFD);
		}
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

	Model.prototype.submitbtnClick = function(event) {
		var flag = true;
		var msg = '';
		if (!this.comp('nameinput').val()) {
			flag = false;
			msg = '姓名不能为空';
		}
		if (!this.comp('phoneinput').val()) {
			flag = false;
			msg = '手机号码不能为空';
		}

		if (idfrontsize == 0) {
			flag = false;
			msg = '请上传身份证正面照片';
		}

		if (idbacksize == 0) {
			flag = false;
			msg = '请上传身份证背面照片';
		}

		if (!flag) {
			justep.Util.hint(msg, {
				"tyep" : "info",
				"position" : "middle",
				"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
			});
			return false;
		}

		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/validation_user_vcode",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				vcode : self.comp('vcodeinput').val()
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				if (jsonstr.status == 1) {
					var vFD = new FormData();
					vFD.append('openid', openid);
					vFD.append("complete", '1');
					vFD.append("name", self.comp('nameinput').val());
					oXHR = new XMLHttpRequest();
					oXHR.addEventListener('load', function(resUpload) {
						justep.Shell.fireEvent("agent_change_realname", self);
						self.close();
					}, false);
					oXHR.open('POST', publicurl + "api/set_idcard");
					oXHR.send(vFD);
				} else {
					justep.Util.hint("验证码无效", {
						"tyep" : "info",
						"position" : "middle",
						"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
					});
				}

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});

	};

	return Model;
});