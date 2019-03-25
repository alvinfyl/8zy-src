package com.zy.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zy.entity.YtRole;
import com.zy.entity.YtUserinfo;
import com.zy.service.IYtRoleService;
import com.zy.service.impl.RoleService;
import com.zy.utils.BootStrapParams;
import com.zy.utils.SessionUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequestMapping("role")
@Controller
public class RoleController extends BaseController {

    private static final Logger LOGGER = LoggerFactory.getLogger(RoleController.class);

    private static final ObjectMapper MAPPER = new ObjectMapper();
    @Autowired
    private RoleService roleService;
    @Autowired
    private IYtRoleService iroleService;
    @Autowired
    private ObjectMapper mapper;

    /**
     * 查询所有
     *
     * @return
     */
    @RequestMapping(value = "search", method = RequestMethod.POST)
    @ResponseBody
    public String queryList(@RequestBody BootStrapParams bspage, HttpServletRequest request) {
        List<YtRole> list = null;
        String rolename = bspage.get("rolename");
        QueryWrapper<YtRole> queryWrapper = new QueryWrapper<>();
        if (StringUtils.isNotBlank(rolename)) {
            queryWrapper.eq("rolename", rolename);
        }
        list = this.iroleService.list(queryWrapper);
        return getjson(list);
    }


    @RequestMapping(value = "search1", method = RequestMethod.POST)
    @ResponseBody
    public String queryList1(HttpServletRequest request) {
        List<YtRole> list = this.roleService.queryAllRole();
        if (list != null && list.size() > 0) {
            String jsonData;
            try {
                jsonData = MAPPER.writeValueAsString(list);
                return jsonData;
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 添加角色并绑定权限
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public String addRole(@RequestBody BootStrapParams bspage, HttpServletRequest request) {
        String rolename = bspage.get("rolename");
        String roletype = bspage.get("roletype");
        String remark = bspage.get("memo");
        String ids = bspage.get("ids");
        String roletypei = "0";
        if (StringUtils.isNotBlank(roletype)) {
            roletypei = roletype;
        }
        YtUserinfo userInfo = SessionUtil.getCurrentUser(request);
        if (userInfo != null) {
            if (StringUtils.isBlank(rolename)) {
                return "角色名称为空";
            }
            try {
                YtRole role = new YtRole();
                role.setRolename(rolename);
                role.setRoletype(roletypei);
                if (StringUtils.isNotBlank(remark)) {
                    role.setMemo(remark);//描述
                }
                this.roleService.addRole(role, ids, request);
                return "success";
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return "请登录系统";
    }

    /**
     * 根据id查看
     *
     * @return
     */
    @RequestMapping(value = "view", method = RequestMethod.POST)
    @ResponseBody
    public String view(@RequestBody BootStrapParams bspage) {
        YtRole role = this.iroleService.getById(bspage.get("id"));
        try {
            String jsonData = MAPPER.writeValueAsString(role);
            return jsonData;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 查询name对应的角色是否存在
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "byname", method = RequestMethod.POST)
    public boolean byName(String name, HttpServletRequest request) {
        boolean flag = false;
        YtRole role = this.iroleService.getOne(new QueryWrapper<YtRole>().eq("rolename", name));
        if (role == null) {
            flag = true;
        }
        return flag;
    }

    /**
     * 编辑
     *
     * @return
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    @ResponseBody
    public String editRole(@RequestBody BootStrapParams bspage, HttpServletRequest request) {
        String rolename = bspage.get("rolename");
        String roletype = bspage.get("roletype");
        String remark = bspage.get("memo");
        String ids = bspage.get("ids");
        String roletypei = "0";
        if (StringUtils.isNotBlank(roletype)) {
            roletypei = roletype;
        }
        String roleid = bspage.get("roleid");
        YtUserinfo userInfo = SessionUtil.getCurrentUser(request);
        if (userInfo != null) {
            if (StringUtils.isBlank(rolename)) {
                return "角色名称为空";
            }
            if (StringUtils.isBlank(roleid)) {
                return "角色id为空";
            }
            try {
                YtRole role = new YtRole();
                role.setRolename(rolename);
                role.setRoletype(roletypei);
                role.setId(roleid);
                if (StringUtils.isNotBlank(remark)) {
                    role.setMemo(remark);
                }
                this.roleService.editRole(role, ids, request);
                return "success";
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "请登录系统";
    }

    @RequestMapping(value = "del/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String del(@PathVariable("id") String id, HttpServletRequest request) {
        YtUserinfo userInfo = SessionUtil.getCurrentUser(request);
        if (userInfo != null) {
            String result = this.roleService.delRole(id);
            return result;
        }
        return "请登录系统";
    }
}
