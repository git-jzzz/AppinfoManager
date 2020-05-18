package cn.appinfo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.appinfo.pojo.BackendUser;
import cn.appinfo.service.backenduser.BackendUserService;

@RequestMapping(value="/bu")
@Controller
public class BackendUserController {
	
	@Autowired
	private BackendUserService backendUserService;

	public void setBackendUserService(BackendUserService backendUserService) {
		this.backendUserService = backendUserService;
	}
	
	/**
	 * 后台登录
	 * @param backendUser
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/buloginyan.html")
	public String buloginyan(BackendUser backendUser,Model model,HttpServletRequest request){
		backendUser=backendUserService.bulogin(backendUser);
		if(backendUser!=null){
			request.getSession().setAttribute("bu", backendUser);
			return "bumain";
		}
		//判断页面显示
		model.addAttribute("d", "d");
		model.addAttribute("msg", "用户名或密码错误,登录失败！");
		return "dplogin";
		
	}
	
	/**
	 * 注销
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/buloginout.html")
	public String buloginout(HttpServletRequest request){
		request.getSession().removeAttribute("bu");
		return "index";
	}
}
