package cn.appinfo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.appinfo.service.token.TokenService;
import cn.appinfo.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.appinfo.pojo.BackendUser;
import cn.appinfo.service.backenduser.BackendUserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.HashMap;
import java.util.Map;

@RequestMapping(value = "/bu")
@Controller
public class BackendUserController {

    @Autowired
    private BackendUserService backendUserService;

    @Autowired
    private TokenService tokenService;

    /**
     * 后台登录
     *
     * @param backendUser
     * @param request
     * @return
     */
    @RequestMapping(value = "/buloginyan")
    @ResponseBody
    public Result buloginyan(BackendUser backendUser, HttpServletRequest request) {
        backendUser = backendUserService.bulogin(backendUser);
        Map<String, Object> map = new HashMap<>();
        if (backendUser != null) {
            String userAgent = request.getHeader("user-agent");
            try {
                String token = tokenService.generateToken(userAgent, backendUser);
                tokenService.save(token, backendUser);
                map.put("backendUser",backendUser);
                map.put("token_back",token);

            } catch (Exception e) {
                return Result.error(e.getMessage());
            }

            return Result.ok(map);
        } else {
            return Result.error("用户名或密码错误,登录失败！");
        }
    }


    /**
     * 注销后返回入口
     * @return
     */
    @RequestMapping(value = "/buloginout", method = RequestMethod.GET)
    @ResponseBody
    public Result loginOut(HttpServletRequest request) {
      String   token=request.getHeader("token_back");
        System.out.println(token);
        long result=0;
        try {
            if(tokenService.validate(request.getHeader("user-agent"), token)){
                 result=tokenService.delete(token);
            }
        } catch (Exception e) {
            return Result.error(e.getMessage());
        }
        return Result.ok(null,"返回值："+result);
    }
}
