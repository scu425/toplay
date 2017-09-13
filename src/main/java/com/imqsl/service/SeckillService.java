package com.imqsl.service;

import com.imqsl.domain.Seckill;

/**
 * Created by imqsl on 2017/9/13.
 */
public interface SeckillService {
    //增加秒杀
    void addSeckill(Seckill seckill);

    //删除秒杀
    void removeSeckill(Integer seckill_id);

    //修改秒杀
    void modifySeckill(Seckill seckill);

    //查询秒杀
    Seckill findSeckill(Seckill seckill);
}
