define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var UUID = require("$UI/system/lib/base/uuid");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.params.id) {
			var self = this;
			$.ajax({
				async : true,
				url : publicurl + "/api/query_express",
				type : "GET",
				dataType : 'jsonp',
				jsonp : 'callback',
				timeout : 10000,
				data : {
					orderid : event.params.id
				},
				success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
					var expressdata = self.comp('expressData');
					expressdata.clear();
					var detaildata = self.comp('detailData');
					detaildata.clear();
					$.each(jsonstr.express, function(i, item) {
					var message = null;
					try{
					message = JSON.parse(item.message);
					}catch(e){}
					var status ='';
					if(item.status == 0){
					status = '在途';
					}else if(item.status == 1){
					status = '揽收';
					}else if(item.status == 2){
					status = '疑难';
					}else if(item.status == 3){
					status = '签收';
					}else if(item.status == 4){
					status = '退签';
					}else if(item.status == 5){
					status = '派件';
					}else if(item.status == 6){
					status = '退回';
					}
						var express_options = {
							defaultValues : [ {
								id : i,
								name : item.name,
								nu : item.num,
								state : status
							} ]
						};
						expressdata.newData(express_options);
						if(message && message.lastResult){
						var ffirst = 1;
						$.each(message.lastResult.data, function(di, ditem) {
							var detail_options = {
								defaultValues : [ {
									id : new UUID().toString(),
									express_id : i,
									ftime : ditem.ftime,
									context : ditem.context,
									ffirst:ffirst
								} ]
							};
							detaildata.newData(detail_options);
							ffirst = 0;
						});
						}
					});

				},
				error : function(xhr) {
					// justep.Util.hint("错误，请检查网络");
				}
			});
		}
	};

	return Model;
});