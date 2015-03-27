$(window).load(function(){
	var scatter = new Scatter();
	scatter.config.parentId = 'container';
	scatter.config.minSize = 5;
	scatter.config.maxSize = 50;
	scatter.config.interval = 300;
	scatter.scatter();
});

/**
 * 雪花散落效果实现类
 * @returns
 */
function Scatter(){
	this.config = {
			parentId	:'',        //雪花父元素的id
			minSize		: 10,		//雪花的最小尺寸
			maxSize		: 20,		//雪花的最大尺寸
			interval	: 1000,		//雪花出现的频率
			color	    : "#FFFFFF"	,//
			initCss     :{'position': 'absolute', 'top': '-50px'},
			content     : "&#10052;" //*的特殊字符
	};
	
	/**
	 * 随机生成初始位置
	 */
	this.randomStartPosition = function(){
		var documentWidth	= $(document).width();
		var startPositionLeft 	= Math.random() * documentWidth - 100,
	 	startOpacity = 0.5 + Math.random(),
		fontSize	 = this.config.minSize + Math.random() * this.config.maxSize;
		
		var position = {
			left: startPositionLeft,
			opacity: startOpacity,
			'font-size': fontSize,
			color: this.config.color
		};
		return position;
	};
	
	/**
	 * 根据初始left位置随机生成终止位置
	 */
	this.randomEndPosition = function(startPositionLeft){
		var documentHeight 	= $(document).height(),
		endPositionTop		= documentHeight - 40,
		endPositionLeft		= startPositionLeft - 100 + Math.random() * 500;
		
		var position = {
			top: endPositionTop,
			left: endPositionLeft,
			opacity: 0.2
		};
		return position;
	};
	
	/**
	 * 定时器实现天女散花的效果
	 */
	this.scatter = function(){
		//散落对象的父元素
		var obth = this;
		var container = null;
		if(this.config.parentId==''){
			container = $("body");
		}else{
			container = $("#"+this.config.parentId);
		}
		
		//创建散落对象
		var target = $('<div id="snowbox" />').css(this.config.initCss).html(
				this.config.content);
		var documentHeight = $(document).height();
		
		//定时器创建散落对象
		var interval = setInterval(function(){
			//animate参数：初始css
			var randomStart = obth.randomStartPosition();
			//animate参数：终止css
			var randomEnd = obth.randomEndPosition(randomStart.left);
			//动画执行速度
			var speed= documentHeight * 10 + Math.random() * 5000;
			
			// animate实现动画特效
			target.clone().appendTo(container).css(randomStart).animate(
					randomEnd, speed, 'linear', function() {
						$(this).remove();
					});
		}, obth.config.interval);
	};
}