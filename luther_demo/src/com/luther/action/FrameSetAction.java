package com.luther.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.luther.pojo.ActionResponse;
import com.luther.util.StringUtil;


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
@RequestMapping(value="/frame")
public class FrameSetAction {
	
	@RequestMapping(value="/index")
	public ModelAndView index(HttpSession session){
		ModelAndView view = new ModelAndView("admin/index");
		return view;
	}
	
	@RequestMapping(value="/header")
	public ModelAndView header(HttpSession session){
		ModelAndView view = new ModelAndView("admin/main_header");
		List<HeaderMenu> list = new ArrayList<HeaderMenu>();
		//一级菜单
		list.add(new HeaderMenu(1,"首页","home",0));
		list.add(new HeaderMenu(2,"产品中心","productInfo",0));
		list.add(new HeaderMenu(3,"公司地址","addressInfo",0));
		list.add(new HeaderMenu(4,"联系我们","contactUs",0));
		//二级菜单
		list.add(new HeaderMenu(5,"产品展示","productDemo",1));
		list.add(new HeaderMenu(6,"产品说明","productDetail",1));
		System.out.println("StringUtil.toJson(list):"+StringUtil.toJson(list));
		view.addObject("menus",StringUtil.toJson(list));
		return view;
	}
	
	
	@RequestMapping(value="/getMenus")
	@ResponseBody
	public ActionResponse getMenus(HttpSession session){
		ActionResponse response = new ActionResponse();
		List<HeaderMenu> list = new ArrayList<HeaderMenu>();
		//一级菜单
		list.add(new HeaderMenu(1,"首页","home",0));
		list.add(new HeaderMenu(2,"产品中心","productInfo",0));
		list.add(new HeaderMenu(3,"公司地址","addressInfo",0));
		list.add(new HeaderMenu(4,"联系我们","contactUs",0));
		//二级菜单
		list.add(new HeaderMenu(5,"产品展示","productDemo",1));
		list.add(new HeaderMenu(6,"产品说明","productDetail",1));
		System.out.println("StringUtil.toJson(list):"+StringUtil.toJson(list));
		
		response.setResult(list);
		response.setStatus(true);
		return response;
	}
	
	
	
	@RequestMapping(value="/aboutMe")
	public ModelAndView aboutMe(){
		ModelAndView view = new ModelAndView("admin/about_me");
		return view;
	}
	
	@RequestMapping(value="/footer")
	public ModelAndView footer(){
		ModelAndView view = new ModelAndView("admin/main_footer");
		return view;
	}
	
	@RequestMapping(value="/home")
	public ModelAndView home(){
		ModelAndView view = new ModelAndView("admin/index");
		return view;
	}
	
   //内部类（展示Header的菜单）
   class HeaderMenu{
		private int id;
		private String name;
		private String url;
		private int parentId;

		public HeaderMenu(int id, String name, String url,int parentId) {
			this.name = name;
			this.url = url;
			this.id = id;
			this.parentId = parentId;
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

		public int getParentId() {
			return parentId;
		}

		public void setParentId(int parentId) {
			this.parentId = parentId;
		}
	}
}

