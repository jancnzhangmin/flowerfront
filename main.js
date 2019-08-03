define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("./js/flower");
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.button3Click = function(event){
//justep.Shell.on("buycar_change", this.buycar_change, this);
this.comp('windowContainer2').refresh();
	};
	
	Model.prototype.buycar_change_buynumber = function(params){
	if(params.number > 0){
	$(this.getElementByXid("label2")).text(params.number);
	$(this.getElementByXid("label2")).show();
	}else{
	$(this.getElementByXid("label2")).hide();
	}
	};

	Model.prototype.modelLoad = function(event){
	
			var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_buycar",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
AddToBuycar(jsonstr.buycars);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	
justep.Shell.on("buycar_change_buynumber", this.buycar_change_buynumber, this);

	};
	


	Model.prototype.topsalecontentActive = function(event){

	};

	return Model;
});