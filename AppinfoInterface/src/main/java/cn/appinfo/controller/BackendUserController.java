package cn.appinfo.controller;

import javax.servlet.http.HttpServletRequest;

import cn.appinfo.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.appinfo.pojo.BackendUser;
import cn.appinfo.service.backenduser.BackendUserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@RequestMapping(value="/bu")
@Controller
public class BackendUserController {
	
	@Autowired
	private BackendUserService backendUserService;

	/**
	 * 后台登录
	 * @param backendUser
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/buloginyan")
	@ResponseBody
	public Result buloginyan(BackendUser backendUser,HttpServletRequest request){
		backendUser=backendUserService.bulogin(backendUser);
		Map<String,Object> map=new HashMap<>();
		if(backendUser!=null){
			return Result.ok(backendUser);
		}else{
			return Result.error("用户名或密码错误,登录失败！");
		}
	}
	

	/**
	 * 注销后返回入口
	 * @return
	 */
	@RequestMapping(value="/buloginout",method = RequestMethod.GET)
	@ResponseBody
	public Result loginOut(HttpServletRequest request){
		request.getSession().removeAttribute("bu");
		return	Result.ok();
	}
}
