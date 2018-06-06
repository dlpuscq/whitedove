package com.whitedove.portal.dao;

/**
 * @description
 * @autoor Songcq
 * @date 2018/5/8 20:14
 */
public interface JedisClient {
    String get(String key);
    String set(String key, String value);
    String hget(String hkey, String key);
    long hset(String hkey, String key, String value);
    long incr(String key);
    long expire(String key, int second);
    long ttl(String key);
    long del(String key);
    long hdel(String hkey, String key);
}
