define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Swiper = require("../swiper-4.4.2/swiper.min");

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		$.ajax({
			async : true,
			url : publicurl + '/api/get_certificates',
			type : "GET",
			dataType : 'jsonp',
			jsonp : 'callback',
			timeout : 5000,
			data : {
				openid : openid
			},
			success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
				$.each(jsonstr.agentcertificates, function(i, item) {
					var el = '<div class="swiper-slide"><img width="100%" src = ' + publicurl + item + '</div>';
					var el2 = '<div class="swiper-slide"><img width="100%" src = ' + publicurl + item + '</div>';
					$(self.getElementByXid("div2")).append(el);
					$(self.getElementByXid("div4")).append(el2);
				});
    var galleryThumbs = new Swiper('.gallery-thumbs', {
      spaceBetween: 10,
      slidesPerView: 4,
      freeMode: true,
      watchSlidesVisibility: true,
      watchSlidesProgress: true,
    });
    var galleryTop = new Swiper('.gallery-top', {
      spaceBetween: 10,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      thumbs: {
        swiper: galleryThumbs
      }
    });


			},
			error : function(xhr) {
				// justep.Util.hint("错误，请检查网络");
			}
		});
	};

	return Model;
});