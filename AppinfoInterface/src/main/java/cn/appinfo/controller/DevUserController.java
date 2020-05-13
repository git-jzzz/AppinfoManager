package cn.appinfo.controller;


import javax.servlet.http.HttpServletRequest;

import cn.appinfo.util.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.appinfo.pojo.DevUser;
import cn.appinfo.service.devuser.DevUserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping(value="/dev")
@Controller
@Slf4j
public class DevUserController {


	@Autowired
	private DevUserService devUserService;


	/**
	 * 开发者用户登录验证
	 * @param devCode
	 * @param devPassword
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/dploginyan",method = RequestMethod.POST)
	@ResponseBody
	public Result toDPLogin(String devCode, String devPassword, HttpServletRequest request, Model model){
		DevUser du=new DevUser();
		du.setDevCode(devCode);
		du.setDevPassword(devPassword);
		du=devUserService.login(du);
		if(du!=null){
			request.getSession().setAttribute("du", du);
			log.info("=========开发者\"+du.getDevName()+\"登录成功=========");
			return Result.ok(du);
		}
		return Result.error("用户名或密码错误,登录失败！");
	}
	
	/**
	 * 注销后返回入口
	 * @return
	 */
	@RequestMapping(value="/dploginout",method = RequestMethod.GET)
	@ResponseBody
	public Result loginOut(HttpServletRequest request){
		request.getSession().removeAttribute("du");
		log.info("=========开发者退出登录=========");
		return	Result.ok();
	}



	
}
