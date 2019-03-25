package com.zy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zy.entity.YtRole;


/**
 * <p>
 * 角色表 Mapper 接口
 * </p>
 *
 * @author fyl
 * @since 2019-03-05
 */
public interface YtRoleMapper extends BaseMapper<YtRole> {


    public YtRole queryRoleByUserId(String userId);

}
