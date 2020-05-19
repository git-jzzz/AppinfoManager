package cn.appinfo.service.token;

import cn.appinfo.exception.TokenException;
import cn.appinfo.pojo.BackendUser;
import cn.appinfo.pojo.DevUser;
import cn.appinfo.util.MD5;
import cn.appinfo.util.RedisApi;
import com.alibaba.fastjson.JSONArray;
import nl.bitwalker.useragentutils.UserAgent;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Service
public class TokenServiceImpl implements TokenService {

    @Resource
    public RedisApi redisApi;

    @Override
    public String generateToken(String userAgent, Object object) throws Exception {
        StringBuilder str = new StringBuilder();
        str.append("token:");
//判断设备
        UserAgent userAgent1 = UserAgent.parseUserAgentString(userAgent);
        if (userAgent1.getOperatingSystem().isMobileDevice()) {
            str.append("MOBILE-");
        } else {
            str.append("PC-");
        }
        str.append(MD5.getMd5(object instanceof BackendUser ? ((BackendUser) object).getUserCode() : ((DevUser) object).getDevCode(), 32) + "-");
        str.append((object instanceof BackendUser ? ((BackendUser) object).getId() : ((DevUser) object).getId()) + "-");
        str.append(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + "-");
        str.append(MD5.getMd5(userAgent, 32));
        return str.toString();
    }

    @Override
    public void save(String token, Object object) throws Exception {
        if (token.startsWith("token:PC-")) {
//        pc端时间限制
            redisApi.set(token, 2 * 60 * 60, JSONArray.toJSONString(object));
        } else {
            redisApi.set(token, JSONArray.toJSONString(object));
        }
    }

    @Override
    public boolean validate(String userAgent, String token) throws TokenException {
        if (token == null || !redisApi.exists(token)) {
            throw new TokenException("messgae: token is invalid:" + token);
        }
       /* String agentMD5 = token.split("-")[3];
        if (!MD5.getMd5(userAgent, 6).equals(agentMD5)) {
            throw new Exception("userAgent不一致！");
        }*/
        return true;
    }

    @Override
    public Long delete(String token) {
        return redisApi.del(token);
    }


    //token置换保护时间
    private long protectedTime = 30 * 60;
    //    延时时间
    private int delay = 2 * 60;

    @Override
    public String reloadToken(String userAgent, String token) throws Exception {
//验证token是否有效
       /* if (!redisApi.exists(token)) {
            throw new Exception("token未知或已过期！");
        }*/
        //判断是否在保护期内
        Date gentime = new SimpleDateFormat("yyyyMMddHHmmss").parse(token.split("-")[3]);
        long passed = Calendar.getInstance().getTimeInMillis() - gentime.getTime();
        if (passed < protectedTime * 1000) {
            System.out.println("token置换保护期内 无法置换，剩余" + (protectedTime * 1000 - passed) / 1000 + "s");
            return null;
        }
//        置换
        String user = redisApi.get(token);
        BackendUser backendUser = null;
        DevUser devUser = null;
        try {
            backendUser = JSONArray.parseObject(user, BackendUser.class);
        } catch (Exception e) {
            devUser = JSONArray.parseObject(user, DevUser.class);
        }
//       生成token
        String newtoken = this.generateToken(userAgent, (backendUser != null ? backendUser : devUser));
//旧token延时过期
        redisApi.set(token, delay, user);
//新token保存至redis
        this.save(newtoken, (backendUser != null ? backendUser : devUser));
        return newtoken;
    }
}
