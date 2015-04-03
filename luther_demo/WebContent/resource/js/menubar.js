$(document).ready(function(e) {
	var menus = getMenus();
	var menuBar = new MenuBar();
	menuBar.setOptions(menus, 'menus');
	menuBar.loadMenu();
});

/**
 * 菜单栏工具抽象类
 * @returns
 */
function MenuBar(){
	this.menus = [];
	this.menuBarId = '';
	
	this.setOptions = function(menus,menuBarId){
		this.menus = menus;
		this.menuBarId = menuBarId||'';
	};
	
	this.loadMenu = function(){
		if(this.menus==null||this.menus.length==0){
			return;
		}
		
		if(this.menuBarId==''){
			return;
		}
		
		var html = formatMenus(this.menus);
		$("#"+this.menuBarId).append(html);
		menuEvent();
	};
}

function getMenus(){
	var menus = [];
	$.ajax({
		type : "post",
		url : basePath+"/frame/getMenus", 
		data : {
		},
		dataType : "json",
		async:false,
		success : function(data) {
			if(data.status){
				menus = data.result;
			}else{
				alert(data.description);
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			if(textStatus=="error"){
				alert("暂时无法连接服务器，请稍后重试");
			}
		}
	});
	return menus;
}

/**
 * 滑过li的时候，显示ul
 */
function menuEvent(){
	//ul显示了之后
	$('.nav-box ul li').mouseover(function(){
		$(this).find('ul').show();
	}).mouseleave(function(){
		$(this).find('ul').hide();
	});
	
	//li.gt(0)是ul的li index>0的li,才是具体的子菜单,index=0的是一级菜单的a
	$('.nav-box ul li ul').find('li:gt(0)')
	.mouseover(function(){
		$(this).css('background-color','#002968');
		$(this).find('span').css('color','#ffffff');
	}).mouseleave(function(){
		$(this).css('background-color','#ffffff');
		$(this).find('span').css('color','#333333');
	}).click(function(){
		var href = $(this).attr("href");
		console.log("href:"+href);
		window.parent.document.getElementById("container").
					src=path+href;
	});
}

/**
 * 拼接菜单的内容
 * @param menus
 * @returns {String}
 */
function formatMenus(menus){
	var str = '';
	for(var i in menus){
		var menu = menus[i];
		//一级菜单
		if(menu.parentId==0){
			str+='<li>';
			str+=formatTopMenu(menu);
			//拼接二级菜单
			var submenus = getSubmenus(menu,menus);
			str+= formatSubMenus(submenus);
			str+='</li>';
		}
	}
	return str;
}

/**
 * 拼接一级菜单内容
 * @param topMenu
 * @returns {String}
 */
function formatTopMenu(topMenu){
	if(topMenu.name.length<4){
		topMenu.name = "&nbsp;&nbsp;&nbsp;"+topMenu.name+"&nbsp;&nbsp;&nbsp;";
	}
	var str = '<a href="'+topMenu.url+'" title=""><font>'+topMenu.name+'</font></a>';
	return str;
}

/**
 * 查找某个菜单的子菜单
 * @param topMenu
 * @param menus
 * @returns {Array}
 */
function getSubmenus(topMenu,menus){
	var submenus = [];
	submenus[0] = topMenu;
	for(var i in menus){
		if(menus[i].parentId==topMenu.id){
			submenus[submenus.length] = menus[i];
		}
	}
	return submenus;
}

/*
 * li的内容是<ul><li><a></a></li></ul>
 */
function formatSubMenus(submenus){
	 if(submenus[0].name.length<4){
		 submenus[0].name = "&nbsp;&nbsp;&nbsp;"+submenus[0].name+"&nbsp;&nbsp;&nbsp;";
	}
	 var str = '<ul style="display: none;">';
	 str +='<li><a href="'+submenus[0].url+'" title=""><font>'+submenus[0].name+'</font></a></li>';
	 if(submenus.length>1){
		 for(var i=1;i<submenus.length;i++){
			 str +='<li><a href="'+submenus[i].url+'" title=""><span>'+submenus[i].name+'</span></a></li>';
		 }
	 }
	 str+='</ul>';
	 return str;
}

