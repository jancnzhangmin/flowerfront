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
			url : publicurl + '/api/get_join_agent_list',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var agentleveldata = self.comp('agentlevelData');
				agentleveldata.clear();
				$.each(jsonstr.agentlevels, function(i, item) {
				var low = '';
				if(item.name.substring(0,1) == '一'){
				low = '1';
				}else if(item.name.substring(0,1) == '二'){
				low = '2';
				}else{
				low = '3';
				}
					var options = {
						defaultValues : [ {
							id : item.id,
							name : item.name,
							amount : parseFloat(item.amount).toFixed(2),
							task : parseFloat(item.task).toFixed(2),
							deposit : parseFloat(item.deposit).toFixed(2),
							low:low
						} ]
					};
					agentleveldata.newData(options);
				});

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.getbackcolor = function(index) {
		var step = 0;
		var color = '';
		this.comp('colorData').each(function(param) {
			if (step == index) {
			color = param.row.val('color');
			}
			step++;
		});
		return color;
	};

	return Model;
});