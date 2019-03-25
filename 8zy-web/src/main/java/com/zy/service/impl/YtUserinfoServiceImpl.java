package com.zy.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zy.entity.YtRole;
import com.zy.entity.YtUserinfo;
import com.zy.mapper.YtRoleMapper;
import com.zy.mapper.YtUserinfoMapper;
import com.zy.service.IYtUserinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * ???? 服务实现类
 * </p>
 *
 * @author fyl
 * @since 2019-03-05
 */
@Service
public class YtUserinfoServiceImpl extends ServiceImpl<YtUserinfoMapper, YtUserinfo> implements IYtUserinfoService {


    @Autowired
    private YtRoleMapper roleMapper;

    @Autowired
    private YtUserinfoMapper userMapper;

    /**
     * 根据主键useren获取用户
     **/
    public YtUserinfo getUserByrenId(String useren) {
        QueryWrapper<YtUserinfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("useren", useren);
        queryWrapper.eq("status", 2);
        YtUserinfo info = this.userMapper.selectOne(queryWrapper);
        if (info != null) {
            if ("2".equals(info.getStatus()) || "3".equals(info.getStatus())) {// 只返回状态正常用户、禁用
                String deptid = info.getDeptid();
                YtRole role = this.roleMapper.queryRoleByUserId(info.getUserid());
                if (role != null) {
                    info.setRole(role);
                }
                return info;
            }
        }
        return null;
    }

    public List<YtUserinfo> findUserByIdOrEn(String userenid) {
        return userMapper.findUserByIdOrEn(userenid);
    }


    /**
     * 按照条件，查询当前登录人能看到的用户列表
     *
     * @param username 可接收参数 userid,username,useren
     */
    public IPage<YtUserinfo> queryCondition(Integer page, Integer rows, YtUserinfo loginUser, String username,
                                            String deptid, String protype) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("username", username);
        if (protype != null) {
            map.put("protype", protype);// 用户类型
        }
        //map.put("deptid", deptid);

        map.put("roletype", loginUser.getRole().getRoletype());
        map.put("deptid", loginUser.getDeptid() + "%");
        map.put("curruserid", loginUser.getUserid());

        QueryWrapper<YtUserinfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.allEq(map);
        Page<YtUserinfo> pages = new Page<>(page, rows);
        IPage<YtUserinfo> list = this.userMapper.selectPage(pages, queryWrapper);

        for (YtUserinfo userInfo : list.getRecords()) {
            YtRole role = roleMapper.queryRoleByUserId(userInfo.getUserid());// 角色
            userInfo.setRole(role);
        }
        return list;
    }

}
