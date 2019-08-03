define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var wx = require("http://res.wx.qq.com/open/js/jweixin-1.4.0.js");
	var orderid = 0;
	var price = 0;
	var banlance = 0;
	var localbuycar;
	var deduction = 0;// 抵扣
	var page = 1;
	var paytype = 0;// 0微信支付 1货款支付 2代理货款支付 3代理货款不足
	var agentname = '';
	var pwdstep = 0;
	var mergeorderids = [];
	var pwdstep = 0;
	var pay_success_status = 0;

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		page = 1;
		mergeorderids = [];
		this.refreshdata();
		$('.x-modal-button.x-modal-button-bold.Yes')[0].innerText = '否';
		$('.x-modal-button.x-modal-button-bold.No')[0].innerText = '是';
		var self = this;
		$(self.getElementByXid("mergediv")).show();
		$(this.getElementByXid("mergediv")).slideUp(0);

		$('.mz').text('');
		$(".mm_box li").removeClass("mmdd");
		$(".mm_box li").attr("data", "");
		pwdstep = 0;
		$(".xiaq_tb").click(function() {
			$(".numb_box").slideUp(100);
		});
		$(".mm_box").click(function() {
			$(".numb_box").slideDown(100);
		});

		$(".nub_ggg li .zf_num").click(function() {
			if (pwdstep < 6) {
				$(".mm_box li").eq(pwdstep).addClass("mmdd");
				$(".mm_box li").eq(pwdstep).attr("data", $(this).text());
				pwdstep++
				if (pwdstep == 6) {
					var data = "";
					$(".mm_box li").each(function() {
						data += $(this).attr("data");
					});

					$.ajax({
						async : true,
						url : publicurl + '/api/validation_user_password',
						type : "GET",
						dataType : 'jsonp',
						jsonp : 'callback',
						timeout : 5000,
						data : {
							openid : openid,
							password : data
						},
						success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
							if (jsonstr.status == 0) {
								$('.mz').text('密码错误');
								setTimeout(function() {

									$(".mm_box li").removeClass("mmdd");
									$(".mm_box li").attr("data", "");
									pwdstep = 0;
								}, 100);
							} else {
								self.create_agentpayment_order();
							}
						},
						error : function(xhr) {
							// justep.Util.hint("错误，请检查网络");
						}
					});

				}
				;
			}
		});
		$(".nub_ggg li .zf_del").click(function() {
			if (pwdstep > 0) {
				pwdstep--
				$(".mm_box li").eq(pwdstep).removeClass("mmdd");
				$(".mm_box li").eq(pwdstep).attr("data", "");
			}
		});

		$(".nub_ggg li .zf_empty").click(function() {
			$(".mm_box li").removeClass("mmdd");
			$(".mm_box li").attr("data", "");
			pwdstep = 0;
		});
	};

	Model.prototype.create_agentpayment_order = function() {
		mergeorderids = [];
		var self = this;
		self.comp('paystatusData').each(function(param) {
			mergeorderids.push(param.row.val('id'));
		});
		$.ajax({
			async : true,
			url : publicurl + "api/create_agentpayment_order",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				mergeorderids : mergeorderids
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				self.paysuccess();
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.refreshdata = function() {
		var self = this;
		$.ajax({
			async : false,
			url : publicurl + '/api/get_unpay_list',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 10000,
			data : {
				openid : openid,
				page : page
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var orderdata = self.comp("orderData");

				var orderdetaildata = self.comp("orderdetailData");

				var optionaldata = self.comp("optionalData");

				var activedata = self.comp("activeData");

				if (page == 1) {
					orderdata.clear();
					orderdetaildata.clear();
					optionaldata.clear();
					activedata.clear();
				}
				$.each(jsonstr.orders, function(i, item) {
					var ordermessage = '';
					var order_status = 0;// 0待支付 1待发货 2待收货 3待评价 4交易完成 5平台处理
					if (item.status == 0) {
						ordermessage = '平台处理';
						order_status = 5;
					} else if (item.paystatus == 0) {
						ordermessage = '待付款';
						order_status = 0;
					} else if (item.deliverstatus == 0) {
						ordermessage = '待发货';
						order_status = 1;
					} else if (item.receiptstatus == 0) {
						ordermessage = '待收货';
						order_status = 2;
					} else if (item.commentstatus == 0) {
						ordermessage = '待评价';
						order_status = 3;
					} else {
						ordermessage = '交易完成';
						order_status = 4;
					}
					var order_options = {
						defaultValues : [ {
							id : item.id,
							user_id : item.user_id,
							ordernumber : item.ordernumber,
							deduction : item.deduction,
							payprice : item.payprice,
							paysum : parseFloat(item.paysum).toFixed(2),
							paystatus : item.paystatus,
							province : item.province,
							city : item.city,
							district : item.district,
							street : item.street,
							address : item.address,
							adcode : item.adcode,
							contact : item.contact,
							contactphone : item.contactphone,
							receiptstatus : item.receiptstatus,
							autoreceipttime : item.autoreceipttime,
							summary : item.summary,
							status : item.status,
							frontuuid : item.frontuuid,
							paytime : item.paytime,
							commentstatus : item.commentstatus,
							detailcount : item.detailcount,
							discount : parseFloat(item.discount).toFixed(2),
							owerprofit : parseFloat(item.owerprofit).toFixed(2),
							deliverstatus : item.deliverstatus,
							orderstatus : order_status,
							ordermessage : ordermessage,
							destock : item.destock,
							agentuserid : item.agentuserid,
							agentname : item.agentname,
							postage:item.postage,
							isselect : 0
						} ]
					};
					orderdata.newData(order_options);
					$.each(item.orderdetail, function(detail_i, detail_item) {
						var detail_options = {
							defaultValues : [ {
								id : detail_item.id,
								product_id : detail_item.product_id,
								name : detail_item.name,
								number : detail_item.number,
								price : parseFloat(detail_item.price).toFixed(2),
								unit : detail_item.unit,
								spec : detail_item.spec,
								subtitle : detail_item.subtitle,
								weight : detail_item.weight,
								brand : detail_item.brand,
								pack : detail_item.pack,
								season : detail_item.season,
								cover : publicurl + detail_item.cover,
								order_id : detail_item.order_id,
								producttype : detail_item.producttype,
								ordermessage : ordermessage
							} ]
						};
						orderdetaildata.newData(detail_options);
						$.each(detail_item.optional, function(optional_i, optional_item) {
							var optional_options = {
								defaultValues : [ {
									id : optional_item.id,
									orderdetail_id : optional_item.orderdetail_id,
									selectcondition_id : optional_item.selectcondition_id,
									selectcondition_name : optional_item.selectcondition_name
								} ]
							};
							optionaldata.newData(optional_options);
						});
						$.each(detail_item.active, function(active_i, active_item) {
							var active_options = {
								defaultValues : [ {
									id : active_item.id,
									orderdetail_id : active_item.orderdetail_id,
									active : active_item.active,
									showlable : active_item.showlable,
									summary : active_item.summary,
									keywords : active_item.keywords
								} ]
							};
							activedata.newData(active_options);
						});
					});
				});
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.calcount = function(orderid) {
		var count = 0;
		var rows = this.comp('orderdetailData').find([ 'order_id' ], [ orderid ]);
		rows.each(function(param) {
			count += parseFloat(param.val('number'));
		});
		return count;
	};

	Model.prototype.deleteBtnClick = function(event) {
		var row = event.bindingContext.$object;
		orderid = row.val('id');
		this.comp('deletemessageDialog').show();

	};

	Model.prototype.deletemessageDialogNo = function(event) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/delete_order",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				orderid : orderid,
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				justep.Shell.fireEvent("ower_refresh_unpay_count", self);
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
		var row = this.comp('orderData').find([ 'id' ], [ orderid ], true);
		this.comp('orderData').deleteData(row);
	};

	Model.prototype.paynowBtnClick = function(event) {
		var row = event.bindingContext.$object;
		mergeorderids = [];
		mergeorderids.push(row.val('id'));
		this.mergepaycallback();
	};

	Model.prototype.toggle1Change = function(event) {

	};

	Model.prototype.i9Click = function(event) {
		this.comp('popOver1').hide();
	};

	Model.prototype.scrollView1PullDown = function(event) {
		page = 1;
		this.refreshdata();
	};

	Model.prototype.scrollView1PullUp = function(event) {
		page += 1;
		this.refreshdata();
	};

	Model.prototype.selectiClick = function(event) {
		var row = event.bindingContext.$parentContext.$object;
		if (row.val('isselect') == 0) {
			row.val('isselect', 1);

		} else {
			row.val('isselect', 0);

		}
		this.bottom_slide();
	};

	Model.prototype.bottom_slide = function() {
		var row = this.comp('orderData').find([ 'isselect' ], [ '1' ]);
		if (row.length > 0) {
			// $(this.getElementByXid("bottom1")).slideUp();
			$(this.getElementByXid("mergediv")).slideDown(100);

		} else {
			$(this.getElementByXid("mergediv")).slideUp(100);

		}
	};

	Model.prototype.change_select = function(el, order_id) {
		var row = this.comp('orderData').find([ 'id' ], [ order_id ]);
		if (row[0].val('isselect') == 1) {
			$(el).removeClass('my2-xuanzhong2');
			$(el).removeClass('text-muted');
			$(el).addClass('my2-xuanzhong1');
			$(el).addClass('isselect');
		} else {
			$(el).removeClass('my2-xuanzhong1');
			$(el).removeClass('isselect');
			$(el).addClass('my2-xuanzhong2');
			$(el).addClass('text-muted');
		}
	};

	Model.prototype.forgetbtnClick = function(event) {
	this.comp('passwordpopOver').hide();
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
		page = 1;
		pay_success_status = 1;
		this.comp('passwordpopOver').hide();
		// self.refreshdata();
		justep.Util.hint("支付成功", {
			"tyep" : "info",
			"position" : "middle",
			"style" : "background:rgba(0,0,0,0.65);border:0px;color:#fff;"
		});
		var rows = this.comp('orderData').find([ 'id' ], mergeorderids);
		this.comp('orderData').deleteData(rows);
	}

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

	Model.prototype.i2Click = function(event) {
		this.comp('passwordpopOver').hide();
		$('.mz').text('');

		$(".mm_box li").removeClass("mmdd");
		$(".mm_box li").attr("data", "");
		pwdstep = 0;
	};

	Model.prototype.mergepaycallback = function() {
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

	Model.prototype.mergepaybtnClick = function(event) {
		mergeorderids = [];
		this.comp('orderData').each(function(param) {
			if (param.row.val('isselect') == 1) {
				mergeorderids.push(param.row.val('id'));
			}
		});
		this.mergepaycallback();

	};

	Model.prototype.modelUnLoad = function(event) {
		if (pay_success_status == 1) {
			justep.Shell.fireEvent("ower_refresh_unpay_count", self);
			justep.Shell.fireEvent("ower_undeliver_count", self);
		}
	};

	return Model;
});