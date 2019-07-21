define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var echarts = require("../js/echarts/echarts.min");
	require("../js/echarts/macarons");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		var self = this;
		var myChart = echarts.init(self.getElementByXid('main'),'macarons');
		$.ajax({
			async : true,
			url : publicurl + '/api/get_directagent_echarts',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				month : event.params.month,
				userid : event.params.userid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var option = {
					backgroundColor : '#fff',
					grid : {
						x : 40,
						y : 30,
						x2 : 10,
						y2 : 30
					},
					xAxis : [ {
						type : 'category',
						data : jsonstr.axis_data
					} ],
					yAxis : [ {
						type : 'value',
						splitArea : {
							show : true
						}
					} ],
					dataZoom : [ {
						type : 'inside'
					} ],
					series : [ {
						name : '任务',
						type : 'bar',
						data : jsonstr.series_data
					} ]
				};
				
				myChart.setOption(option);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});

	};

	Model.prototype.modelLoad = function(event){

	};

	return Model;
});