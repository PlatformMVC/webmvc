package com.broad.auth.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.broad.auth.util.StringUtil;

/**
 * 
 * @title       :FrameSetAction
 * @description :框架首页Action
 *               1 header框架
 *               2 菜单展示
 * @update      :2015-1-6 上午10:42:52
 * @author      :wang_ll
 * @version     :1.0.0
 * @since       :2015-1-6
 */
@Controller
public class FrameSetAction {
	
	@RequestMapping(value="/header")
	public ModelAndView header(HttpSession session){
		ModelAndView view = new ModelAndView("main_header");
		List<HeaderMenu> list = new ArrayList<HeaderMenu>();
		
//		list.add(new HeaderMenu(1,"菜单管理","menuManage"));
		list.add(new HeaderMenu(0,"首页","aboutMe"));
		list.add(new HeaderMenu(2,"菜单管理","menuList"));
		list.add(new HeaderMenu(4,"权限管理","roleManage"));
		list.add(new HeaderMenu(5,"用户管理","userManage"));
		view.addObject("authoritys",StringUtil.toJson(list));
		return view;
	}
	
	@RequestMapping(value="/aboutMe")
	public ModelAndView aboutMe(){
		ModelAndView view = new ModelAndView("about_me");
		return view;
	}
	
	@RequestMapping(value="/footer")
	public ModelAndView footer(){
		ModelAndView view = new ModelAndView("main_footer");
		return view;
	}
	
   //内部类（展示Header的菜单）
   class HeaderMenu{
		private int id;
		private String name;
		private String url;

		public HeaderMenu(int id, String name, String url) {
			this.name = name;
			this.url = url;
			this.id = id;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}
	}
}
