define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Swiper = require("../swiper-4.4.2/swiper.min");
	var photoSwiper;

	var Model = function() {
		this.callParent();
	};

	Model.prototype.modelParamsReceive = function(event) {
		if (event.data.data) {
			var self = this;
			$.ajax({
				async : false,
				url : publicurl + "api/get_comment_img_list",
				type : "GET",
				dataType : 'jsonp',
				jsonp : 'callback',
				timeout : 5000,
				data : {
					product_id : event.data.data.product_id
				},
				success : function(jsonstr) {// 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
					var commentdata = self.comp("commentData");
					commentdata.clear();
					var commentimgdata = self.comp("commentimgData");
					commentimgdata.clear();
					$.each(jsonstr.comments, function(i, item) {

						var options = {
							defaultValues : [ {
								id : item.id,
								comment : item.comment,
								anonymous : item.anonymous,
								nickname : item.nickname,
								headurl : item.headurl,
								updated_at:justep.Date.toString(justep.Date.fromString(item.updated_at,"yyyy-MM-dd"), 'yyyy-MM-dd')
							} ]
						};
						commentdata.newData(options);

						$.each(item.commentimgs, function(ci, citem) {

							var options = {
								defaultValues : [ {
									id : citem.id,
									comment_id : citem.comment_id,
									commentimg : publicurl + citem.commentimg
								} ]
							};
							commentimgdata.newData(options);
						});

					});
				},
				error : function(xhr) {
					// justep.Util.hint("错误，请检查网络");
				}
			});
		}
	};

	Model.prototype.getFirstImg = function(commentid) {
		var rows = this.comp("commentimgData").find([ 'comment_id' ], [ commentid ], true);
		if (rows.length > 0) {
			return rows[0].val('commentimg');
		} else {
			return null;
		}
	};

	Model.prototype.image1Click = function(event) {
		this.comp('popOver1').show();
		var row = event.bindingContext.$object;
		var rows = this.comp("commentimgData").find([ 'comment_id' ], [ row.val('id') ], true);
		this.createSwiper(rows[0].val('id'));
	};

	Model.prototype.createSwiper = function(imgid) {
		var self = this;
		// $(this.getElementByXid("div8")).empty();
		if (photoSwiper.slides.length > 0) {
			photoSwiper.removeAllSlides();
		}
		var slideindex = 0;
		var slideindexflag = true;
		this.comp("commentimgData").each(
				function(param) {
					var img = param.row.val("commentimg");
					var commentimgid = param.row.val("id");
					if (commentimgid == imgid) {
						slideindexflag = false;
					}
					if (slideindexflag) {
						slideindex++;
					}

					var slide = $('<div style="display: table;" class="swiper-slide"><div style="display: table-cell;vertical-align: middle;"><img value="' + commentimgid
							+ '" width="100%"  data-src=' + img + '" class="swiper-lazy"></div></div>');
					slide.height($(self.getElementByXid("div6")).height());

					photoSwiper.appendSlide(slide);
					// $(self.getElementByXid("div8")).append(slide);
				});
		photoSwiper.slideTo(photoSwiper.slides.length - 1, 0, false);
		photoSwiper.slideTo(slideindex, 0, false);
		$(self.getElementByXid("div9")).show();
		$(self.getElementByXid("div10")).show();
		// self.slidechange();

	};

	Model.prototype.i2Click = function(event) {
		this.comp('popOver1').hide();
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		photoSwiper = new Swiper('.photoswiper', {
			lazy : {
				loadPrevNext : true,
			},
			on : {
				slideChange : function() {
					self.slidechange();

				},
				click : function() {
					$(self.getElementByXid("div9")).show();
					if ($(self.getElementByXid("div9")).css('opacity') == 1) {
						$(self.getElementByXid("div9")).animate({
							'margin-top' : -50
						}, 50);
						$(self.getElementByXid("div10")).animate({
							'margin-bottom' : -50
						}, 50);
						$(self.getElementByXid("div9")).animate({
							opacity : '0'
						}, 50);
						$(self.getElementByXid("div10")).animate({
							opacity : '0'
						}, 50);

					} else {
						$(self.getElementByXid("div9")).animate({
							'margin-top' : 0
						}, 50);
						$(self.getElementByXid("div10")).animate({
							'margin-bottom' : 0
						}, 50);
						$(self.getElementByXid("div9")).animate({
							opacity : '1'
						}, 50);
						$(self.getElementByXid("div10")).animate({
							opacity : '1'
						}, 50);

					}

				},
			},

		});
	};

	Model.prototype.slidechange = function() {
		var self = this;
		if (photoSwiper.slides.length > 0) {
			var imgid = photoSwiper.slides[photoSwiper.activeIndex].children[0].children[0].getAttribute('value');
			var imgrows = self.comp("commentimgData").find([ 'id' ], [ imgid ], true);
			var rows = self.comp("commentData").find([ 'id' ], [ imgrows[0].val('comment_id') ], true);
			var nickname = rows[0].val('nickname');
			if (rows[0].val('anonymous') == 1) {
				nickname = '匿名';
			}
			var comment = rows[0].val('comment');
			$(self.getElementByXid("span4")).text('@' + nickname);
			$(self.getElementByXid("span5")).text(comment);
			var slidecount = photoSwiper.slides.length;
			var currentslide = photoSwiper.activeIndex + 1;
			$(self.getElementByXid("span3")).text(currentslide + '/' + slidecount);
		}
	};

	return Model;
});