package com.zy.controller;

import com.zy.entity.FunctionVO;
import com.zy.entity.YtFunction;
import com.zy.entity.YtUserinfo;
import com.zy.service.impl.FunctionService;
import com.zy.utils.BootStrapParams;
import com.zy.utils.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("function")
@Controller
public class FunctionController extends BaseController {

    @Autowired
    private FunctionService functionService;

    // 初始化角色页面绑定功能的树信息
    @RequestMapping(value = "initFunctionTree", method = RequestMethod.POST)
    @ResponseBody
    public String initFunctionTree() {
        try {
            List<YtFunction> list = functionService.initFunctionTree();
            return getjson(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 编辑角色页面绑定功能的树信息
    @RequestMapping(value = "getSelectionFunctions", method = RequestMethod.POST)
    @ResponseBody
    public String getSelectionFunctions(@RequestBody BootStrapParams bspage) {
        String roleId = bspage.get("roleId");
        List<YtFunction> list = functionService.getSelectionFunctions(roleId);
        return getjson(list);
    }

    // 根据当前用户加载左侧菜单
    @RequestMapping(value = "queryMenuByUser", method = RequestMethod.POST)
    @ResponseBody
    public String queryMenuByUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            YtUserinfo userInfo = SessionUtil.getCurrentUser(request);
            List<YtFunction> list = null;
            List<FunctionVO> viewList = new ArrayList<FunctionVO>();
            if (userInfo != null) {
                list = functionService.queryMenuByUser(userInfo.getUserid());
                for (YtFunction f : list) {
                    viewList.add(new FunctionVO(f));
                }
                return getjson(viewList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
