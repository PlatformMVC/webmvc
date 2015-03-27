/**
 * picChange lib
 * 自动生成图片切换导航，以及图片轮转特效
 * @name picChange-0.1.js
 * @author afc163 - http://www.ilovespringna.com
 * @version 0.1
 * @date April 29, 2010
 * @copyright (c) 2010 afc163 (http://www.ilovespringna.com)
 * @example or demo Visit http://http://www.ilovespringna.com/test/picChange/
 */

var lastImgOut = null;  //记录图片消失的延时事件
var changingPic = null;	//增加一个对象用于保存消失过程中的图片对象

//图片消失的方法

//直接消失
var none = function(lastImg,currentImg)
{
	if(lastImg != null)
	{
		//上一张图片消失
		lastImg.style.display = "none";
	}
	currentImg.style.zIndex = "0";
	currentImg.style.display = "block";
	lastImg = currentImg;
};

//淡出消失
var fade = function(lastImg,currentImg,time)
{
	if(lastImg != null)
	{
		time = time||500;
		var opacity = 100;

		//消除快速连续点击标签造成的bug
		clearInterval(lastImgOut);
		setAlpha(currentImg,100);

		lastImgOut = setInterval(function(){
			opacity -= 5;
			setAlpha(lastImg,opacity);
			if(opacity <= 5)
			{
				lastImg.style.display = "none";
				setAlpha(lastImg,100);
				clearInterval(lastImgOut);
				return;
			}
		},time/19);
		lastImg.style.zIndex = "10";
	}
	currentImg.style.zIndex = "0";
	currentImg.style.display = "block";
};

//设置透明度
function setAlpha(img,opacity)
{
	if(document.all)
	{
		img.style.filter = "alpha(opacity="+opacity+")";
		if(img.filters && img.filters.Alpha)
			img.filters.Alpha.opacity = opacity;
	}
	else
	{
		img.style.opacity = ((opacity >= 100)? 99:opacity) / 100;
	}
}

//移出消失
var move = function(lastImg,currentImg,time,direction)
{
	
	direction = direction || "top";

	if(lastImg != null)
	{
		time = time||500;
		var outLength = 0; //指定方向上移出的距离
		var imgLength = 0; //图片的在指定方向上的长度

		//消除快速连续点击标签造成的bug
		clearInterval(lastImgOut);
		
		switch(direction)
		{
			case "up":
			case "down":
				currentImg.style.top = "";
				imgLength = lastImg.offsetHeight;
				break;
			case "left":
			case "right":
				currentImg.style.left = "";
				imgLength = lastImg.offsetWidth;
				break;
		}
		var speed = 20*imgLength/time;

		lastImgOut = setInterval(function(){
			//判断四个方向
			switch(direction)
			{
				case "up":
					outLength -= speed;
					lastImg.style.top = outLength + "px";
					break;
				case "left":
					outLength -= speed;
					lastImg.style.left = outLength + "px";
					break;
				case "down":
					outLength += speed;
					lastImg.style.top = outLength + "px";
					break;
				case "right":
					outLength += speed;
					lastImg.style.left = outLength + "px";
					break;
			}
			if(outLength <= (-imgLength) || outLength >= imgLength)
			{
				lastImg.style.display = "none";
				lastImg.style.outLength = 0 + "px";
				clearInterval(lastImgOut);
				changingPic = null;
				return;
			}
		},20);
		lastImg.style.zIndex = "10";
	}
	currentImg.style.zIndex = "0";
	currentImg.style.display = "block";
};

/***使用示例
 *	picChange("picChange");					//直接切换效果
 *	picChange("picChange",fade,500);		//0.5秒淡出效果
 *	picChange("picChange",move,500,"up");	//0.5秒向上移出效果
 */
function picChange(picId,changeStyle,time,index,direction){
	console.log("called..."+index);
	lastImgOut = null;
	changingPic = null;

	picId = picId||"picChange";
	changeStyle = changeStyle||none;
	time = time||500;
	direction = direction || "top";

	//添加右下角图片切换标签
	var pic = document.getElementById(picId);
	var lastImg = null, currentImg = null, nextImg = null;
	index = index||0;
	var lastIndex = null; //记录上一个标签

	var picList = pic.getElementsByTagName("li");
	picList[0].firstChild.style.display = "block";
	var picNum = picList.length;	//获得图片数量

	if(document.getElementById("picChangeIndex") != null)
		document.getElementById("picChangeIndex").parentNode.removeChild(document.getElementById("picChangeIndex"));

	var indexMenu = document.createElement("ul");
	indexMenu.id = "picChangeIndex";
	for(var i=0;i<picNum;i++)
	{
		var indexList = document.createElement("li");
		if(i==0)
		{
			indexList.innerHTML = "<a href=\"#\" class=\"select\">"+(i+1)+"</a>";
			lastIndex = indexList.firstChild;
			lastImg = picList[i].firstChild;
		}
		else
			indexList.innerHTML = "<a href=\"#\">"+(i+1)+"</a>";

		//添加变换函数
		index = i;
		(function(i){
			indexList.onclick = function(){
				if(this.firstChild.className == "select")
					return;

				//更改切换标签的样式
				if(lastIndex != null)
					lastIndex.className = "";
				this.firstChild.className = "select";
				lastIndex = this.firstChild;

				//切换图片
				currentImg = picList[i].firstChild;
				if(changingPic != null)
					changingPic.style.display = "none";

				if(lastImg != null)
				{
					//保存正在消失中的图片对象，当用户在一个动作未完成时触发下一个动作时，用于恢复消失中的图片对象的状态
					changingPic = lastImg;
					//上一张图片消失
					changeStyle(lastImg,currentImg,time,direction); //time,direction可选
				}
				lastImg = currentImg;
			};
		})(index);
		indexMenu.appendChild(indexList);
	}
	pic.parentNode.appendChild(indexMenu);
}

function autoPlay(){
	picChange("picChange",fade,500);
}