package cn.appinfo.util;

import java.lang.annotation.*;

/**
 * IgnoreSecurity  自定义注解
 * 标识是否忽略rest安全性检查
 */
@Target(ElementType.METHOD) //指明该类型的注解可以注解的程序元素的范围
@Retention(RetentionPolicy.RUNTIME) //指明了该Annotation被保留的时间长短
@Documented  //指明拥有这个注解的元素可以被javadoc此类的工具文档化
public @interface IgnoreSecurity {
}
