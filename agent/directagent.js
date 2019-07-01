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
			url : publicurl + '/api/get_directagent_list',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var directagentdata = self.comp('directagentData');
				directagentdata.clear();
				$.each(jsonstr.directagents, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							nickname : item.nickname,
							agentpayment : parseFloat(item.agentpayment).toFixed(2),
							examination : parseFloat(item.examination).toFixed(2),
							headurl : item.headurl,
							name : item.name,
							agentlevel : item.agentlevel,
							phone:item.phone
						} ]
					};
					directagentdata.newData(options);
				});

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.a1Click = function(event){
event.currentTarget.href = "tel:" + event.currentTarget.text; 
	};

	Model.prototype.li1Click = function(event){
	var row = event.bindingContext.$object;
	var params = {
	title:row.val('nickname') + '(' + row.val('name') + ')',
	id:row.val('id')
	}
justep.Shell.showPage(require.toUrl("./agentdirectdetail.w"),params);
	};

	return Model;
});