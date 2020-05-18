package cn.appinfo.exception;

import lombok.Data;

@Data
public class TokenException extends  RuntimeException {
    private static final  long serialVersionUID=1L;
    private String msg;

    public TokenException(){
        super();
    }

    public TokenException(String msg){
        super();
        this.msg=msg;
    }

}
