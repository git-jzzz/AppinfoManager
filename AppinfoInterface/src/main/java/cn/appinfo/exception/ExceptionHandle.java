package cn.appinfo.exception;

import cn.appinfo.util.Result;
import org.apache.ibatis.javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 统一异常返回处理
 */
@ControllerAdvice
@ResponseBody
public class ExceptionHandle {

    private Logger logger = LoggerFactory.getLogger(Exception.class);

    @ExceptionHandler(TokenException.class)
    public Result handleTokenException(Exception e) {
        logger.info("Token未知或已过期！", e);
        return Result.errorToken("Token未知或已过期！");
    }

    @ExceptionHandler(Exception.class)
    public Result handleException(Exception e) {
        logger.error("Internal server Wrror...", e);
        return Result.error("Internal server Wrror...");
    }


    @ExceptionHandler(NotFoundException.class)
    public Result notHandleException(Exception e) {
        logger.error("Not Found Error", e);
        return Result.error("Not Found Error");
    }
}
