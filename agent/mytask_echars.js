define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var echarts = require("../js/echarts/echarts.min");
	require("../js/echarts/macarons");
	var origin_data = [];
	var service_data = [];

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.params.keyword) {
			var self = this;
			$.ajax({
				async : true,
				url : publicurl + "api/get_mytask_echars_detail",
				type : "GET",
				dataType : 'jsonp',
				jsonp : 'callback',
				timeout : 5000,
				data : {
					openid : openid,
					keyword : event.params.keyword
				},
				success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

					self.bar(jsonstr);

				},
				error : function(xhr) {
					// justep.Util.hint("错误，请检查网络");
				}
			});
		}
	};

	Model.prototype.bar = function(jsonstr) {
		//origin_data = [ [ 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2, 0.0, 0.0, 0.0, 1, 0.0, 0.0, 0.0, 0.0, 15, 0.0, 0.0, 3, 0.0, 0.0, 0.0 ],
			//	[ 0.0, 0.0, 7, 0.0, 0.0, 2.2, 0.0, 0.0, 0.0, 3.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ],
				//[ 0.0, 0.0, 0.2, 0.0, 0.0, 0.5, 0.0, 0.3, 0.1, 0.0, 0.4, 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 ] ];
		origin_data = jsonstr.service_list;
		service_data = origin_data;
		var myChart = echarts.init(this.getElementByXid('main'), 'macarons');
		option = {
			backgroundColor : '#fff',
			grid : {
				x : 40,
				y : 40,
				x2 : 10,
				y2 : 30
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : jsonstr.month_list,
				top : '10px',
				left : 'left'
			},
			toolbox : {
				show : true,
				left : 'right',
				top : '5px',
				feature : {
					mark : {
						show : true
					},
					magicType : {
						show : true,
						type : [ 'bar', 'line' ]
					},
					restore : {
						show : false
					},
					saveAsImage : {
						show : false
					}
				}
			},
			calculable : true,
			xAxis : [ {
				type : 'category',
				axisTick : {
					show : false
				},
				data : jsonstr.day_list
			} ],
			yAxis : [ {
				type : 'value'
			} ],
			dataZoom : [ {
				type : 'inside'
			} ],
			series : [ {
				name : jsonstr.month_list[0],
				type : 'bar',
				barGap : 0,
				data : service_data[0],
				areaStyle : {}
			}, {
				name : jsonstr.month_list[1],
				type : 'bar',
				data : service_data[1],
				areaStyle : {}
			}, {
				name : jsonstr.month_list[2],
				type : 'bar',
				data : service_data[2],
				areaStyle : {}
			} ]

		};
		myChart.setOption(option);
		myChart.on('magictypechanged', function(params) {
			if (params.currentType == 'bar') {
				service_data = origin_data;

				option = {
					backgroundColor : '#fff',
					grid : {
						x : 40,
						y : 40,
						x2 : 10,
						y2 : 30
					},
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : jsonstr.month_list,
						top : '10px',
						left : 'left'
					},
					toolbox : {
						show : true,
						left : 'right',
						top : '5px',
						feature : {
							mark : {
								show : true
							},
							magicType : {
								show : true,
								type : [ 'bar', 'line' ]
							},
							restore : {
								show : false
							},
							saveAsImage : {
								show : false
							}
						}
					},
					calculable : true,
					xAxis : [ {
						type : 'category',
						axisTick : {
							show : false
						},
						data : jsonstr.day_list
					} ],
					yAxis : [ {
						type : 'value'
					} ],
					dataZoom : [ {
						type : 'inside'
					} ],
					series : [ {
						name : jsonstr.month_list[0],
						type : 'bar',
						barGap : 0,
						data : service_data[0],
						areaStyle : {}
					}, {
						name : jsonstr.month_list[1],
						type : 'bar',
						data : service_data[1],
						areaStyle : {}
					}, {
						name : jsonstr.month_list[2],
						type : 'bar',
						data : service_data[2],
						areaStyle : {}
					} ]

				};
				
				myChart.setOption(option);

			} else {
				service_data = [];
				$.each(origin_data, function(i, item) {
					var amount = 0.0;
					var tem_list = [];
					$.each(item, function(di, ditem) {
						amount += ditem;
						tem_list.push(amount);
					});
					service_data.push(tem_list);
				});

				option = {
					backgroundColor : '#fff',
					grid : {
						x : 40,
						y : 40,
						x2 : 10,
						y2 : 30
					},
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : jsonstr.month_list,
						top : '10px',
						left : 'left'
					},
					toolbox : {
						show : true,
						left : 'right',
						top : '5px',
						feature : {
							mark : {
								show : true
							},
							magicType : {
								show : true,
								type : [ 'bar', 'line' ]
							},
							restore : {
								show : false
							},
							saveAsImage : {
								show : false
							}
						}
					},
					calculable : true,
					xAxis : [ {
						type : 'category',
						axisTick : {
							show : false
						},
						data : jsonstr.day_list
					} ],
					yAxis : [ {
						type : 'value'
					} ],
					dataZoom : [ {
						type : 'inside'
					} ],
					series : [ {
						name : jsonstr.month_list[0],
						type : 'line',
						barGap : 0,
						data : service_data[0],
						areaStyle : {}
					}, {
						name : jsonstr.month_list[1],
						type : 'line',
						data : service_data[1],
						areaStyle : {}
					}, {
						name : jsonstr.month_list[2],
						type : 'line',
						data : service_data[2],
						areaStyle : {}
					} ]

				};

				myChart.setOption(option);
			}
		});
		
		var pieChart = echarts.init(this.getElementByXid('pie'), 'macarons');
		month_list = jsonstr.month_list;
		month_list.push('未完成');
		pieoption = {
    title: {
        text: '任务占比',
        subtext: '任务额度：' + jsonstr.taskquota,
        left: 'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{b} : {c} ({d}%)"
    },
    legend: {
        // orient: 'vertical',
        // top: 'middle',
        bottom: 10,
        left: 'center',
        data: month_list
    },
    series : [
        {
            type: 'pie',
            radius : '65%',
            center: ['50%', '50%'],
            selectedMode: 'single',
            data:[
                {
                    value:jsonstr.month_task_count[0],
                    name: jsonstr.month_list[0]
                },
                {value:jsonstr.month_task_count[1], name: month_list[1]},
                {value:jsonstr.month_task_count[2], name: month_list[2]},
                {value:jsonstr.sur_task, name: month_list[3]}
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};
		pieChart.setOption(pieoption);
		
	};

	return Model;
});