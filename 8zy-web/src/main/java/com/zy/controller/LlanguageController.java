package com.zy.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.controller.BaseController;
import com.zy.entity.YtUserinfo;
import com.zy.entity.Llanguage;
import com.zy.service.ILlanguageService;
import com.zy.utils.BootStrapParams;
import com.zy.utils.SessionUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * 标签表-语言标签表1 前端控制器
 * </p>
 *
 * @author fyl
 * @since 2019-03-16
 */
@Controller
@RequestMapping("llanguage")
public class LlanguageController extends BaseController {

    @Autowired
    ILlanguageService iLlanguageService;

    /*** 带分页的用户查询 **/
    @RequestMapping(value = "query", method = RequestMethod.POST)
    @ResponseBody
    public String queryCondition(@RequestBody BootStrapParams bspage, HttpServletRequest request, HttpServletResponse response) {
        try {
            String name = bspage.get("name");
            QueryWrapper<Llanguage> queryWrapper = new QueryWrapper<>();
            if (StringUtils.isNotBlank(name)) {
                queryWrapper.like("name", name);
            }
            Page<Llanguage> pages = new Page<>(bspage.getPage(), bspage.getRows());
            IPage<Llanguage> result = this.iLlanguageService.page(pages, queryWrapper);
            return getjsonTable(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 添加
     *
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public String addContact(@RequestBody Llanguage llanguage, HttpServletRequest request, HttpServletResponse response) {
        try {
            System.out.println(llanguage);
            if (iLlanguageService.save(llanguage)) {
                return "success";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fail";
    }

    /**
     * 编辑
     *
     * @return
     */
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    @ResponseBody
    public String edit(@RequestBody Llanguage llanguage, HttpServletRequest request, HttpServletResponse response) {
        try {
            System.out.println(llanguage);
            if (iLlanguageService.updateById(llanguage)) {
                return "success";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fail";
    }

    /**
     * 删除
     *
     * @return
     */
    @RequestMapping(value = "del", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestBody BootStrapParams bspage, HttpServletRequest request) {
        try {
            YtUserinfo userInfo = SessionUtil.getCurrentUser(request);
            if (userInfo == null) {
                return "请登录系统";
            }
            String ids = bspage.get("id");
            if (StringUtils.isNotBlank(ids)) {
                String[] list = ids.split(",");
                if (list != null) {
                    for (String id : list) {
                        this.iLlanguageService.removeById(id);
                    }
                    return "success";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fail";
    }
}
