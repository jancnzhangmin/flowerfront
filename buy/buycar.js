define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var UUID = require("$UI/system/lib/base/uuid");
	//require("css!../swiper-4.4.2/swiper.min").load();
	require("css!https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.min").load();
	//var Swiper = require("../swiper-4.4.2/swiper.min");
	var Swiper = require("https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js");
	var originalX = 0;
	var lastX = 0;
	var swiper;
	var agentuserid = 0;
	var destock = 0;
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.params.data) {
			if (event.params.data.type == 'product') {
				$(this.getElementByXid("backi")).css({
					'color' : '#333333'
				});
			}
		} else {
			$(this.getElementByXid("backi")).css({
				'color' : '#fff'
			});
		}
	};

	Model.prototype.modelLoad = function(event) {
		if (buycar.length > 0) {
			agentuserid = buycar[0].agentuserid;
			if (buycar[0].destock == 1) {
				this.comp('destockcheckbox').set({
					'checked' : true
				});
				destock = 1;
			}
			$.each(buycar, function(i, item) {
				item.isselect = 1;
			});
		}

		justep.Shell.on("buycar_change", this.buycar_change, this);
		this.refreshdata();
		$('#x-default-loadingbar').css('z-index', -1);
		justep.Shell.on("buycar_change_directagent", this.buycar_change_directagent, this);
		this.change_destck_status();
		this.get_agent_name();
		this.get_addmoney();
		this.check_agent_status();
		this.check_buycar();
		if (buycar.length == 0) {
			$(this.getElementByXid("addmoneyrow")).hide();
			$(this.getElementByXid("selectalli")).removeClass('my2-xuanzhong1');
			$(this.getElementByXid("selectalli")).removeClass('isselect');
			$(this.getElementByXid("selectalli")).addClass('my2-xuanzhong2');
			$(this.getElementByXid("selectalli")).addClass('text-muted');
		}
	};

	Model.prototype.check_agent_status = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/check_agent_status",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 30000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				if (jsonstr.status == 1) {
					$(self.getElementByXid("morecol")).show();
				}
				;
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.get_addmoney = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_addmoneyactive",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 30000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp("addmoneyData");
				data.clear();

				if (jsonstr.addmoneyactive.length) {
					var options = {
						defaultValues : [ {
							id : jsonstr.addmoneyactive[0].id,
							buynumber : jsonstr.addmoneyactive[0].buynumber,
							givenumber : jsonstr.addmoneyactive[0].givenumber,
							name : jsonstr.addmoneyactive[0].name,
							amount : jsonstr.addmoneyactive[0].amount,
							buyproductids : jsonstr.addmoneyactive[0].buyproductids,
							giveproductids : jsonstr.addmoneyactive[0].giveproductids,
							number : 0
						} ]
					};
					data.newData(options);
					var giveproductdata = self.comp("giveproductData");
					giveproductdata.clear();
					var giveproductids = jsonstr.addmoneyactive[0].giveproductids.split(',');
					$.each(giveproductids, function(i, item) {
						self.get_giveproducts(item);
					});
					$(self.getElementByXid("addmoneyspan")).text('加￥' + parseFloat(jsonstr.addmoneyactive[0].amount).toFixed(2) + '元换购');
					$(self.getElementByXid("addmoneypopspan")).text('加付金额 ￥' + parseFloat(jsonstr.addmoneyactive[0].amount).toFixed(2));

					self.cal_addmoney();
				}

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.get_giveproducts = function(productid) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_product_detail",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 30000,
			data : {
				product_id : productid,
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$.each(jsonstr.products, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							name : item.name,
							cover : publicurl + item.cover,
							number : 0
						} ]
					};
					self.comp("giveproductData").newData(options);
				});

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.check_trial_number = function() {
		var trialnumber = 0;
		var flag = false;
		this.comp('buycarData').each(function(param) {
			if (param.row.val('isselect') == 1 && param.row.val('trial') == 1) {
				trialnumber += parseInt(param.row.val('number'));
			}
			if (param.row.val('isselect') == 1 && param.row.val('trial') == 0) {
				flag = true;
			}
		});
		if (flag && trialnumber <= 10) {
			try {
				this.comp('settleBtn').set({
					'disabled' : false
				});
			} catch (e) {
			}
		} else {
			try {
				this.comp('settleBtn').set({
					'disabled' : true
				});
			} catch (e) {
			}
		}
	};

	Model.prototype.buycar_change_directagent = function(params) {
		if (params.agentuserid == 0) {
			$(this.getElementByXid("agentnamespan")).text('');
		} else {
			$(this.getElementByXid("agentnamespan")).text(params.name);
		}
		agentuserid = params.agentuserid;
		this.comp('buycarData').each(function(param) {
			param.row.val('agentuserid', agentuserid);
		});
		// this.change_destck_status();
	};

	Model.prototype.change_destck_status = function() {
		// var destock = this.comp('buycarData').getFirstRow();
		if ((agentuserid != 0 && agentuserid != undefined) || destock == 1) {
			$(this.getElementByXid("smartContainer4")).show();
			if (agentuserid != 0) {
				$(this.getElementByXid("directagentrow")).show();
			} else {
				$(this.getElementByXid("directagentrow")).hide();
			}
			if (destock == 1) {
				$(this.getElementByXid("destockrow")).show();
				this.comp('destockcheckbox').set({
					'checked' : true
				});
				// $(this.getElementByXid("destockcheckbox")).set({'checked':true});
			} else {
				$(this.getElementByXid("destockrow")).hide();
				this.comp('destockcheckbox').set({
					'checked' : false
				});
				// $(this.getElementByXid("destockcheckbox")).set({'checked':false});
			}
		} else {
			$(this.getElementByXid("smartContainer4")).hide();
		}

	};

	Model.prototype.get_agent_name = function() {
		if (agentuserid != 0 && agentuserid != undefined && agentuserid != null) {
			var self = this;
			$.ajax({
				async : true,
				url : publicurl + "api/get_directagent_detail",
				type : "GET",
				dataType : 'jsonp',
				jsonp : 'callback',
				timeout : 30000,
				data : {
					id : agentuserid
				},
				success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
					$(self.getElementByXid("agentnamespan")).text(jsonstr.agent.nickname + '(' + jsonstr.agent.name + ')');
					$(self.getElementByXid("span25")).text('给' + jsonstr.agent.nickname + '(' + jsonstr.agent.name + ')下单');
				},
				error : function(xhr) {
					// justep.Util.hint("错误，请检查网络");
				}
			});
		}
	};

	Model.prototype.buycar_change = function() {
		this.refreshdata();

	}

	Model.prototype.refreshdata = function() {

		var buycardata = this.comp('buycarData');
		buycardata.clear();
		var optionaldata = this.comp('optionalData');
		optionaldata.clear();
		var activedata = this.comp('activeData');
		activedata.clear();

		$.each(buycar, function(i, item) {
			var hasoptional = 0;
			if (item.buycaroptional.length > 0) {
				hasoptional = 1;
			}
			var uuid = new UUID().toString();
			var option = {
				defaultValues : [ {
					id : uuid,
					product_id : item.product_id,
					user_id : item.user_id,
					number : item.number,
					price : item.price,
					cost : item.cost,
					discount : item.discount,
					cover : publicurl + item.cover,
					firstprofit : item.firstprofit,
					secondprofit : item.secondprofit,
					owerprofit : item.owerprofit,
					producttype : item.producttype,
					openid : item.openid,
					name : item.name,
					subtitle : item.subtitle,
					hasoptional : hasoptional,
					agentuserid : item.agentuserid,
					destock : item.destock,
					isselect : item.isselect,
					trial : item.trial
				} ]
			}

			buycardata.newData(option);
			$.each(item.buycaroptional, function(oi, oitem) {
				var ouuid = new UUID().toString();
				var option = {
					defaultValues : [ {
						id : ouuid,
						selectcondition_id : oitem.selectcondition_id,
						selectcondition_name : oitem.selectcondition_name,
						buycar_id : uuid
					} ]
				}
				optionaldata.newData(option);
			});

			$.each(item.activetype, function(ai, aitem) {
				var auuid = new UUID().toString();
				var option = {
					defaultValues : [ {
						id : auuid,
						buycar_id : uuid,
						active : aitem.active,
						showlable : aitem.showlable,
						summary : aitem.summary,
						keywords : aitem.keywords
					} ]
				}
				activedata.newData(option);
			});
		});

		this.calower();

		swiper = new Swiper('.swiper-container', {
			slidesPerView : 'auto'
		});

		$('.menu').each(function(i, item) {
			$(item).height($(item.parentElement.children[0]).height());
		});

	};

	Model.prototype.subBtnClick = function(event) {
		this.changeNum('sub', event);
	};

	Model.prototype.addBtnClick = function(event) {
		this.changeNum('add', event);

	};

	Model.prototype.check_buycar = function() {
		var self = this;
		buycar = [];

		self.comp('buycarData').each(function(params) {
			var buycaroptionalparams = [];
			self.comp('optionalData').each(function(oparams) {
				if (oparams.row.val('buycar_id') == params.row.val('id')) {
					var optionalparams = {
						selectcondition_id : oparams.row.val('selectcondition_id'),
						selectcondition_name : oparams.row.val('selectcondition_name')
					}
					buycaroptionalparams.push(optionalparams);
				}
			});
			var buycarparams = {
				id : new UUID().toString(),
				product_id : params.row.val('product_id'),
				number : params.row.val('number'),
				producttype : params.row.val('producttype'),
				buycaroptional : buycaroptionalparams,
				producttype : params.row.val('producttype'),
				isselect : params.row.val('isselect')

			}
			if (params.row.val('producttype') == 0) {
				buycar.push(buycarparams);
			}
		});

		var fd = new FormData();

		fd.append("openid", openid);
		fd.append("data", JSON.stringify(buycar));
		fd.append("agentuserid", agentuserid);
		fd.append("destock", destock);
		// ////////////addmoney////////////////
		var addmoney = [];
		self.comp('addmoneyData').each(function(param) {
			var giveproduct = [];
			self.comp('giveproductData').each(function(gparam) {
				var goption = {
					id : gparam.row.val('id'),
					number : gparam.row.val('number'),
					name : gparam.row.val('name')
				};
				giveproduct.push(goption)
			});

			var option = {
				id : param.row.val('id'),
				buynumber : param.row.val('buynumber'),
				givenumber : param.row.val('givenumber'),
				name : param.row.val('name'),
				amount : param.row.val('amount'),
				buyproductids : param.row.val('buyproductids'),
				giveproductids : param.row.val('giveproductids'),
				number : param.row.val('number'),
				giveproduct : giveproduct
			};
			addmoney.push(option);
		});
		fd.append("addmoney", JSON.stringify(addmoney));
		// ///////////addmoney-end////////////

		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/submitbuycar",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				AddToBuycar(data.buycars);
				self.calower();
			},
			error : function() {

				// 错误
			}
		});
	};

	Model.prototype.changeNum = function(type, event) {
		var row = event.bindingContext.$object;
		if (type == 'sub') {
			row.val('number', parseFloat(row.val('number') - 1));
		} else if (type == 'add') {
			row.val('number', parseFloat(row.val('number') + 1));
		}

		// buycar{id,product_id,user_id,number,price,cost,discount,cover,firstprofit,secondprofit,owerprofit,
		// producttype,buycaroptional[id,buycar_id,select_optional,select_condition],activetype[id,buycar_id,active,showlable,summary,keywords],openid}
		var self = this;
		buycar = [];

		self.comp('buycarData').each(function(params) {
			var buycaroptionalparams = [];
			self.comp('optionalData').each(function(oparams) {
				if (oparams.row.val('buycar_id') == params.row.val('id')) {
					var optionalparams = {
						selectcondition_id : oparams.row.val('selectcondition_id'),
						selectcondition_name : oparams.row.val('selectcondition_name')
					}
					buycaroptionalparams.push(optionalparams);
				}
			});
			var buycarparams = {
				id : new UUID().toString(),
				product_id : params.row.val('product_id'),
				number : params.row.val('number'),
				producttype : params.row.val('producttype'),
				buycaroptional : buycaroptionalparams,
				producttype : params.row.val('producttype'),
				isselect : params.row.val('isselect')

			}
			if (params.row.val('producttype') == 0) {
				buycar.push(buycarparams);
			}
		});

		var fd = new FormData();

		fd.append("openid", openid);
		fd.append("data", JSON.stringify(buycar));
		fd.append("agentuserid", agentuserid);
		fd.append("destock", destock);
		// ////////////addmoney////////////////
		var addmoney = [];
		self.comp('addmoneyData').each(function(param) {
			var giveproduct = [];
			self.comp('giveproductData').each(function(gparam) {
				var goption = {
					id : gparam.row.val('id'),
					number : gparam.row.val('number'),
					name : gparam.row.val('name')
				};
				giveproduct.push(goption)
			});

			var option = {
				id : param.row.val('id'),
				buynumber : param.row.val('buynumber'),
				givenumber : param.row.val('givenumber'),
				name : param.row.val('name'),
				amount : param.row.val('amount'),
				buyproductids : param.row.val('buyproductids'),
				giveproductids : param.row.val('giveproductids'),
				number : param.row.val('number'),
				giveproduct : giveproduct
			};
			addmoney.push(option);
		});
		fd.append("addmoney", JSON.stringify(addmoney));
		// ///////////addmoney-end////////////

		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/submitbuycar",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				AddToBuycar(data.buycars);
				self.calower();

			},
			error : function() {

				// 错误
			}
		});
	};

	Model.prototype.calower = function() {
		var saveprofit = 0;
		var owerprofit = 0;
		var sumprice = 0;
		var giveproduct = false;
		this.comp('buycarData').each(function(params) {
			if (params.row.val('producttype') == 0) {
				saveprofit += parseFloat(params.row.val('number')) * parseFloat(params.row.val('discount'));
				owerprofit += parseFloat(params.row.val('number')) * parseFloat(params.row.val('owerprofit'));
				if (params.row.val('isselect') == 1) {
					sumprice += parseFloat(params.row.val('number')) * parseFloat(params.row.val('price'));
				}
			}
			if (params.row.val('producttype') == 1) {
				giveproduct = true;
			}
		});
		this.comp('addmoneyData').each(function(param) {
			sumprice += parseFloat(param.row.val('number') * parseFloat(param.row.val('amount')));
		});
		$(this.getElementByXid("span15")).text('节省了' + saveprofit.toFixed(2) + '元');
		$(this.getElementByXid("span16")).text('获得' + owerprofit.toFixed(2) + '元返现');
		$(this.getElementByXid("span19")).text('￥' + sumprice.toFixed(2));
		$(this.getElementByXid("smartContainer2")).hide();
		if (saveprofit > 0) {
			$(this.getElementByXid("row11")).show();
			$(this.getElementByXid("smartContainer2")).show();
		} else {
			$(this.getElementByXid("row11")).hide();
		}
		if (owerprofit > 0) {
			$(this.getElementByXid("row12")).show();
			$(this.getElementByXid("smartContainer2")).show();
		} else {
			$(this.getElementByXid("row12")).hide();
		}
		if (giveproduct) {
			$(this.getElementByXid("smartContainer2")).show();
		}
		this.check_trial_number();
		this.cal_addmoney();
	};

	Model.prototype.cal_addmoney = function() {
		var addmoneydata = this.comp('addmoneyData');
		if (addmoneydata.count() > 0) {
			var buyproductids = addmoneydata.getFirstRow().val('buyproductids').split(',');
			var accordcount = 0;
			this.comp('buycarData').each(function(param) {
				var inarr = $.inArray(param.row.val('product_id').toString(), buyproductids);
				if (inarr >= 0) {
					accordcount += param.row.val('number');
				}
				// debugger;
			});
			if (accordcount >= addmoneydata.getFirstRow().val('buynumber')) {
				$(this.getElementByXid("addmoneyrow")).show();
				$(this.getElementByXid("smartContainer2")).show();
			} else {
				$(this.getElementByXid("addmoneyrow")).hide();
			}
			var maxnumber = Math.floor(accordcount / parseInt(this.comp('addmoneyData').getFirstRow().val('buynumber')));// 可加购数量
			try {
				if (parseInt(addmoneydata.getFirstRow().val('number')) >= maxnumber) {
					this.comp('addmoneyaddbtn').set({
						'disabled' : true
					});
				} else {
					this.comp('addmoneyaddbtn').set({
						'disabled' : false
					});
				}
				if (maxnumber == 0) {
					var temcount = 0;
					this.comp('giveproductData').each(function(param) {
						temcount += parseInt(param.row.val('number'));
					});
					if (temcount > 0) {
						$(this.getElementByXid("addmoneyrow")).show();
					}
				}
			} catch (e) {
			}
		}
	};

	Model.prototype.row1Touchmove = function(event) {
		// $("#sanjiaoLeft").css("marginLeft",val);
		// debugger;
		// $(event.currentTarget).animate({'marginLeft':-(originalX -
		// event.originalEvent.targetTouches[0].clientX)},10);
		// movevalue = 2;
		// $(event.currentTarget).animate({'marginLeft':-(lastX -
		// event.originalEvent.targetTouches[0].clientX)},10);
		// lastX = event.originalEvent.targetTouches[0].clientX;
		var subvalue = originalX - event.originalEvent.targetTouches[0].clientX;
		$(event.currentTarget).css("marginLeft", -subvalue);
		// $(event.currentTarget).animate({
		// 'marginLeft' : -subvalue
		// }, 1);
		$(event.currentTarget.nextElementSibling).width(subvalue);
		// $(event.currentTarget).width($(event.currentTarget)+subvalue);
		// console.log(originalX -
		// event.originalEvent.targetTouches[0].clientX);

	};

	Model.prototype.row1Touchstart = function(event) {
		try {
			$(swiper).each(function(i, item) {
				item.slideTo(0, 300, false);
			});
		} catch (e) {
		}
		// this.movreset(event);
		// originalX = event.originalEvent.targetTouches[0].clientX -
		// parseInt($(event.currentTarget).css('marginLeft'));
		// $('.mov').height(event.currentTarget.clientHeight);
		// $(event.currentTarget.nextElementSibling).height(event.currentTarget.clientHeight);
		// $(event.currentTarget.nextElementSibling).css("marginTop",
		// -event.currentTarget.clientHeight);
	};

	Model.prototype.row1Touchend = function(event) {
		if ($(event.currentTarget.nextElementSibling).width() > 80) {
			$(event.currentTarget).animate({
				'marginLeft' : -160
			}, 100);
			$(event.currentTarget.nextElementSibling).animate({
				'width' : 160
			}, 100);
		} else {
			$(event.currentTarget).animate({
				'marginLeft' : 0
			}, 100);
			$(event.currentTarget.nextElementSibling).animate({
				'width' : 0
			}, 100);
		}
	};

	Model.prototype.movreset = function(event) {
		$('.movrow').each(function(i, item) {
			if (item.attributes.id != event.currentTarget.attributes.id) {
				$(item).animate({
					'marginLeft' : 0
				}, 100);
				$(item.nextElementSibling).animate({
					'width' : 0
				}, 100);
			}
		});

		// $('.movrow').animate({'marginLeft':0},100);
		// $('.mov').animate({'width':0},100);
	};

	Model.prototype.row1Click = function(event) {

		// swiper[2].slideTo(0, 1000, false);

	};

	Model.prototype.modelActive = function(event) {

	};

	Model.prototype.deletedivClick = function(event) {
		var row = event.bindingContext.$object;
		row.val('number', 0);
		var self = this;
		buycar = [];

		self.comp('buycarData').each(function(params) {
			var buycaroptionalparams = [];
			self.comp('optionalData').each(function(oparams) {
				if (oparams.row.val('buycar_id') == params.row.val('id')) {
					var optionalparams = {
						selectcondition_id : oparams.row.val('selectcondition_id'),
						selectcondition_name : oparams.row.val('selectcondition_name')
					}
					buycaroptionalparams.push(optionalparams);
				}
			});
			var buycarparams = {
				id : new UUID().toString(),
				product_id : params.row.val('product_id'),
				number : params.row.val('number'),
				producttype : params.row.val('producttype'),
				buycaroptional : buycaroptionalparams,
				producttype : params.row.val('producttype')
			}
			if (params.row.val('producttype') == 0) {
				buycar.push(buycarparams);
			}
		});

		var fd = new FormData();
		fd.append("openid", openid);
		fd.append("data", JSON.stringify(buycar));
		fd.append("agentuserid", agentuserid);
		fd.append("destock", destock);
		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/submitbuycar",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				AddToBuycar(data.buycars);
				self.calower();

			},
			error : function() {

				// 错误
			}
		});
	};

	Model.prototype.change_buycar = function() {
		var self = this;
		buycar = [];

		self.comp('buycarData').each(function(params) {
			var buycaroptionalparams = [];
			self.comp('optionalData').each(function(oparams) {
				if (oparams.row.val('buycar_id') == params.row.val('id')) {
					var optionalparams = {
						selectcondition_id : oparams.row.val('selectcondition_id'),
						selectcondition_name : oparams.row.val('selectcondition_name')
					}
					buycaroptionalparams.push(optionalparams);
				}
			});
			var buycarparams = {
				id : new UUID().toString(),
				product_id : params.row.val('product_id'),
				number : params.row.val('number'),
				producttype : params.row.val('producttype'),
				buycaroptional : buycaroptionalparams,
				producttype : params.row.val('producttype')
			}
			if (params.row.val('producttype') == 0) {
				buycar.push(buycarparams);
			}
		});

		// debugger;
		// if (this.comp('destockcheckbox').val() == true) {
		// destock = 1;
		// }

		// var row = self.comp('buycarData').getFirstRow();
		// if(row && row.val('destock') == 1){
		// destock = 1;
		// }

		var fd = new FormData();
		fd.append("openid", openid);
		fd.append("data", JSON.stringify(buycar));
		fd.append("agentuserid", agentuserid);
		fd.append("destock", destock);
		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/submitbuycar",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				AddToBuycar(data.buycars);
				self.calower();

			},
			error : function() {

				// 错误
			}
		});
	};

	Model.prototype.collcetiondivClick = function(event) {
		var row = event.bindingContext.$object;
		row.val('number', 0);
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/force_collection",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 30000,
			data : {
				openid : openid,
				product_id : row.val('product_id')
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
		buycar = [];

		self.comp('buycarData').each(function(params) {
			var buycaroptionalparams = [];
			self.comp('optionalData').each(function(oparams) {
				if (oparams.row.val('buycar_id') == params.row.val('id')) {
					var optionalparams = {
						selectcondition_id : oparams.row.val('selectcondition_id'),
						selectcondition_name : oparams.row.val('selectcondition_name')
					}
					buycaroptionalparams.push(optionalparams);
				}
			});
			var buycarparams = {
				id : new UUID().toString(),
				product_id : params.row.val('product_id'),
				number : params.row.val('number'),
				producttype : params.row.val('producttype'),
				buycaroptional : buycaroptionalparams,
				producttype : params.row.val('producttype')
			}
			if (params.row.val('producttype') == 0) {
				buycar.push(buycarparams);
			}
		});

		var fd = new FormData();
		fd.append("openid", openid);
		fd.append("data", JSON.stringify(buycar));
		fd.append("agentuserid", agentuserid);
		fd.append("destock", destock);
		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/submitbuycar",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				AddToBuycar(data.buycars);
				self.calower();

			},
			error : function() {

				// 错误
			}
		});
		var params = {
			id : row.val('product_id'),
			collection : 1
		}
		justep.Shell.fireEvent("topsale_change_collection", params);
		justep.Shell.fireEvent("productdetail_force_collection", this);
	};

	Model.prototype.settleBtnClick = function(event) {
		var self = this;
		var selectcount = 0;
		this.comp('buycarData').each(function(param) {
			if (param.row.val('producttype') == 1) {
				param.row.val('isselect', 1);
			}
			var paramap = [];
			var rows = self.comp('optionalData').find([ 'buycar_id' ], [ param.row.val('id') ]);
			$.each(rows, function(rowi, rowitem) {
				paramap.push(rowitem.val('selectcondition_id'));
			});
			paramap = paramap.sort();
			$.each(buycar, function(i, item) {
				var buymap = [];
				$.each(item.buycaroptional, function(oi, oitem) {
					buymap.push(oitem.selectcondition_id);
				});
				buymap = buymap.sort();
				if (item.product_id == param.row.val('product_id') && paramap.toString() == buymap.toString()) {
					item.isselect = param.row.val('isselect');
				}
			});
			if (param.row.val('isselect') == 1) {
				selectcount++;
			}
		});
		if (selectcount == 0) {
			return false;
		}
		if (!self.addmoney_submit_check()) {
			return false;
		}

		var params = {
			agentuserid : agentuserid,
			agentusertext : $(this.getElementByXid("span25")).text(),
			destock : destock
		}
		justep.Shell.showPage(require.toUrl("./confirmorder.w"), params);
	};

	Model.prototype.addmoney_submit_check = function() {
		var flag = true;
		if (this.comp('addmoneyData').count() > 0) {
			var buycount = 0;
			var buyproductids = this.comp('addmoneyData').getFirstRow().val('buyproductids').split(',');
			this.comp('buycarData').each(function(param) {
				var inarr = $.inArray(param.row.val('product_id').toString(), buyproductids);
				if (param.row.val('isselect') == 1 && inarr >= 0) {
					buycount += parseInt(param.row.val('number'));
				}
			});
			var maxnumber = Math.floor(buycount / parseInt(this.comp('addmoneyData').getFirstRow().val('buynumber')));// 可加购数量

			var givenumber = 0;
			this.comp('giveproductData').each(function(param) {
				givenumber += parseInt(param.row.val('number'));
			});

			if (parseInt(this.comp('addmoneyData').getFirstRow().val('number')) > maxnumber) {
				flag = false;
				justep.Util.hint("实际下单数量大于换购数量，请调整", {
					"tyep" : "info",
					"position" : "middle",
					"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
				});
			} else if (givenumber < parseInt(this.comp('addmoneyData').getFirstRow().val('number'))) {
				flag = false;
				justep.Util.hint("请选择换购商品", {
					"tyep" : "info",
					"position" : "middle",
					"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
				});
			} else if (givenumber > parseInt(this.comp('addmoneyData').getFirstRow().val('number'))) {
				flag = false;
				justep.Util.hint("换购商品大于换购数量，请调整", {
					"tyep" : "info",
					"position" : "middle",
					"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
				});
			}
		}
		return flag;
	};

	Model.prototype.morebuttonClick = function(event) {
		this.comp('directagentpopOver').show();
	};

	Model.prototype.closedirectagentpopiClick = function(event) {
		this.comp('directagentpopOver').hide();
	};

	Model.prototype.directagnetrowClick = function(event) {
		var params = {
			agentuserid : agentuserid
		};
		// justep.Shell.showPage(require.toUrl("./directagent.w"), params);
		this.comp('directagentpopOver').hide();
		this.comp('windowDialog1').open({
			src : require.toUrl("./directagent.w"),
			params : params
		});
	};

	Model.prototype.destockcheckboxChange = function(event) {

		if (this.comp('destockcheckbox').val() == true) {
			destock = 1;
		} else {
			destock = 0;
		}
		this.comp('buycarData').each(function(param) {
			param.row.val('destock', destock);
		});
		this.change_buycar();
		this.change_destck_status();
	};

	Model.prototype.windowDialog1Receive = function(event) {
		this.comp('directagentpopOver').show();
		if (event.data.agentuserid == 0) {
			$(this.getElementByXid("agentnamespan")).text('');
		} else {
			$(this.getElementByXid("agentnamespan")).text(event.data.name);
			$(this.getElementByXid("span25")).text('给' + event.data.name + '下单');
		}
		agentuserid = event.data.agentuserid;
		this.comp('buycarData').each(function(param) {
			param.row.val('agentuserid', agentuserid);
		});
		this.change_buycar();
		this.change_destck_status();
	};

	Model.prototype.selectiClick = function(event) {
		var row = event.bindingContext.$object;
		if (row.val('isselect') == 0) {
			row.val('isselect', 1);
		} else {
			row.val('isselect', 0);
		}
		var flag = true;
		this.comp('buycarData').each(function(param) {
			if (param.row.val('isselect') == 0) {
				flag = false
			}
		});
		if (flag) {
			$(this.getElementByXid("selectalli")).removeClass('my2-xuanzhong2');
			$(this.getElementByXid("selectalli")).removeClass('text-muted');
			$(this.getElementByXid("selectalli")).addClass('my2-xuanzhong1');
			$(this.getElementByXid("selectalli")).addClass('isselect');
		} else {
			$(this.getElementByXid("selectalli")).removeClass('my2-xuanzhong1');
			$(this.getElementByXid("selectalli")).removeClass('isselect');
			$(this.getElementByXid("selectalli")).addClass('my2-xuanzhong2');
			$(this.getElementByXid("selectalli")).addClass('text-muted');
		}
		this.calower();
	};

	Model.prototype.selectallbtnClick = function(event) {
		var flag = true;
		this.comp('buycarData').each(function(param) {
			if (param.row.val('isselect') == 0) {
				flag = false
			}
		});
		if (!flag) {
			this.comp('buycarData').each(function(param) {
				param.row.val('isselect', 1);
			});
			$(this.getElementByXid("selectalli")).removeClass('my2-xuanzhong2');
			$(this.getElementByXid("selectalli")).removeClass('text-muted');
			$(this.getElementByXid("selectalli")).addClass('my2-xuanzhong1');
			$(this.getElementByXid("selectalli")).addClass('isselect');
		} else {
			this.comp('buycarData').each(function(param) {
				param.row.val('isselect', 0);
			});
			$(this.getElementByXid("selectalli")).removeClass('my2-xuanzhong1');
			$(this.getElementByXid("selectalli")).removeClass('isselect');
			$(this.getElementByXid("selectalli")).addClass('my2-xuanzhong2');
			$(this.getElementByXid("selectalli")).addClass('text-muted');
		}
		this.calower();
	};

	Model.prototype.change_select_css = function(isselect, event) {
		if (isselect == 1) {
			$(event).removeClass('my2-xuanzhong2');
			$(event).removeClass('text-muted');
			$(event).addClass('my2-xuanzhong1');
			$(event).addClass('isselect');
		} else {
			$(event).removeClass('my2-xuanzhong1');
			$(event).removeClass('isselect');
			$(event).addClass('my2-xuanzhong2');
			$(event).addClass('text-muted');
		}

	};

	Model.prototype.cal_addmoney_max_number = function() {
		var buycarcount = 0;// 购物车中相符的产品数量
		var buyproductids = this.comp('addmoneyData').getFirstRow().val('buyproductids').split(',');
		this.comp('buycarData').each(function(param) {
			var inarr = $.inArray(param.row.val('product_id').toString(), buyproductids);
			if (inarr >= 0) {
				buycarcount += param.row.val('number');
			}
		});
		var max_number = Math.floor(buycarcount / parseInt(this.comp('addmoneyData').getFirstRow().val('buynumber')));// 可加购数量
		if (parseInt(this.comp('addmoneyData').getFirstRow().val('number')) >= max_number) {
			this.comp('addmoneyData').getFirstRow().val('number', max_number);
			this.comp('addmoneyaddbtn').set({
				'disabled' : true
			});
		} else {
			this.comp('addmoneyaddbtn').set({
				'disabled' : false
			});
		}
		$(this.getElementByXid("addmountcountspan")).text(
				'合计：￥' + (parseFloat(this.comp('addmoneyData').getFirstRow().val('number')) * parseFloat(this.comp('addmoneyData').getFirstRow().val('amount'))).toFixed(2) + '元');

		var self = this;
		buycar = [];

		self.comp('buycarData').each(function(params) {
			var buycaroptionalparams = [];
			self.comp('optionalData').each(function(oparams) {
				if (oparams.row.val('buycar_id') == params.row.val('id')) {
					var optionalparams = {
						selectcondition_id : oparams.row.val('selectcondition_id'),
						selectcondition_name : oparams.row.val('selectcondition_name')
					}
					buycaroptionalparams.push(optionalparams);
				}
			});
			var buycarparams = {
				id : new UUID().toString(),
				product_id : params.row.val('product_id'),
				number : params.row.val('number'),
				producttype : params.row.val('producttype'),
				buycaroptional : buycaroptionalparams,
				producttype : params.row.val('producttype'),
				isselect : params.row.val('isselect')

			}
			if (params.row.val('producttype') == 0) {
				buycar.push(buycarparams);
			}
		});

		var fd = new FormData();

		fd.append("openid", openid);
		fd.append("data", JSON.stringify(buycar));
		fd.append("agentuserid", agentuserid);
		fd.append("destock", destock);
		// ////////////addmoney////////////////
		var addmoney = [];
		self.comp('addmoneyData').each(function(param) {
			var giveproduct = [];
			self.comp('giveproductData').each(function(gparam) {
				var goption = {
					id : gparam.row.val('id'),
					number : gparam.row.val('number'),
					name : gparam.row.val('name')
				};
				giveproduct.push(goption)
			});

			var option = {
				id : param.row.val('id'),
				buynumber : param.row.val('buynumber'),
				givenumber : param.row.val('givenumber'),
				name : param.row.val('name'),
				amount : param.row.val('amount'),
				buyproductids : param.row.val('buyproductids'),
				giveproductids : param.row.val('giveproductids'),
				number : param.row.val('number'),
				giveproduct : giveproduct
			};
			addmoney.push(option);
		});
		fd.append("addmoney", JSON.stringify(addmoney));
		// ///////////addmoney-end////////////

		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/submitbuycar",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				AddToBuycar(data.buycars);
				self.calower();
			},
			error : function() {

				// 错误
			}
		});

	};

	Model.prototype.addmoneyrowClick = function(event) {
		this.comp('addmoneypopOver').show();
	};

	Model.prototype.addmoneycloseiClick = function(event) {
		this.comp('addmoneypopOver').hide();
	};

	Model.prototype.addmoneysubbtnClick = function(event) {
		this.comp('addmoneyData').getFirstRow().val('number', parseInt(this.comp('addmoneyData').getFirstRow().val('number')) - 1);
		if (parseInt(this.comp('addmoneyData').getFirstRow().val('number')) < 0) {
			this.comp('addmoneyData').getFirstRow().val('number', 0);
		}
		this.cal_addmoney_max_number();
	};

	Model.prototype.addmoneyaddbtnClick = function(event) {
		this.comp('addmoneyData').getFirstRow().val('number', parseInt(this.comp('addmoneyData').getFirstRow().val('number')) + 1);
		this.cal_addmoney_max_number();
	};

	Model.prototype.givesubbtnClick = function(event) {
		var row = event.bindingContext.$object;
		row.val('number', parseInt(row.val('number')) - 1);
		if (parseInt(row.val('number')) < 0) {
			row.val('number', 0);
		}
		this.cal_addmoney_max_number();
	};

	Model.prototype.giveaddbtnClick = function(event) {
		var row = event.bindingContext.$object;
		givenumber_count = 0;
		this.comp('giveproductData').each(function(param) {
			givenumber_count += parseInt(param.row.val('number'));
		});
		if (givenumber_count < parseInt(this.comp('addmoneyData').getFirstRow().val('number'))) {
			row.val('number', parseInt(row.val('number')) + 1);
			this.cal_addmoney_max_number();
		}
	};

	return Model;
});