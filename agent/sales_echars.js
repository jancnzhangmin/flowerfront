define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var echarts = require("../js/echarts/echarts.min");
	require("../js/echarts/macarons");

	// require("http://api.map.baidu.com/api?v=2.0&ak=9XW0meqlCG0LXuTpjW5Pv9I4H9qMCgWr");
	var map;

	var pkeyword = '';

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		pkeyword = event.params.keyword;
		this.get_sales_count(event.params.keyword);
		this.get_sales_echars(event.params.keyword);
		var self = this;
		require('../js/echarts/extension/bmap');
		require([ 'http://api.map.baidu.com/api?v=2.0&ak=9XW0meqlCG0LXuTpjW5Pv9I4H9qMCgWr&callback=_baiduInit' ], function() {
			if (!(window.BMap && window.BMap.apiLoad)) {
				// window._baiduInit();
				self.get_map(event.params.keyword);
			}
		});

	};

	Model.prototype.get_sales_count = function(keyword) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_sales_count",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				keyword : keyword
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("usercountspan")).text(jsonstr.usercount);
				$(self.getElementByXid("salesumspan")).text('￥' + parseFloat(jsonstr.salesum).toFixed(2));
				$(self.getElementByXid("ordercountspan")).text(jsonstr.ordercount);
				$(self.getElementByXid("incomesum")).text('￥' + parseFloat(jsonstr.incomesum).toFixed(2));
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.get_sales_echars = function(keyword) {
		var self = this;
		var myChart = echarts.init(self.getElementByXid('salesdiv'), 'macarons');
		$.ajax({
			async : true,
			url : publicurl + '/api/get_sales_echars',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				keyword : keyword
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

	Model.prototype.modelLoad = function(event) {
		var self = this;
		window._baiduInit = function() {
			self.get_map(pkeyword);
			// map = new BMap.Map(self.getIDByXID("allmap")); // 创建Map实例
			// var point = new BMap.Point(116.404, 39.915); // 创建点坐标
			// map.centerAndZoom(point, 15);
			// map.enableScrollWheelZoom(); //启用滚轮放大缩小
		}

	};

	Model.prototype.get_map = function(keyword) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_sales_map',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				keyword : keyword
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数




				option = {
					title : {
						text : '消费能力',
						left : 'center'
					},
					tooltip : {
						trigger :'item',
						 formatter: function (param) { return param.name + ': ' + param.value[2];
                        }
					},
					bmap : {
						center : [ 104.114129, 37.550339 ],
						zoom : 4,
						roam : true,
						mapStyle : {
							styleJson : [ {
								'featureType' : 'water',
								'elementType' : 'all',
								'stylers' : {
									'color' : '#d1d1d1'
								}
							}, {
								'featureType' : 'land',
								'elementType' : 'all',
								'stylers' : {
									'color' : '#f3f3f3'
								}
							}, {
								'featureType' : 'railway',
								'elementType' : 'all',
								'stylers' : {
									'visibility' : 'off'
								}
							}, {
								'featureType' : 'highway',
								'elementType' : 'all',
								'stylers' : {
									'color' : '#fdfdfd'
								}
							}, {
								'featureType' : 'highway',
								'elementType' : 'labels',
								'stylers' : {
									'visibility' : 'off'
								}
							}, {
								'featureType' : 'arterial',
								'elementType' : 'geometry',
								'stylers' : {
									'color' : '#fefefe'
								}
							}, {
								'featureType' : 'arterial',
								'elementType' : 'geometry.fill',
								'stylers' : {
									'color' : '#fefefe'
								}
							}, {
								'featureType' : 'poi',
								'elementType' : 'all',
								'stylers' : {
									'visibility' : 'off'
								}
							}, {
								'featureType' : 'green',
								'elementType' : 'all',
								'stylers' : {
									'visibility' : 'off'
								}
							}, {
								'featureType' : 'subway',
								'elementType' : 'all',
								'stylers' : {
									'visibility' : 'off'
								}
							}, {
								'featureType' : 'manmade',
								'elementType' : 'all',
								'stylers' : {
									'color' : '#d1d1d1'
								}
							}, {
								'featureType' : 'local',
								'elementType' : 'all',
								'stylers' : {
									'color' : '#d1d1d1'
								}
							}, {
								'featureType' : 'arterial',
								'elementType' : 'labels',
								'stylers' : {
									'visibility' : 'off'
								}
							}, {
								'featureType' : 'boundary',
								'elementType' : 'all',
								'stylers' : {
									'color' : '#fefefe'
								}
							}, {
								'featureType' : 'building',
								'elementType' : 'all',
								'stylers' : {
									'color' : '#d1d1d1'
								}
							}, {
								'featureType' : 'label',
								'elementType' : 'labels.text.fill',
								'stylers' : {
									'color' : '#999999'
								}
							} ]
						}
					},
					series : [ {
						name : '消费能力',
						type : 'scatter',
						coordinateSystem : 'bmap',
						data : jsonstr.data,
						symbolSize : function(val) {
							return val[2] * parseFloat(jsonstr.scale);
						},
						label : {
							normal : {
								formatter : '{b}',
								position : 'right',
								show : false
							},
							emphasis : {
								show : true
							}
						},
						itemStyle : {
							normal : {
								color : '#800080'
							}
						}
					}, {
						name : 'Top 10',
						type : 'effectScatter',
						coordinateSystem : 'bmap',
						data : jsonstr.datasort,
						symbolSize : function(val) {
							return val[2] * parseFloat(jsonstr.scale);
						},
						showEffectOn : 'render',
						rippleEffect : {
							brushType : 'stroke'
						},
						hoverAnimation : true,
						label : {
							normal : {
								formatter : '{b}',
								position : 'right',
								show : true
							}
						},
						itemStyle : {
							normal : {
								color : '#800080',
								shadowBlur : 10,
								shadowColor : '#333'
							}
						},
						zlevel : 1
					} ]
				};
				

				// 获取百度地图实例，使用百度地图自带的控件
				var chart = echarts.init(self.getElementByXid('allmap'));
				chart.setOption(option);
				var bmap = chart.getModel().getComponent('bmap').getBMap();
				bmap.addControl(new BMap.MapTypeControl());
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});

	};

	return Model;
});