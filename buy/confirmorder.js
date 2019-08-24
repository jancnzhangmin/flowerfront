define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var UUID = require("$UI/system/lib/base/uuid");
	var address_id = 0;
	var UUID = require("$UI/system/lib/base/uuid");
	var wx = require("http://res.wx.qq.com/open/js/jweixin-1.4.0.js");
	var frontuuid = '';
	var price = 0;
	var banlance = 0;
	var localbuycar = [];
	var surbuycar = [];
	var deduction = 0;// 抵扣
	var mergeorderids = [];
	var pwdstep = 0;
	var adcode = '';// 行政区域代码
	var sumprice = 0;
	var postage = 0;// 邮费
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		sumprice = 0;
		postage = 0;
		localbuycar = [];
		surbuycar = [];
		if (localbuycar.length == 0) {
			frontuuid = new UUID().toString();
			$.each(buycar, function(i, item) {
				if (item.isselect == 1) {
					localbuycar.push(item);
				} else {
					surbuycar.push(item);
				}
			});
			// localbuycar = buycar;
		}
		this.refresh_receive();
		this.refreshdata();
		justep.Shell.on("confirmorder_refreshaddress", this.confirmorder_refreshaddress, this);
	};

	Model.prototype.refresh_receive = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_address_list',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$.each(jsonstr.receiptaddrs, function(i, item) {
					if (item.isdefault == 1) {
						$(self.getElementByXid("span1")).text('收货人：' + item.contact);
						$(self.getElementByXid("span2")).text(item.contactphone);
						$(self.getElementByXid("span3")).text('收货地址：' + item.province + item.city + item.district + item.street + item.address);
						address_id = item.id;
						adcode = item.adcode;
						self.check_postage();
					}
				});

			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.refreshdata = function() {

		var buycardata = this.comp('buycarData');
		buycardata.clear();
		var optionaldata = this.comp('optionalData');
		optionaldata.clear();
		var activedata = this.comp('activeData');
		activedata.clear();

		$.each(buycar, function(i, item) {

			if (item.isselect == 1) {
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
						hasoptional : hasoptional
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
			}
		});
		this.calower();

		$('.menu').each(function(i, item) {
			$(item).height($(item.parentElement.children[0]).height());
		});

	};

	Model.prototype.calower = function() {
		var saveprofit = 0;
		var owerprofit = 0;
		sumprice = 0;
		sumprice += postage;

		this.comp('buycarData').each(function(params) {
			if (params.row.val('producttype') == 0) {
				saveprofit += parseFloat(params.row.val('number')) * parseFloat(params.row.val('discount'));
				owerprofit += parseFloat(params.row.val('number')) * parseFloat(params.row.val('owerprofit'));
				sumprice += parseFloat(params.row.val('number')) * parseFloat(params.row.val('price'));
			}else if(params.row.val('producttype') == 1){
				sumprice += parseFloat(params.row.val('number')) * parseFloat(params.row.val('price'));
			}
		});
		$(this.getElementByXid("span15")).text('节省了' + saveprofit.toFixed(2) + '元');
		$(this.getElementByXid("span16")).text('获得' + owerprofit.toFixed(2) + '元返现');
		$(this.getElementByXid("span19")).text('￥' + sumprice.toFixed(2));
		if (saveprofit > 0) {
			$(this.getElementByXid("row11")).show();
		} else {
			$(this.getElementByXid("row11")).hide();
		}
		if (owerprofit > 0) {
			$(this.getElementByXid("row12")).show();
		} else {
			$(this.getElementByXid("row12")).hide();
		}
		$(this.getElementByXid("span19")).text('￥' + sumprice.toFixed(2));
		$(this.getElementByXid("postagespan")).text('￥' + postage.toFixed(2));
	};

	Model.prototype.subBtnClick = function(event) {

	};

	Model.prototype.addBtnClick = function(event) {

	};

	Model.prototype.letterdivClick = function(event) {
		var url = require.toUrl('../ower/receiptaddress.w');
		var params = {
			type : 'order'
		}
		justep.Shell.showPage(url, params);
	};

	Model.prototype.check_postage = function() {
		productarr = [];
		this.comp('buycarData').each(function(param) {
			if (param.row.val('producttype') == 0) {
				var option = {
					id : param.row.val('product_id'),
					number : param.row.val('number')
				}
				productarr.push(option);
			}
		});
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_postage',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				productarr : productarr,
				adcode : adcode
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				postage = parseFloat(jsonstr.postage);
				self.calower();
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.confirmorder_refreshaddress = function(params) {
		var self = this;
		address_id = params.address_id;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_appoint_address',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				address_id : address_id
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$(self.getElementByXid("span1")).text('收货人：' + jsonstr.receiptaddr.contact);
				$(self.getElementByXid("span2")).text(jsonstr.receiptaddr.contactphone);
				$(self.getElementByXid("span3")).text(
						'收货地址：' + jsonstr.receiptaddr.province + jsonstr.receiptaddr.city + jsonstr.receiptaddr.district + jsonstr.receiptaddr.street + jsonstr.receiptaddr.address);
				adcode = jsonstr.receiptaddr.adcode;

				self.check_postage();
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.submitBtnClick = function(event) {
		if (address_id == 0) {
			justep.Util.hint("收货地址不能为空", {
				"tyep" : "info",
				"position" : "middle",
				"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
			});
			return false;
		}
		justep.Shell.fireEvent("buycar_change", this);
		var params = {
			number : 0
		}
		justep.Shell.fireEvent("buycar_change_buynumber", params);
		var self = this;
		this.comp('payBtn').set({
			'disabled' : true
		});
		this.comp('popOver1').show();
		var fd = new FormData();
		fd.append("openid", openid);
		fd.append("data", JSON.stringify(localbuycar));
		fd.append("frontuuid", frontuuid);
		fd.append("address_id", address_id);
		fd.append("summary", this.comp('textarea1').val());
		$.ajax({
			type : "POST",
			async : true,
			url : publicurl + "api/buycar_to_order",
			data : fd,
			contentType : false,
			processData : false,
			success : function(data) {
				// 成功
				$(self.getElementByXid("span23")).text("￥" + parseFloat(data.price).toFixed(2));
				self.comp('payBtn').set({
					'disabled' : false
				});
				if (data.paytype == 0) {
					$(self.getElementByXid("span25")).text('微信支付');
				} else if (data.paytype == 1) {
					$(self.getElementByXid("span25")).text('货款支付');
				} else if (data.paytype == 2) {
					$(self.getElementByXid("span25")).text(data.agentname + '的货款支付');
				} else if (data.paytype == 3) {
					$(self.getElementByXid("span25")).text(data.agentname + '的货款不足');
					self.comp('payBtn').set({
						'disabled' : true
					});
				}

				justep.Shell.fireEvent("ower_refresh_unpay_count", self);
				self.submit_buycar();
				orderid = data.orderid;
				self.mergepaycallback();
				// localbuycar = [];
			},
			error : function(e) {
				// 错误
			}
		});
	};

	Model.prototype.submit_buycar = function() {
		var self = this;
		var agentuserid = 0;
		var destock = 0;
		if (buycar.length > 0) {
			agentuserid = buycar[0].agentuserid;
			destock = buycar[0].destock;
		}
		buycar = [];
		var fd = new FormData();
		fd.append("openid", openid);
		fd.append("data", JSON.stringify(surbuycar));
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
			},
			error : function() {

				// 错误
			}
		});
	};

	Model.prototype.i9Click = function(event) {
		this.comp('popOver1').hide();
	};

	Model.prototype.toggle1Change = function(event) {

		if (this.comp('toggle1').get('checked')) {
			deduction = balance;
			price -= balance;
			balance -= deduction;
			if (price < 0) {
				balance -= price;
				price -= price;
				deduction -= balance;
			}

		} else {
			price += deduction;
			balance += deduction;
			deduction = 0;
		}
		$(this.getElementByXid("span23")).text("￥" + price.toFixed(2));
		$(this.getElementByXid("span25")).text("可用余额：￥" + balance.toFixed(2));
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (parseInt(event.params.agentuserid) != 0 || parseInt(event.params.destock) == 1) {
			$(this.getElementByXid("smartContainer3")).show();
			if (parseInt(event.params.agentuserid) != 0) {
				$(this.getElementByXid("paytoagentrow")).show();
				$(this.getElementByXid("paytoagentspan")).text(event.params.agentusertext);
			} else {
				$(this.getElementByXid("paytoagentrow")).hide();
			}
			if (parseInt(event.params.destock) == 1) {
				$(this.getElementByXid("destockrow")).show();
			} else {
				$(this.getElementByXid("destockrow")).hide();
			}
		}

	};

	Model.prototype.mergepaycallback = function() {
		mergeorderids = [];
		mergeorderids.push(orderid);
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_merge_unpayorders",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				mergeorderids : mergeorderids
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				self.comp('payBtn').set({
					'disabled' : false
				});
				var data = self.comp('paystatusData');
				data.clear();
				paysum = 0;
				$.each(jsonstr.paystatus, function(i, item) {
					var option = {
						defaultValues : [ {
							id : item.id,
							paytype : item.paytype,
							paysummary : item.paysummary,
							paysum : parseFloat(item.paysum).toFixed(2)
						} ]
					}
					data.newData(option);
					if (item.paytype == 3) {
						self.comp('payBtn').set({
							'disabled' : true
						});
					}
					paysum += parseFloat(item.paysum);
				});
				$(self.getElementByXid("span23")).text("￥" + paysum.toFixed(2));
				$(self.getElementByXid("span31")).text("￥" + paysum.toFixed(2));
				self.comp('popOver1').show();
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.payBtnClick = function(event) {
		var self = this;
		this.comp('popOver1').hide();
		var flag = false;
		this.comp('paystatusData').each(function(param) {
			if (param.row.val('paytype') == 0) {
				self.wxpay();
			} else {
				self.comp('passwordpopOver').show();
			}
		});
	};

	Model.prototype.forgetbtnClick = function(event) {
		justep.Shell.showPage(require.toUrl("../ower/change_password.w"));
	};

	Model.prototype.wxpay = function() {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/wx_pay",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				mergeorderids : mergeorderids,
				url : window.location.href
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				wx.config({
					debug : false,
					appId : jsonstr.sign_packge.appId,
					url : jsonstr.sign_packge.url,
					timestamp : jsonstr.sign_packge.timestamp,
					nonceStr : jsonstr.sign_packge.nonceStr,
					signature : jsonstr.sign_packge.signature,
					jsApiList : [ 'chooseWXPay' ]
				});
				wx.ready(function() {
					// window.weixin_ready = true;
					wx.chooseWXPay({
						timestamp : jsonstr.pay_ticket_param.timeStamp, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
						nonceStr : jsonstr.pay_ticket_param.nonceStr, // 支付签名随机串，不长于
						// 32 位
						package : jsonstr.pay_ticket_param.package, // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***
						signType : jsonstr.pay_ticket_param.signType, // 签名方式，默认为"SHA1"，使用新版支付需传入"MD5"
						paySign : jsonstr.pay_ticket_param.paySign, // 支付签名
						success : function(res) {
							// alert("支付成功");
							// self.close();
							self.paysuccess();
						}
					});
				});

				wx.error(function() {

					// window.weixin_ready = false;
				});
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.paysuccess = function() {
		this.comp('passwordpopOver').hide();
		// self.refreshdata();
		justep.Util.hint("支付成功", {
			"tyep" : "info",
			"position" : "middle",
			"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
		});
		justep.Shell.fireEvent("ower_refresh_unpay_count", self);
		justep.Shell.fireEvent("ower_undeliver_count", self);
		this.close();
	}

	return Model;
});