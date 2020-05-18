package cn.appinfo.controller;


import javax.servlet.http.HttpServletRequest;

import cn.appinfo.service.token.TokenService;
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

import java.util.HashMap;
import java.util.Map;

@RequestMapping(value = "/dev")
@Controller
@Slf4j
public class DevUserController {


    @Autowired
    private DevUserService devUserService;

    @Autowired
    private TokenService tokenService;


    /**
     * 开发者用户登录验证
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/dploginyan", method = RequestMethod.POST)
    @ResponseBody
    public Result toDPLogin(DevUser devUser, HttpServletRequest request) {

        devUser = devUserService.login(devUser);
        Map<String, Object> map = new HashMap<>();
        if (devUser != null) {
            try {
                String token_dev = tokenService.generateToken(request.getHeader("user-agent"), devUser);
                tokenService.save(token_dev, devUser);
                    map.put("token_dev", token_dev);
                map.put("devUser", devUser);
            } catch (Exception e) {
				return Result.error(e.getMessage());
            }
            return Result.ok(map);
        }
        return Result.error("用户名或密码错误,登录失败！");
    }

    /**
     * 注销后返回入口
     *
     * @return
     */
    @RequestMapping(value = "/dploginout", method = RequestMethod.GET)
    @ResponseBody
    public Result loginOut(HttpServletRequest request) {
		String token_dev=request.getHeader("token_dev");
		try {
			tokenService.validate(request.getHeader("user-agent"),token_dev);
			long result=tokenService.delete(token_dev);
			return Result.ok("","返回值:"+result);
		} catch (Exception e) {
			return Result.error(e.getMessage());
		}

    }


}
