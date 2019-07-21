define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var keywords = [];

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
	this.comp('contents1').to('content4');
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + "api/get_mytask_echars_title",
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				keywords = [];
				$.each(jsonstr.title_list, function(i, item) {
					keywords.push(item.keyword);
				});
				self.comp('button2').set({
					'label' : jsonstr.title_list[0].name
				});
				self.comp('button3').set({
					'label' : jsonstr.title_list[1].name
				});
				self.comp('button4').set({
					'label' : jsonstr.title_list[2].name
				});
				
						var params = {
			keyword : keywords[2]
		};
		self.comp('windowContainer3').load(require.toUrl('./mytask_echars.w'), params);
				
			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	Model.prototype.button2Click = function(event){
		var params = {
			keyword : keywords[0]
		};
		this.comp('windowContainer1').load(require.toUrl('./mytask_echars.w'), params);
	};

	Model.prototype.button3Click = function(event){
		var params = {
			keyword : keywords[1]
		};
		this.comp('windowContainer2').load(require.toUrl('./mytask_echars.w'), params);
	};

	Model.prototype.button4Click = function(event){
		var params = {
			keyword : keywords[2]
		};
		this.comp('windowContainer3').load(require.toUrl('./mytask_echars.w'), params);
	};

	return Model;
});