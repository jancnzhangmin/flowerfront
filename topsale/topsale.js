define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("css!../swiper-4.4.2/swiper.min").load();
	var Swiper = require("../swiper-4.4.2/swiper.min");
	var Model = function() {
		this.callParent();
	};
	var page_width = 0;
	var wxwebsocket = new WebSocket(publicws);
	var publictime;
	var topSwiper;
	var swiperindex = 0;

	Model.prototype.modelLoad = function(event) {
		topSwiper = new Swiper(this.getElementByXid('topswiperdiv'), {
			direction : 'vertical', // 垂直切换选项
			loop : true, // 循环模式选项
			autoplay : {
				disableOnInteraction : false,
			}

		});
		topSwiper.allowTouchMove = false;
		this.refreshdata();
		page_width = $(document).width();
		justep.Shell.on("topsale_change_collection", this.topsale_change_collection, this);
		this.check_useragent_status();
		this.get_wxmessage();

		wxwebsocket = new WebSocket(publicws);
		wxwebsocket.onopen = function() {
			var identifier = '"{"channel":"WxmessageChannel"}"';
			identifier = identifier.substring(1, identifier.length - 1);
			var param = {
				command : 'subscribe',
				identifier : identifier
			}
			this.send(JSON.stringify(param));

		};

		var self = this;

		wxwebsocket.onmessage = function(evt) {
			if (JSON.parse(evt.data).identifier && JSON.parse(evt.data).message) {
				self.add_wxmessage(JSON.parse(evt.data).message);
			}
			// console.log(JSON.stringify(evt.data));
		};

		publictime = setInterval(function() {
			if (wxwebsocket.readyState == 3) {
				self.get_websocket_msg();
			}
			// console.log(topSwiper.autoplay.paused);
			// console.log(window.location.href.indexOf('topsalecontent'));
			if (topSwiper.autoplay.paused) {
				topSwiper.slideTo(0);
				topSwiper.autoplay.stop();
				topSwiper.autoplay.start();
			}

			// console.log(wxwebsocket.readyState);
			$('.timespan').each(function(i, el) {
				difftime = self.timediff($(el).attr('value'));
				$(el).text(difftime);
			});
		}, 10000);
		self.redirect();
	};
	
		Model.prototype.redirect = function(){
	if(ctype == 'product'){
			var params = {
			data : {
				id : cid
			}
		}
		ctype = null;
		cid = null
		justep.Shell.showPage(require.toUrl("../product/productdetail.w"), params);
	}
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

	Model.prototype.topsale_change_collection = function(params) {
		var rows = this.comp('productData').find([ 'id' ], [ params.id ]);
		rows[0].val('collection', params.collection);
	};

	Model.prototype.refreshdata = function() {
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
								agentprice : item.agentprice,
								displaysale:item.displaysale,
								salecount:item.salecount
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

	Model.prototype.list1AfterRender = function(event) {
		$('.imagediv').height($('.imagediv').width());
		$('.follow').css("marginLeft", $('.imagediv').width() - 30);
		$('.follow').css("marginTop", $('.imagediv').width() - 30);
	};

	Model.prototype.i5Click = function(event) {
		// if(event.target.className.includes("my-xinxingxian")){
		// event.target.classList.replace('my-xinxingxian', 'my-xinxingshi');
		// }else{
		// event.target.classList.replace('my-xinxingshi', 'my-xinxingxian');
		// }
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

		// if ($(this.getElementByXid("i11")).hasClass('my-xinxingxian')) {
		// $(this.getElementByXid("i11")).removeClass('my-xinxingxian');
		// $(this.getElementByXid("i11")).addClass('my-xinxingshi');
		// } else {
		// $(this.getElementByXid("i11")).removeClass('my-xinxingshi');
		// $(this.getElementByXid("i11")).addClass('my-xinxingxian');
		// }
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

	Model.prototype.div25Click = function(event) {
		if (event.target.localName == 'i') {
			return false;
		}
		var row = event.bindingContext.$object;
		var params = {
			data : {
				id : row.val('id')
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productdetail.w"), params);

	};

	Model.prototype.keyClick = function(event) {
		this.comp('serachpopOver').show();
		$(this.getElementByXid("searchinput")).val($(this.getElementByXid("key")).attr('placeholder'));
		$(this.getElementByXid("searchinput")).focus();
	};

	Model.prototype.search = function(searchkey) {
		var self = this;
		$.ajax({
			async : false,
			url : publicurl + "api/get_search",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				search : searchkey
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("searchData");
				data.clear();
				$.each(jsonstr.products, function(i, item) {

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
							cover : publicurl + item.cover
						} ]
					};
					data.newData(options);

				});
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.cancelsearchBtnClick = function(event) {
		this.comp('serachpopOver').hide();
	};

	Model.prototype.searchinputKeyup = function(event) {
		search = event.currentTarget.value;
		if (search.length > 0) {
			this.search(search);
		} else {
			this.comp("searchData").clear();
		}
	};

	Model.prototype.div33Click = function(event) {
		var row = event.bindingContext.$object;
		var params = {
			data : {
				id : row.val('id')
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productdetail.w"), params);
	};

	Model.prototype.yjmhcolClick = function(event) {
		var params = {
			data : {
				keyword : 'yjmh'
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productlist.w"), params);
	};

	Model.prototype.azlcolClick = function(event) {
		var params = {
			data : {
				keyword : 'azl'
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productlist.w"), params);
	};

	Model.prototype.cysycolClick = function(event) {
		var params = {
			data : {
				keyword : 'cysy'
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productlist.w"), params);
	};

	Model.prototype.peccolClick = function(event) {
		var params = {
			data : {
				keyword : 'pec'
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productlist.w"), params);
	};

	Model.prototype.cpqmcolClick = function(event) {
		var params = {
			data : {
				keyword : 'cpqm'
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productlist.w"), params);
	};

	Model.prototype.hctjcolClick = function(event) {
		var params = {
			data : {
				keyword : 'hctj'
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productlist.w"), params);
	};

	Model.prototype.czyhcolClick = function(event) {
		var params = {
			data : {
				keyword : 'czyh'
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productlist.w"), params);
	};

	Model.prototype.cjtjcolClick = function(event) {
		var params = {
			data : {
				keyword : 'cjtj'
			}
		}
		justep.Shell.showPage(require.toUrl("../product/productlist.w"), params);
	};

	Model.prototype.get_websocket_msg = function() {
	var self = this;
		wxwebsocket = new WebSocket(publicws);
		wxwebsocket.onopen = function() {
			var identifier = '"{"channel":"WxmessageChannel"}"';
			identifier = identifier.substring(1, identifier.length - 1);
			var param = {
				command : 'subscribe',
				identifier : identifier
			}
			this.send(JSON.stringify(param));
		};

		wxwebsocket.onmessage = function(evt) {
			if (JSON.parse(evt.data).identifier && JSON.parse(evt.data).message) {
				self.add_wxmessage(JSON.parse(evt.data).message);
			}
		};
	};

	Model.prototype.add_wxmessage = function(jsonstr) {
		var data = this.comp("wxmessageData");
		var self = this;
		data.clear();
		$.each(JSON.parse(jsonstr.message), function(i, item) {
			var options = {
				defaultValues : [ {
					id : item.id,
					name : item.name,
					message : item.message,
					created_at : item.created_at,
					timesummary : self.timediff(item.created_at)
				} ]
			};
			data.newData(options);
		});
	};

	Model.prototype.modelActive = function(event) {

	};

	Model.prototype.get_wxmessage = function() {
		var self = this;
		$.ajax({
			async : false,
			url : publicurl + "api/get_wxmessage",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("wxmessageData");
				data.clear();
				$.each(jsonstr.wxmessages, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							name : item.name,
							message : item.message,
							created_at : item.created_at,
							timesummary : self.timediff(item.created_at)
						} ]
					};
					data.newData(options);
				});
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.timediff = function(endtime) {
		var diff = (new Date() - new Date(endtime)) / 1000 / 60;
		diff = parseInt(diff.toString());
		var summary = '刚刚';
		if (diff > 4320) {
			summary = '3天前';
		} else if (diff > 2880) {
			summary = '2天前';
		} else if (diff >= 1440) {
			summary = '1天前';
		} else if (diff >= 60 && diff < 1440) {
			summary = (parseInt(diff / 60).toString()).toString() + '小时前';
		} else if (diff > 1) {
			summary = diff + '分钟前';
		} else {
			summary = '刚刚';
		}
		return summary;
	};

	Model.prototype.wxmessageDataDataChange = function(event) {

	};

	Model.prototype.wxmessageDataAfterNew = function(event) {
		var self = this;
		if (this.comp('wxmessageData').count() > 0) {
			topSwiper.removeAllSlides();
		}
		this.comp('wxmessageData').each(
				function(param) {
					var swiper = $('<div class="swiper-slide" style="padding-top:10px;"></div>');
					var namespan = $('<span></span>');
					namespan.text(param.row.val('name') + ' ' + param.row.val('message'));
					var timespan = $('<span class="text-muted pull-right timespan" value="' + param.row.val('created_at') + '"></span>');
					timespan.text(param.row.val('timesummary'));
					swiper.append(namespan);
					swiper.append(timespan);
					// topSwiper.appendSlide(swiper);

					var maindiv = $('<div class="swiper-slide"></div>');
					var table = $('<table width="100%" height="40px"><tr><td valign="middle"><div style="display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 2;overflow: hidden;">' + param.row.val('name')
							+ ' ' + param.row.val('message') + '</div></td><td valign="middle" width="60px"><div class="text-right text-muted"><span class="text-muted pull-right timespan" value="'
							+ param.row.val('created_at') + '">' + param.row.val('timesummary') + '</span></div></td></tr></table>');
					maindiv.append(table);
					topSwiper.appendSlide(maindiv);
				});
		// topSwiper.slideTo(0);

		topSwiper.update();
	};

	Model.prototype.hotcolClick = function(event) {

	};

	return Model;
});