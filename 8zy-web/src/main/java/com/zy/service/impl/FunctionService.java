package com.zy.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.entity.YtFunction;
import com.zy.mapper.YtFunctionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FunctionService {
    @Autowired
    private YtFunctionMapper functionMapper;

    // 初始化角色页面绑定功能的树信息

    public List<YtFunction> initFunctionTree() {
        // 查询所有的根节点
        List<YtFunction> list = this.functionMapper.selectRoot();
        this.getChild(list);
        return list;
    }

    private void getChild(List<YtFunction> list) {
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                // 如果根节点是父节点的话,获取它的子节点
                if (list.get(i).getIsparent().intValue()==1) {
                    // 通过id去查询所有的子节点
                    QueryWrapper<YtFunction> queryWrapper = new QueryWrapper<>();
                    queryWrapper.eq("pid", list.get(i).getId());
                    queryWrapper.ne("id", list.get(i).getId());
                    List<YtFunction> functions = this.functionMapper.selectList(queryWrapper);
                    list.get(i).setFunctions(functions);
                    list.get(i).setNodes(functions);
                    this.getChild(functions);
                }
            }

        }
    }

    /**
     * 查询所有菜单并封装为指定格式
     *
     * @return
     */

    public List<YtFunction> queryAllMenu() {
        List<YtFunction> list = functionMapper.selectRootMenu();
        getChildMenu(list);
        return list;
    }

    private void getChildMenu(List<YtFunction> list) {
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                // 如果根节点是父节点的话,获取它的子节点
                if (list.get(i).getIsparent().intValue()==1) {
                    // 通过id去查询所有的子节点
                    QueryWrapper<YtFunction> queryWrapper = new QueryWrapper<>();
                    queryWrapper.eq("pid", list.get(i).getId());
                    queryWrapper.ne("id", list.get(i).getId());
                    queryWrapper.eq("ismenu", "1");
                    List<YtFunction> functions = this.functionMapper.selectList(queryWrapper);
                    list.get(i).setFunctions(functions);
                }
            }

        }
    }

    /**
     * 通过用户ID去查询菜单并封装为指定格式
     *
     * @param userid
     * @return
     */
    public List<YtFunction> queryMenuByUser(String userid) {

        List<YtFunction> list = this.functionMapper.selectRootMenuByUserId(userid);
        getChildMenuByUserId(list, userid);
        return list;
    }

    public void getChildMenuByUserId(List<YtFunction> list, String userid) {
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                // 如果根节点是父节点的话,获取它的子节点
                if (1==list.get(i).getIsparent()) {
                    // 通过id去查询所有的子节点
                    List<YtFunction> functions = this.functionMapper.getChildMenuByUserId(userid, list.get(i).getId());
                    list.get(i).setFunctions(functions);
                }
            }
        }
    }

    public List<YtFunction> getSelectionFunctions(String roleId) {
        List<YtFunction> list = this.functionMapper.findListByRoleId(roleId);
        return list;
    }
}