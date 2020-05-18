package cn.appinfo.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.appinfo.pojo.DevUser;
import cn.appinfo.service.devuser.DevUserService;

@RequestMapping(value="/dev")
@Controller 
public class DevUserController {
	
	@Autowired
	private DevUserService devUserService;
	
	
	public void setDevUserService(DevUserService devUserService) {
		this.devUserService = devUserService;
	}
	
	@RequestMapping(value="/todplogin.html")
	public String toLogin(String d,Model model){
		if(d!=null){
			model.addAttribute("d", d);
		}
		return "dplogin";
	}

	

	/**
	 * 开发者用户登录验证
	 * @param devCode
	 * @param devPassword
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/dploginyan.html")
	public String toDPLogin(String devCode, String devPassword, HttpServletRequest request,Model model){
		DevUser du=new DevUser();
		du.setDevCode(devCode);
		du.setDevPassword(devPassword);
		du=devUserService.login(du);
		if(du!=null){
			request.getSession().setAttribute("du", du);
			System.out.println("=========开发者"+du.getDevName()+"登录成功=========");
			return "dpmain";
		}
		model.addAttribute("msg", "用户名或密码错误,登录失败！");
		return "dplogin";
	}
	
	/**
	 * 注销后返回入口
	 * @return
	 */
	@RequestMapping(value="/dploginout.html")
	public String loginOut(HttpServletRequest request){
		request.getSession().removeAttribute("du");
		return "index";
	}
	
}
