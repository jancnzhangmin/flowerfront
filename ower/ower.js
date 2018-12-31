define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		$(this.getElementByXid("smartContainer1")).height($(window).width() * 0.6);
		this.refreshdata();
		justep.Shell.on("ower_refresh", this.ower_refresh, this);
	};

	Model.prototype.ower_refresh = function() {
		this.refreshdata();
	};

	Model.prototype.row10Click = function(event) {
		justep.Shell.showPage(require.toUrl("./receiptaddress.w"));
	};

	Model.prototype.refreshdata = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_collection',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("span18")).text(jsonstr.collectioncount);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.row9Click = function(event) {
		justep.Shell.showPage(require.toUrl("./mycollection.w"));
	};

	Model.prototype.div1Click = function(event){
justep.Shell.showPage(require.toUrl("./register.w"));
	};

	return Model;
});