define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function(){
		this.callParent();
	};

	Model.prototype.savebtnClick = function(event){
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/set_agentphone',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				agentphone:self.comp('input1').val()
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
justep.Shell.fireEvent("agent_ower_setphone", self.comp('input1').val());
self.close();
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.modelParamsReceive = function(event){
if(event.params.phone){
this.comp('input1').val(event.params.phone);
}
	};

	return Model;
});