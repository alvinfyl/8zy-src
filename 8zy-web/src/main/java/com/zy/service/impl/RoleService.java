package com.zy.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.entity.YtRole;
import com.zy.entity.YtRoleFuncRelation;
import com.zy.entity.YtUserinfo;
import com.zy.mapper.YtRoleFuncRelationMapper;
import com.zy.mapper.YtRoleMapper;
import com.zy.mapper.YtUserRoleRelationMapper;
import com.zy.utils.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class RoleService {

    @Autowired
    private YtRoleMapper roleMapper;

    @Autowired
    private YtRoleFuncRelationMapper roleFunctionMapper;

    @Autowired
    private YtUserRoleRelationMapper userRoleMapper;

    /**
     * 添加角色，并设置好角色的导航
     *
     * @param role
     */
    public void addRole(YtRole role, String ids, HttpServletRequest request) {
        YtUserinfo tmp = SessionUtil.getCurrentUser(request);
        // 插入角色数据
        role.setId(UUID.randomUUID().toString());
        role.setCreatetime(LocalDateTime.now());
        if (tmp != null) {
            role.setCreateuser(tmp.getUserid().toString());// 用户ID
        }
        this.roleMapper.insert(role);
        String[] strings = ids.split(",");
        // 绑定权限数据
        YtRoleFuncRelation roleFunction = null;
        for (String functionId : strings) {
            roleFunction = new YtRoleFuncRelation();
            roleFunction.setFunctionid(functionId);
            roleFunction.setRoleid(role.getId());
            roleFunctionMapper.insert(roleFunction);
        }
    }

    /**
     * 查询所有角色
     *
     * @return
     */
    public List<YtRole> queryAllRole() {
        List<YtRole> list = roleMapper.selectList(null);
        return list;
    }

    /**
     * 根据用户名获取该用户的角色
     **/
    public YtRole queryRoleByUserId(String userId) {
        return this.roleMapper.queryRoleByUserId(userId);
    }

    /**
     * 编辑角色，并设置好角色对应的导航菜单
     *
     * @param role
     * @param request
     */
    public void editRole(YtRole role, String functionIds,
                         HttpServletRequest request) {
        String[] strings = functionIds.split(",");
        // 将原有中间表的数据删除,重新进行绑定
        roleFunctionMapper.delete(new QueryWrapper<YtRoleFuncRelation>().eq("roleid",role.getId()));
        if (strings != null && strings.length > 0) {
            YtRoleFuncRelation roleFunction = null;// 角色导航关联关系表
            for (String functionId : strings) {
                roleFunction = new YtRoleFuncRelation();
                roleFunction.setFunctionid(functionId);
                roleFunction.setRoleid(role.getId());
                roleFunctionMapper.insert(roleFunction);
            }
        }
        request.getSession().setAttribute("roletype", role.getRoletype());
        this.roleMapper.updateById(role);
    }

    /**
     * 删除角色
     *
     */
    public String delRole(String id) {
        // 删除角色
        this.roleMapper.deleteById(id);
        return "success";
    }
}
