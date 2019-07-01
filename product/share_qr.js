define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	require("../js/fabric");
	require("../js/jquery.qrcode.min");
	var canvas;
	var localjson;
	var jstr;
	var images = [];
	var headimage;
	var Swiper = require("../swiper-4.4.2/swiper.min");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.data.data) {
			this.comp('title1').set({
				title : event.data.data.name
			});
			var self = this;
			$.ajax({
				async : false,
				url : publicurl + "api/get_productqr",
				type : "GET",
				dataType : 'jsonp',
				jsonp : 'callback',
				timeout : 5000,
				data : {
					product_id : event.data.data.id,
					openid : 'o_L1a1F_7rOT0RxFXBc5Ki4W5Cuk'
				},
				success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数

					var headcanvas = $('<canvas id = "headcanvas" style="display:none;"/>');
					$(self.getElementByXid("content1")).append(headcanvas);
					var backcanvas = $('<canvas id="backcanvas" width ="720px" height="1280px" style="display:none;" />');
					$(self.getElementByXid("content1")).append(backcanvas);

					var img = new Image;
					img.crossOrigin = 'anonymous';
					img.src = jsonstr.userinfo.result['headimgurl'];

					img.onload = function() {
						$('#headcanvas')[0].width = img.width;
						$('#headcanvas')[0].height = img.height;

						ctx = $('#headcanvas')[0].getContext('2d');
						ctx.drawImage(img, 0, 0);
						headimage = $('#headcanvas')[0].toDataURL();

						jstr = jsonstr;

						var qrdiv = $("<div id='qr' style='display:none;'></div>");
						$(self.getElementByXid("content1")).append(qrdiv);
						$("#qr").qrcode({
							render : "canvas",
							width : 238,
							height : 238,
							text : 'http://flowerfront.ysdsoft.com?type=product&id=' + event.data.data.id + '&vid=' + jsonstr.user.vipid// 需要生成的内容
						});
						var qrmaincanvas = $('<canvas id ="qrmain" width ="258px" height="258px" style="display:none;" />');
						$(self.getElementByXid("content1")).append(qrmaincanvas);

						var qrctx = $('#qrmain')[0].getContext('2d');

						var qrimage = new Image();
						qrimage.src = $('#qr').children()[0].toDataURL();
						qrimage.onload = function() {
							$('#qrmain')[0].width = 258;
							$('#qrmain')[0].height = 258;
							qrctx.fillStyle = 'white';
							qrctx.fillRect(0, 0, 258, 258);
							qrctx.drawImage(qrimage, 10, 10);
							images.push($('#qrmain')[0].toDataURL());

							if (jsonstr.productqrs.length == 0) {
								self.create_swiper();
							}

							$.each(jsonstr.productqrs, function(i, item) {
								localjson = JSON.parse(item);
								$.each(localjson.objects, function(oi, oitem) {
									if (oitem.type == 'textbox' && oitem.text == '花当家') {
										oitem.text = jsonstr.userinfo["result"].nickname;
									}
									if (oitem.type == 'textbox' && oitem.text == '10001') {
										oitem.text = jsonstr.user.vipid.toString();
									}
									if (oitem.type == 'group') {
										$.each(oitem.objects, function(li, litem) {
											if (litem.type == 'image') {
												litem.src = headimage;
												litem.crossOrigin = 'anonymous';
											}
										});
									}
									if (oitem.type == 'image') {
										oitem.src = images[0];
									}
								});
								// debugger;

								var canvas = new fabric.Canvas('backcanvas');
								$('#backcanvas')[0].width = 720;
								$('#backcanvas')[0].height = 1280;
								canvas.loadFromJSON(localjson);
								canvas.on('after:render', function(o) {

									images.push($('#backcanvas')[0].toDataURL());
									if (images.length == jsonstr.productqrs.length + 1) {
										$(self.getElementByXid("content1")).empty();
										self.create_swiper();

									}
								});

							});

						};

					};
				},
				error : function(xhr) {
					// justep.Util.hint("错误，请检查网络");
				}
			});
		}
	};

	Model.prototype.create_swiper = function() {
		var gallery_top_div = '<div class="swiper-container gallery-top"><div id="topdiv" class="swiper-wrapper"></div></div>';
		$(this.getElementByXid("content1")).append(gallery_top_div);

		$.each(images, function(i, item) {
			// var slide = '<div class="swiper-slide"
			// style="background-image:url('+item+');background-size:100%;"></div>';
			var slide = $('<div class="swiper-slide text-center"></div>');
			var image = $('<img></img>');
			image[0].src = item;
			if (i == 0) {
				image.css('width', '80%');
			} else {
				image.css('height', '100%');
			}

			slide.append(image);
			$('#topdiv').append(slide);
			if (slide.height() - image.height() > 0) {
				image.css('margin-top', (slide.height() - image.height()) / 2);
			}
		});

		var gallery_thumbs_div = '<div class="swiper-container gallery-thumbs"><div id="thumbsdiv" class="swiper-wrapper"></div></div>';
		$(this.getElementByXid("content1")).append(gallery_thumbs_div);

		$.each(images, function(i, item) {
			// var slide = '<div class="swiper-slide"
			// style="background-image:url('+item+');background-size:100%;"></div>';
			var slide = $('<div class="swiper-slide text-center"></div>');
			var image = $('<img></img>');
			image[0].src = item;
			if (i == 0) {
				image.css('width', '100%');
			} else {
				image.css('height', '100%');
			}

			slide.append(image);
			$('#thumbsdiv').append(slide);
			if (slide.height() - image.height() > 0) {
				image.css('margin-top', (slide.height() - image.height()) / 2);
			}
		});

		var galleryThumbs = new Swiper('.gallery-thumbs', {
			spaceBetween : 10,
			slidesPerView : 4,
			freeMode : true,
			watchSlidesVisibility : true,
			watchSlidesProgress : true,
		});

		var galleryTop = new Swiper('.gallery-top', {
			spaceBetween : 10,
			thumbs : {
				swiper : galleryThumbs
			}

		});
	};



	Model.prototype.modelUnLoad = function(event){
images=[];
	};



	return Model;
});
