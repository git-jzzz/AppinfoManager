package cn.appinfo.util;

import lombok.Data;

@Data
public class Result {

    private String code;
    private String msg;
    private Object data;
    private Object token;


    public static Result ok() {
        Result result = new Result();
        result.setCode("200");
        result.setMsg("success");
        result.setData(null);
        return result;
    }

    public static Result ok(Object data) {
        Result result = new Result();
        result.setCode("200");
        result.setMsg("success");
        result.setData(data);
        return result;
    }

    public static Result ok(Object data, String msg) {
        Result result = new Result();
        result.setCode("200");
        result.setMsg(msg);
        result.setData(data);
        return result;
    }

    public static Result ok(Object data, Object token) {
        Result result = new Result();
        result.setCode("200");
        result.setToken(token);
        result.setData(data);
        return result;
    }

    public static Result error() {
        Result result = new Result();
        result.setCode("500");
        result.setMsg("error");
        result.setData(null);
        return result;
    }

    public static Result error(String msg) {
        Result result = new Result();
        result.setCode("500");
        result.setMsg(msg);
        result.setData(null);
        return result;
    }

    public static Result errorToken(String msg) {
        Result result = new Result();
        result.setCode("801");
        result.setMsg(msg);
        result.setData(null);
        return result;
    }
}
