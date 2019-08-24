define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
var UUID = require("$UI/system/lib/base/uuid");
	var Model = function(){
		this.callParent();
	};

	Model.prototype.list1AfterRender = function(event){

	};
	
	Model.prototype.refreshdata = function(){
			var self = this;
		$.ajax({
			async : false,
			url : publicurl + "api/get_recommend_product",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("productData");
				data.clear();
				$.each(jsonstr.products, function(i, item) {
					if (item.producttype == 0) {
						var odd = 0;
						odd = i % 2;
						var options = {
							defaultValues : [ {
								id : item.id,
								name : item.name,
								price : item.price,
								unit : item.unit,
								spec : item.spec,
								pinyin : item.pinyin,
								fullpinyin : item.fullpinyin,
								subtitle : item.subtitle,
								cover : publicurl + item.cover,
								odd : odd,
								discount : item.discount,
								collection : item.collection,
								displaysale:item.displaysale,
								salecount:item.salecount,
								agentprice:item.agentprice
							} ]
						};
						data.newData(options);
					}
				});
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.modelLoad = function(event){
	this.check_useragent_status();
//this.refreshdata();
	};

	Model.prototype.div25Click = function(event){
		if (event.target.localName == 'i') {
			return false;
		}
		var row = event.bindingContext.$object;
		var params = {
			data : {
				id : row.val('id')
			}
		}
		justep.Shell.showPage(require.toUrl("./productdetail.w"), params);
	};

	Model.prototype.i5Click = function(event){
		var row = event.bindingContext.$object;
		var rows = this.comp('productData').find([ 'id' ], [ row.val('id') ]);
		var collection = 0;
		if (rows[0].val('collection') == 0) {
			rows[0].val('collection', 1);
			collection = 1;
		} else {
			rows[0].val('collection', 0);
		}

		var params = {
			id : row.val('id'),
			collection : collection
		}
		justep.Shell.fireEvent("product_collection", params);

		var self = this;

		$.ajax({
			async : false,
			url : publicurl + "api/collection",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				product_id : row.val('id')
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				justep.Shell.fireEvent("ower_refresh", this);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.modelParamsReceive = function(event){
	if(!event.params.data)
	{
	return;
	}
			var self = this;
		$.ajax({
			async : false,
			url : publicurl + "api/get_cla_product",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				keyword:event.params.data.keyword
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("productData");
				data.clear();
								var activedata = self.comp('activetypeData');
				activedata.clear();
				self.comp('titleBar1').set({'title':jsonstr.cla});
				$.each(jsonstr.products, function(i, item) {
					if (item.producttype == 0) {
						var odd = 0;
						//odd = i % 2;
						var options = {
							defaultValues : [ {
								id : item.id,
								name : item.name,
								price : item.price,
								unit : item.unit,
								spec : item.spec,
								pinyin : item.pinyin,
								fullpinyin : item.fullpinyin,
								subtitle : item.subtitle,
								cover : publicurl + item.cover,
								odd : odd,
								discount : item.discount,
								collection : item.collection,
								displaysale:item.displaysale,
								salecount:item.salecount,
								agentprice:item.agentprice
							} ]
						};
						data.newData(options);
												$.each(item.activetype, function(ai, aitem) {
							var options = {
								defaultValues : [ {
									id : new UUID().toString(),
									product_id : item.id,
									active : aitem.active,
									showlable : aitem.showlable,
									summary : aitem.summary,
									keywords : aitem.keywords
								} ]
							};
							activedata.newData(options);
						});
					}
				});
				
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};
	
		Model.prototype.check_useragent_status = function() {
		var self = this;
		$.ajax({
			async : false,
			url : publicurl + "api/check_agent_status",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("agentstatusData");
				data.clear();
				var options = {
					defaultValues : [ {
						status : jsonstr.status
					} ]
				};
				data.newData(options);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};
	
		Model.prototype.active_showlable = function(productid) {
		result = false;
		var rows = this.comp('activetypeData').find([ 'product_id' ], [ productid ]);
		if (rows.length > 0) {
			$.each(rows, function(i, item) {
				if (item.val('showlable') == 1) {
					result = true;
				}
			});
		}
		return result;
	};
	
	Model.prototype.active_text = function(productid){
	result = '';
			var rows = this.comp('activetypeData').find([ 'product_id' ], [ productid ]);
		if (rows.length > 0) {
			$.each(rows, function(i, item) {
				if (item.val('showlable') == 1) {
					result = item.val('active');
				}
			});
		}
		return result;
	};

	return Model;
});