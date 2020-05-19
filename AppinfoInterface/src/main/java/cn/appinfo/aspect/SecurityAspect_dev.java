package cn.appinfo.aspect;

import cn.appinfo.service.token.TokenService;
import cn.appinfo.util.IgnoreSecurity;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * @Project: children-watch-web-api
 * @Class SecurityAspect 安全检查切面(是否登录检查)
 * @Description: 通过验证Token维持登录状态
 */
@Component
@Aspect
public class SecurityAspect_dev {

    @Autowired
    private TokenService tokenService;

    @Autowired
    private HttpServletRequest request;


    /*
    所有使用requestMapping注解的方法
    "@annotation(org.springframework.web.bind.annotation.RequestMapping)"
    */


    @Around("execution(* cn.appinfo.controller.AppInfoController.*(..)) OR execution(* cn.appinfo.controller.AppInfoController.*(..)) OR execution(* cn.qppinfo.controller.appVersionController.*(..))")
    public Object execute(ProceedingJoinPoint pjp) throws Throwable {

        // 从切点上获取目标方法
        MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
        Method method = methodSignature.getMethod();
        System.out.println(method.getName());
        // 若目标方法忽略了安全性检查,则直接调用目标方法
        if (method.isAnnotationPresent(IgnoreSecurity.class)) {
            // 调用目标方法
            return pjp.proceed();
        }
        //忽略 api接口测试安全性检查
        if ("getDocumentation".equalsIgnoreCase(method.getName())) {
            // 调用目标方法
            return pjp.proceed();
        }
        // 从 request header 中获取当前 token
        String token_dev = request.getHeader("token_dev");
        tokenService.validate("", token_dev);
        //每次调用接口就刷新过期时间
        String reloadToken = tokenService.reloadToken(request.getHeader("user-agent"), token_dev);
        if (reloadToken != null) {
            request.setAttribute("reloadToken", reloadToken);
        }
        // 调用目标方法
        return pjp.proceed();
    }
}