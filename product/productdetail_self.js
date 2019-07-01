define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!../swiper-4.4.2/swiper.min").load();
	var Swiper = require("../swiper-4.4.2/swiper.min");
	var UUID = require("$UI/system/lib/base/uuid");
	require("../js/flower");
	var product_id = 0;
	var add_to_buycar_status = 0;// 加入购物车按钮识别，1点击加入购物车按钮；0点击选择条件按钮
	var buy_status = 0;// 0加入购物车，1立即购买
	var buy_number = 1;
	// var buynow = 0;// 立即购买
	var call_self = false;

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		var dom = this.getElementByXid('content1');

		$(dom).scroll(function() {
			var scrollvalue = $(dom).scrollTop() / ($(dom).width() - 45);
			if (scrollvalue > 0.95) {
				scrollvalue = 0.95;
			}
			var scroll_value = 1 - $(dom).scrollTop() / ($(dom).width() - 45);
			if (scroll_value > 0.65) {
				scroll_value = 0.65;
			}

			var scroll_font = (1 - $(dom).scrollTop() / ($(dom).width() - 45)) * 141 + 99;
			scroll_font = parseInt(scroll_font);
			if (scroll_font < 99) {
				scroll_font = 99;
			}

			$(self.getElementByXid("row1")).css('opacity', scrollvalue);

			$(self.getElementByXid("div15")).css({
				'background' : 'rgba(' + [ 85, 85, 85 ] + ',' + scroll_value + ')'
			});
			$(self.getElementByXid("div12")).css({
				'background' : 'rgba(' + [ 85, 85, 85 ] + ',' + scroll_value + ')'
			});

			$(self.getElementByXid("i16")).css({
				'color' : 'rgba(' + [ scroll_font, scroll_font, scroll_font ] + ',1)'
			});
			$(self.getElementByXid("i1")).css({
				'color' : 'rgba(' + [ scroll_font, scroll_font, scroll_font ] + ',1)'
			});
			// /////移动至详情////////
			var detail_offsettop = $(self.getElementByXid("row13"))[0].offsetTop - 45;
			var comment_offsettop = $(self.getElementByXid("row12"))[0].offsetTop - 45;
			var tuijian_offsettop = $(self.getElementByXid("row21"))[0].offsetTop - 45;
			if ($(dom).scrollTop() >= 0 && $(dom).scrollTop() < detail_offsettop) {
				self.comp('buttonGroup1').set({
					'selected' : 'button2'
				});
			} else if ($(dom).scrollTop() > detail_offsettop && $(dom).scrollTop() < comment_offsettop) {
				self.comp('buttonGroup1').set({
					'selected' : 'button3'
				});
			} else if ($(dom).scrollTop() > comment_offsettop && $(dom).scrollTop() < tuijian_offsettop) {
				self.comp('buttonGroup1').set({
					'selected' : 'button5'
				});
			} else if ($(dom).scrollTop() > tuijian_offsettop) {
				self.comp('buttonGroup1').set({
					'selected' : 'button6'
				});
			}

		});
		justep.Shell.on("productdetail_force_collection", this.productdetail_force_collection, this);
	};

	Model.prototype.refreshdata = function(productid) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_product_detail",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				product_id : productid,
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("productData");
				data.clear();
				$.each(jsonstr.products, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							name : item.name,
							price : parseFloat(item.price).toFixed(2),
							unit : item.unit,
							spec : item.spec,
							discount : item.discount,
							subtitle : item.subtitle,
							brand : item.brand,
							weight : item.weight,
							pack : item.pack,
							season : item.season,
							cover : publicurl + item.cover,
							baseprice : item.price
						} ]
					};
					data.newData(options);
					$(self.getElementByXid("contentdiv")).html(self.eachimg(item.content));
					$.each(item.images, function(imagei, imageitem) {
						var myimage = publicurl + imageitem;
						myimage = '<div class="swiper-slide"><img width=100% src=' + myimage + '></div>';
						$('.swiper-wrapper').append(myimage);
					});
					var mySwiper = new Swiper('.swiper-container', {
						loop : false
					// 循环模式选项
					});
					// ///////////////////////

					// ///////////////////////
					var activedata = self.comp("activetypeData");
					activedata.clear();
					$.each(item.activetype, function(activei, activeitem) {
						var icon = '';
						if (activeitem.keywords == 'second') {
							icon = 'my my-fenrunzhifu';
						} else if (activeitem.keywords == 'buyfull') {
							icon = 'my my-song';
						} else if (activeitem.keywords == 'limit') {
							icon = 'my my-xianshiyouhui';
						} else if (activeitem.keywords == 'firstbuy') {
							icon = 'my my-fanxian';
						}
						var options = {
							defaultValues : [ {
								id : activei,
								active : activeitem.active,
								showlable : activeitem.showlable,
								summary : activeitem.summary,
								keywords : activeitem.keywords,
								icon : icon
							} ]
						};
						activedata.newData(options);
					});
				});

				var optionaldata = self.comp("optionalData");
				optionaldata.clear();
				var conditiondata = self.comp("conditionData");
				conditiondata.clear();
				$.each(jsonstr.optionals, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							name : item.name,
							selectcondition_id : 0,
							selectcondition_name : item.name
						} ]
					};
					optionaldata.newData(options);
					$.each(item.condition, function(conditioni, conditionitem) {
						var options = {
							defaultValues : [ {
								id : conditionitem.id,
								optional_id : conditionitem.optional_id,
								name : conditionitem.name,
								weighting : conditionitem.weighting,
								isselect : 0
							} ]
						};
						conditiondata.newData(options);
					});
				});

				var explaindata = self.comp("explainData");
				explaindata.clear();
				$.each(jsonstr.explains, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							name : item.name,
							explain : item.explain
						} ]
					};
					explaindata.newData(options);
				});
				$(self.getElementByXid("span4")).text(jsonstr.freepost.content);
				if (jsonstr.collection == '1') {
					$(self.getElementByXid("i11")).removeClass('my-xinxingxian');
					$(self.getElementByXid("i11")).addClass('my-xinxingshi');
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
		// 获取买家相册
		$.ajax({
			async : true,
			url : publicurl + "api/get_comment_img_top",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				product_id : productid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("commentimgData");
				data.clear();
				$.each(jsonstr.commentimgs, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							commentimg : publicurl + item.commentimg
						} ]
					};
					data.newData(options);
				});
				$('.commentimgdiv').each(function(i, item) {
					$(item).height($(item).width());
					$(item).children(0).css('margin-top', ($(item).height() - $(item).children(0).height()) / 2);
				});
				$(self.getElementByXid("span36")).text('买家相册(' + jsonstr.commentimgcount + ')');
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});

		// 获取前3条用户评价
		$.ajax({
			async : true,
			url : publicurl + "api/get_comment_user_top",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				product_id : productid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("usercommentData");
				data.clear();
				$.each(jsonstr.comments, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							nickname : item.nickname,
							headurl : item.headurl,
							comment : item.comment,
							anonymous : item.anonymous
						} ]
					};
					data.newData(options);
				});
				$(self.getElementByXid("span47")).text('评价(' + jsonstr.commentcount + ')');
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});

	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.params.data) {
			product_id = event.params.data.id;
			this.refreshdata(event.params.data.id);
			this.get_tuijian(event.params.data.id);
		}
		if (event.params.data.call_self) {
			call_self = true;
		}
	};

	Model.prototype.chooserowClick = function(event) {
		add_to_buycar_status = 0;
		this.buyprocess();
	};

	Model.prototype.closepopbtnClick = function(event) {
		this.comp('choosepop').hide();
	};

	Model.prototype.span35Click = function(event) {
		var row = event.bindingContext.$object;
		var self = this;
		this.comp('conditionData').each(function(params) {
			if (params.row.val('optional_id') == row.val('optional_id')) {
				params.row.val('isselect', 0);
			}
		});
		row.val('isselect', 1);
		$.ajax({
			async : true,
			url : publicurl + "api/get_conditionimg",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				id : row.val('id')
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				if (jsonstr.status == 1) {
					$(self.getElementByXid("image1")).attr("src", publicurl + jsonstr.conditionimg);

				} else {
					var cover = self.comp('productData').getFirstRow().val('cover');
					$(self.getElementByXid("image1")).attr("src", cover);
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
		this.changeoptional();
	};

	Model.prototype.changeoptional = function() {
		var self = this;
		var baseprice = parseFloat(self.comp('productData').getFirstRow().val('baseprice'));
		self.comp('conditionData').each(function(conditiondata) {
			if (conditiondata.row.val('isselect') == 1) {
				self.comp('optionalData').each(function(optionaldata) {
					if (conditiondata.row.val('optional_id') == optionaldata.row.val('id')) {
						optionaldata.row.val('selectcondition_id', conditiondata.row.val('id'));
						optionaldata.row.val('selectcondition_name', conditiondata.row.val('name'));
						baseprice += parseFloat(conditiondata.row.val('weighting'));
					}
				});
			}
		});
		self.comp('productData').getFirstRow().val('price', baseprice.toFixed(2));
	};

	Model.prototype.eachimg = function(htmlstr) {
		var temstr = $($.parseHTML(htmlstr, document, true));
		temstr.find('img').each(function() {
			$(this).attr('src', publicurl + $(this).attr('src'));
			$(this).attr('width', '100%');
		});
		return temstr;
	};

	Model.prototype.content1Touchmove = function(event) {

	};

	Model.prototype.content1Touchend = function(event) {

	};

	Model.prototype.panel1Touchend = function(event) {

	};

	Model.prototype.button2Click = function(event) {
		// this.getElementByXid('content1').scrollTo(0,0);
		this.getElementByXid('content1').scrollTop = 0;
	};

	Model.prototype.button3Click = function(event) {
		// this.getElementByXid('content1').scrollTo(0,$(this.getElementByXid("row13"))[0].offsetTop
		// -45);
		this.getElementByXid('content1').scrollTop = $(this.getElementByXid("row13"))[0].offsetTop - 45;
	};

	Model.prototype.col11Click = function(event) {
		this.comp("ems_popOver").show();
	};

	Model.prototype.collectionBtnClick = function(event) {
		var self = this;
		var collection;
		if ($(this.getElementByXid("i11")).hasClass('my-xinxingxian')) {
			$(this.getElementByXid("i11")).removeClass('my-xinxingxian');
			$(this.getElementByXid("i11")).addClass('my-xinxingshi');
			collection = 1;
		} else {
			$(this.getElementByXid("i11")).removeClass('my-xinxingshi');
			$(this.getElementByXid("i11")).addClass('my-xinxingxian');
			collection = 0;
		}

		var params = {
			id : product_id,
			collection : collection
		}
		justep.Shell.fireEvent("topsale_change_collection", params);

		$.ajax({
			async : true,
			url : publicurl + "api/collection",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				product_id : product_id
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.col23Click = function(event) {// 加入购物车
		add_to_buycar_status = 1;
		buy_status = 0;
		this.buyprocess();
	};

	Model.prototype.buyprocess = function() {
		buy_number = 1;
		$(this.getElementByXid("numberlabel")).text(buy_number);
		this.comp('subBtn').set({
			'disabled' : true
		});
		if (this.comp('optionalData').count() > 0) {
			if (add_to_buycar_status == 1) {
				$(this.getElementByXid("row17")).hide();
				$(this.getElementByXid("row16")).show();
			} else {
				$(this.getElementByXid("row16")).hide();
				$(this.getElementByXid("row17")).show();
			}
			this.comp('choosepop').show();
		} else {
			this.addTocar();
		}
	};

	Model.prototype.AddSub = function(meth) {
		if (meth == 'add') {
			buy_number += 1;
		} else {
			buy_number -= 1;
		}
		$(this.getElementByXid("numberlabel")).text(buy_number);
		if (buy_number <= 1) {
			this.comp('subBtn').set({
				'disabled' : true
			});
		} else {
			this.comp('subBtn').set({
				'disabled' : false
			});
		}
	};

	Model.prototype.addBtnClick = function(event) {
		this.AddSub('add');
	};

	Model.prototype.subBtnClick = function(event) {
		this.AddSub('sub');
	};

	Model.prototype.popBtnClick = function(event) {
		var selectstatus = true;
		this.comp('optionalData').each(function(params) {
			if (params.row.val('selectcondition_id') == 0) {
				selectstatus = false;
			}
		});

		if (!selectstatus) {
			return false;
		} else {
			this.comp('choosepop').hide();
			this.addTocar();
		}
		var params = {
			data : {
				type : 'product'
			}
		// type:product由产品跳转
		}
		if (buy_status == 1) {
			buy_status = 0;
			justep.Shell.showPage(require.toUrl("../buy/buycar.w"), params);
		}

	};

	Model.prototype.addTocar = function() {
		// buycar{id,product_id,user_id,number,price,cost,discount,cover,firstprofit,secondprofit,owerprofit,
		// producttype,buycaroptional[id,buycar_id,select_optional,select_condition],activetype[id,buycar_id,active,showlable,summary,keywords],openid}
		var buycaroptionalparams = []
		this.comp('optionalData').each(function(params) {
			var optionalparams = {
				selectcondition_id : params.row.val('selectcondition_id'),
				selectcondition_name : params.row.val('selectcondition_name')
			}
			buycaroptionalparams.push(optionalparams);
		});
		var buycarparams = {
			id : new UUID().toString(),
			product_id : product_id,
			number : buy_number,
			buycaroptional : buycaroptionalparams,
			producttype : 0
		}

		buycar.push(buycarparams);
		var fd = new FormData();
		fd.append("openid", openid);
		fd.append("data", JSON.stringify(buycar));

		$.ajax({
			type : "POST",
			async : false,
			url : publicurl + "api/submitbuycar",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				AddToBuycar(data.buycars);
			},
			error : function() {

				// 错误
			}
		});
		if (buy_status == 0) {
			justep.Util.hint("已加入购物车", {
				"tyep" : "info",
				"position" : "middle",
				"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
			});
		}
		// var oReq = new XMLHttpRequest();
		// oReq.open("POST", publicurl + "api/submitbuycar", true);
		// oReq.send(fd);
	};

	Model.prototype.col24Click = function(event) {
		buy_status = 1;
		if (this.comp('optionalData').count() > 0) {
			this.buyprocess();
			return false;
		} else {
			this.addTocar();
		}
		var selectstatus = true;
		this.comp('optionalData').each(function(params) {
			if (params.row.val('selectcondition_id') == 0) {
				selectstatus = false;
			}
		});
		if (!selectstatus) {
			return false;
		}
		var params = {
			data : {
				type : 'product'
			}
		// type:product由产品跳转
		}
		if (buy_status == 1) {
			buy_status = 0;
			justep.Shell.showPage(require.toUrl("../buy/buycar.w"), params);
		}

	};

	Model.prototype.popbuyBtnClick = function(event) {

		buy_stauts = 1;
		var selectstatus = true;
		this.comp('optionalData').each(function(params) {
			if (params.row.val('selectcondition_id') == 0) {
				selectstatus = false;
			}
		});

		if (!selectstatus) {
			return false;
		} else {
			this.comp('choosepop').hide();
			this.addTocar();
		}
		var params = {
			data : {
				type : 'product'
			}
		// type:product由产品跳转
		}
		buy_status = 0;
		justep.Shell.showPage(require.toUrl("../buy/buycar.w"), params);
	};

	Model.prototype.productdetail_force_collection = function(params) {
		$(this.getElementByXid("i11")).removeClass('my-xinxingxian');
		$(this.getElementByXid("i11")).addClass('my-xinxingshi');
	};

	Model.prototype.i1Click = function(event) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/check_subscribe",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				if (jsonstr.status != 0) {
					self.pop_subscribe();
				} else {
					var params = {
						data : {
							id : product_id,
							name : $(self.getElementByXid("span11")).text()
						}
					}
					justep.Shell.showPage(require.toUrl("./share_qr.w"), params);
				}
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.pop_subscribe = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_sysqr",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("sysqrimg")).attr('src', publicurl + jsonstr.sysqr);
				self.comp('subscribe_popOver').show();
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.list8AfterRender = function(event) {

	};

	Model.prototype.smartContainer2Click = function(event) {
		var params = {
			data : {
				product_id : product_id
			}
		}
		justep.Shell.showPage(require.toUrl("./commitimg.w"), params);
	};

	Model.prototype.button5Click = function(event) {
		this.getElementByXid('content1').scrollTop = $(this.getElementByXid("row12"))[0].offsetTop - 45;
	};

	Model.prototype.comment_smartContainerClick = function(event) {
		var params = {
			data : {
				product_id : product_id
			}
		}
		justep.Shell.showPage(require.toUrl("./usercomment.w"), params);
	};

	Model.prototype.get_tuijian = function(productid) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_productdetail_tuijian_list',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				productid : productid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("product_tuijian_Data");
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
								collection : item.collection
							} ]
						};
						if (productid != item.id) {
							data.newData(options);
						}
					}
				});
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.button6Click = function(event) {
		this.getElementByXid('content1').scrollTop = $(this.getElementByXid("row21"))[0].offsetTop - 45;
	};

	Model.prototype.div25Click = function(event) {
		var row = event.bindingContext.$object;
		if (call_self) {
			var params = {
				data : {
					id : row.val('id')
				}
			}
			justep.Shell.showPage(require.toUrl("./productdetail.w"), params);
		} else {
			var params = {
				data : {
					id : row.val('id'),
					call_self : true
				}
			}
			justep.Shell.showPage(require.toUrl("./productdetail_self.w"), params);
		}
	};

	return Model;
});