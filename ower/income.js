define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var page = 1;

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		this.refreshdata(1);
	};

	Model.prototype.refreshdata = function(page) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_income',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid,
				page : page
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				var data = self.comp('enaccountData');
				if (page == 1) {
					data.clear();
					$(self.getElementByXid("span1")).text('￥' + parseFloat(jsonstr.income).toFixed(2));
				}
				$.each(jsonstr.enaccounts, function(i, item) {
					var options = {
						defaultValues : [ {
							id : item.id,
							amount : '￥' + parseFloat(item.amount).toFixed(2),
							summary : item.summary,
							created_at : item.created_at
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

	Model.prototype.scrollView1PullDown = function(event) {
		page = 1;
		this.refreshdata(page);
	};

	Model.prototype.scrollView1PullUp = function(event) {
		page += 1;
		this.refreshdata(page);
	};

	return Model;
});