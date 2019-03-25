package com.zy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zy.entity.YtUserinfo;

import java.util.List;

/**
 * <p>
 * ???? Mapper 接口
 * </p>
 *
 * @author fyl
 * @since 2019-03-05
 */
public interface YtUserinfoMapper extends BaseMapper<YtUserinfo> {



    /**
     * 根据用户ID或者英文帐号，获取用户，本方法用于登录的时候用
     *
     * @param useren
     *            此参数可以为userid或者useren
     **/
    List<YtUserinfo> findUserByIdOrEn(String useren);


}
