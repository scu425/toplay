package com.imqsl.dao;

import com.imqsl.dao.provider.SuccessKilledDynaSqlProvider;
import com.imqsl.domain.SuccessKilled;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

import static com.imqsl.util.common.ToPlayConstants.SUCCESSKILLEDTABLE;

/**
 * Created by imqsl on 2017/9/11.
 */
public interface SuccessKilledDao {
    //动态插入
    @InsertProvider(type = SuccessKilledDynaSqlProvider.class, method = "insertWithParams")
    void dynaInsert(SuccessKilled successKilled);

    //动态查询
    @SelectProvider(type = SuccessKilledDynaSqlProvider.class, method = "selectWithParams")
    List<SuccessKilled> dynaSelect(SuccessKilled successKilled);

    //根据用户id删除
    @Delete("delete from " + SUCCESSKILLEDTABLE + " where user_id=#{user_id}")
    void delete(Integer user_id);
}