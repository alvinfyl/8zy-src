package com.zy.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zy.entity.YtFunction;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * <p>
 * 菜单表 Mapper 接口
 * </p>
 *
 * @author fyl
 * @since 2019-03-05
 */
public interface YtFunctionMapper extends BaseMapper<YtFunction> {


    List<YtFunction> findListByUserId(String userid);

    List<YtFunction> selectRoot();

    List<YtFunction> findListByRoleId(String roleId);

    List<YtFunction> selectRootMenuByUserId(String userid);

    List<YtFunction> getChildMenuByUserId(@Param("userid") String userid, @Param("id") String id);

    List<YtFunction> selectRootMenu();


}
