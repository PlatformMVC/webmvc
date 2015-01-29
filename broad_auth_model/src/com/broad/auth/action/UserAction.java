package com.broad.auth.action;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.broad.auth.model.TbUser;
import com.broad.auth.pojo.ActionResponse;
import com.broad.auth.service.UserService;
import com.broad.auth.util.SysConstant;

/**
 * 
 * @title       :UserAction
 * @description :用户管理相关的Action
 * @update      :2015-1-26 上午9:15:40
 * @author      :172.17.5.73
 * @version     :1.0.0
 * @since       :2015-1-26
 */
@Controller
public class UserAction {
	@Autowired
	private UserService userService;
	
	/**
	 * 登陆
	 * @param loginName
	 * @param userPwd
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/login")
	public ModelAndView login(String loginName,String userPwd,HttpSession session){
		ModelAndView view =  new ModelAndView("/login");
		ActionResponse response = userService.login(loginName, userPwd);
		if(response.isStatus()){
			view = new ModelAndView("main");
			session.setAttribute(SysConstant.CURRENT_USER,response.getResult());
		}else{
			view.addObject("msg", response.getDescription());
		}
		
		return view;
	}
	
	/**
	 * 退出
	 * @param loginName
	 * @param userPwd
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout")
	@ResponseBody
	public ActionResponse logout(HttpSession session){
		session.setAttribute(SysConstant.CURRENT_USER,null);
		ActionResponse response = new ActionResponse();
		response.setStatus(true);
		return response;
	}
	
	/**
	 * 跳转到注册页面
	 * @return
	 */
	@RequestMapping(value="/toAddUser")
	public ModelAndView toAddUser(){
		ModelAndView view =  new ModelAndView("user_add");
		return view;
	}
	
	/**
	 * 提交注册
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/submitAdd")
	@ResponseBody
	public ActionResponse submitAdd(TbUser user){
		return userService.register(user);
	}
	
	/**
	 * 注册结果返回，由页面选择跳转或不予处理
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/userManage")
	@ResponseBody
	public ModelAndView userManage(){
		ModelAndView view = new ModelAndView("user_list");
		return view;
	}
	
	/**
	 * 注册结果返回，由页面选择跳转或不予处理
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/queryUsers")
	@ResponseBody
	public ActionResponse queryUsers(TbUser user){
		return userService.queryByPage(user);
	}
	
	/**
	 * 注册结果返回，由页面选择跳转或不予处理
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/modifyUserInfo")
	@ResponseBody
	public ActionResponse modifyUserInfo(TbUser user,Integer modifyType){
		if(modifyType==null){
			modifyType = SysConstant.CHANGE_INFO;
		}
		return userService.modifyUserInfo(user,modifyType);
	}
	
	/**
	 * 为用户授权角色
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/grantUserRole")
	@ResponseBody
	public ActionResponse grantUserRole(Integer userId,Integer roleId){
		ActionResponse r = new ActionResponse();
		if(userId==null||roleId==null){
			r.setDescription("指定用户角色为空!");
		}else{
			userService.grantUserRole(userId,roleId);
			r.setStatus(true);
		}
		return r;
	}
	
}
