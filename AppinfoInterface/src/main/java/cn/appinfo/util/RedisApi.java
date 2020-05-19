package cn.appinfo.util;

import lombok.Data;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Data
public class RedisApi {

    private JedisPool jedisPool;

    /*获取jedis*/
    private Jedis getJedis() {
        return jedisPool.getResource();
    }

    /*释放jedis*/
    private void closeJedis(Jedis jedis) {
        jedisPool.returnResource(jedis);
    }

    /**
     * 依据key获取数据
     *
     * @param key
     * @return
     */
    public String get(String key) {
        Jedis jedis = getJedis();
        String value = jedis.get(key);
        closeJedis(jedis);
        return value;
    }

    /**
     * 存值
     *
     * @param key
     * @param value
     * @return
     */
    public String set(String key, String value) {
        Jedis jedis = getJedis();
        String result = jedis.set(key, value);
        closeJedis(jedis);
        return result;
    }

    /**
     * 存值 设置有效时间
     *
     * @param key
     * @param seconds
     * @param value
     * @return
     */
    public String set(String key, int seconds, String value) {
        Jedis jedis = getJedis();
        String result = jedis.setex(key, seconds, value);
        closeJedis(jedis);
        return result;
    }

    /**
     * 查询是否存在
     *
     * @param key
     * @return
     */
    public boolean exists(String key) {
        Jedis jedis = getJedis();
        boolean result = jedis.exists(key);
        closeJedis(jedis);
        return result;
    }

    /**
     * 查询 key的有效时间
     *
     * @param key
     * @return
     */
    public Long ttl(String key) {
        Jedis jedis = getJedis();
        Long result = jedis.ttl(key);
        closeJedis(jedis);
        return result;
    }

    /**
     * 删除key
     *
     * @param key
     * @return
     */
    public Long del(String key) {
        Jedis jedis = getJedis();
        Long result = jedis.del(key);
        closeJedis(jedis);
        return result;
    }
}
