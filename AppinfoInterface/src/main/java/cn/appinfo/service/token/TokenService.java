package cn.appinfo.service.token;

public interface TokenService {
    /**
     * 生成token
     *
     * @param userAgent
     * @param object
     * @return
     * @throws Exception
     */
    public String generateToken(String userAgent, Object object) throws Exception;

    /**
     * 保存token1至 缓存数据库 redis
     *
     * @param token
     * @param object
     * @throws Exception
     */
    public void save(String token, Object object) throws Exception;

    /**
     * 验证token是否有效
     *
     * @param userAgent
     * @param token
     * @return
     * @throws Exception
     */
    public boolean validate(String userAgent, String token) throws Exception;


    /**
     * 删除token
     *
     * @param token
     * @return
     */
    public Long delete(String token);


    /**
     * 置换token
     *
     * @param userAgent
     * @param token
     * @return
     * @throws Exception
     */
    public String reloadToken(String userAgent, String token) throws Exception;

}
