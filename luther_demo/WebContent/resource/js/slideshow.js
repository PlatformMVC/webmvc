var slideObj  = null;
$(window).load(function(){
	slideObj = new SlideShow();
	slideObj.autoPlay();
});

function SlideShow(slideSelector, imgSelector,arrowSelector,activeClass) {
	//DIV属性信息
	this.slideSelector = slideSelector || '#slideshow li';
	this.imgSelector = imgSelector || '#slideshow img';
	this.arrowSelector = arrowSelector||'#slideshow .arrow';
	this.activeClass = activeClass||'slideActive';

	//绘制图片信息
	this.timeOut = null;
	this.supportCanvas = false;
	this.current = 0;
	this.slides = null;
	this.slideshow = {
		width : 0,
		height : 0
	};

	this.init = function() {
		var obthis = this;
		obthis.slides = $(obthis.slideSelector);
		obthis.supportCanvas = 'getContext' in document.createElement('canvas');
		//为翻页按钮设置绑定事件
		$(obthis.arrowSelector).unbind();
		$(obthis.arrowSelector).on("click",function(){
			obthis.arrowClick();
		});	
		
		this.showImage();
	};

	this.arrowClick = function() {
		var thisObj = this;
		var li = thisObj.slides.eq(thisObj.current);
		var canvas = li.find('canvas');
		var nextIndex = 0;
		if ($(this).hasClass('next')) {
			nextIndex = thisObj.current >= thisObj.slides.length - 1 ? 0
					: thisObj.current + 1;
		} else {
			nextIndex = thisObj.current <= 0 ? thisObj.slides.length - 1
					: thisObj.current - 1;
		}

		var next = thisObj.slides.eq(nextIndex);
		if (thisObj.supportCanvas) {
			// This browser supports canvas, fade it into view:
			canvas.fadeIn(function() {
				// Show the next slide below the current one:
				next.show();
				thisObj.current = nextIndex;

				// Fade the current slide out of view:
				li.fadeOut(function() {
					li.removeClass('slideActive');
					
					next.addClass('slideActive');
				});
			});
		} else {
			// This browser does not support canvas.
			// Use the plain version of the slideshow.
			thisObj.current = nextIndex;
			next.addClass('slideActive').show();
			li.removeClass('slideActive').hide();
		}
	};

	this.showImage = function() {
		var thisObj = this;
		if (thisObj.supportCanvas) {
			$(thisObj.imgSelector).each(function() {
				if (!thisObj.slideshow.width) {
					// Taking the dimensions of the first image:
					thisObj.slideshow.width = this.width;
					thisObj.slideshow.height = this.height;
				}

				// Rendering the modified versions of the images:
				thisObj.createCanvasOverlay(this);
			});
		}
	};

	this.createCanvasOverlay = function(image) {
		var thisObj = this;
		var canvas = document.createElement('canvas');
		var canvasContext = canvas.getContext("2d");

		// Make it the same size as the image
		canvas.width = thisObj.slideshow.width;
		canvas.height = thisObj.slideshow.height;

		// Drawing the default version of the image on the canvas:
		canvasContext.drawImage(image, 0, 0);

		// Taking the image data and storing it in the imageData array:
		var imageData = canvasContext.getImageData(0, 0, canvas.width,
				canvas.height), data = imageData.data;

		// Loop through all the pixels in the imageData array, and
		// modify
		// the red, green, and blue color values.
		for ( var i = 0, z = data.length; i < z; i++) {

			// The values for red, green and blue are consecutive
			// elements
			// in the imageData array. We modify the three of them at
			// once:

			data[i] = ((data[i] < 128) ? (2 * data[i] * data[i] / 255)
					: (255 - 2 * (255 - data[i]) * (255 - data[i])
							/ 255));
			data[++i] = ((data[i] < 128) ? (2 * data[i] * data[i] / 255)
					: (255 - 2 * (255 - data[i]) * (255 - data[i])
							/ 255));
			data[++i] = ((data[i] < 128) ? (2 * data[i] * data[i] / 255)
					: (255 - 2 * (255 - data[i]) * (255 - data[i])
							/ 255));

			// After the RGB elements is the alpha value, but we leave
			// it the
			// same.
			++i;
		}

		// Putting the modified imageData back to the canvas.
		canvasContext.putImageData(imageData, 0, 0);

		// Inserting the canvas in the DOM, before the image:
		image.parentNode.insertBefore(canvas, image);
	};

	/**
	 * 自动播放操作：每隔5秒触发一次next点击事件
	 */
	this.autoAdvance = function(){
		// Simulating a click on the next arrow.
		$('#slideshow .next').trigger('click',[true]);
		this.timeOut = setTimeout(this.autoAdvance,5000);		
	};
	
	/**
	 * 这个定时器还有问题：如果点击了arrow的话，定时器就解除了
	 * 而且图片的效果有问题。。。一半一半有悬浮的
	 */
	this.autoPlay = function() {
		this.init();
		var obth = this;
		this.autoAdvance();
		$('#slideshow .arrow').click(function(e,simulated){
			if(!simulated){
				clearTimeout(obth.timeOut);
				setTimeout(obth.autoAdvance(),1000);
			}
		});
	};
}
