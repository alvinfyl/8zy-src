package com.zy.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zy.entity.YtUserinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionUtil {

    private final static Gson gson = new GsonBuilder().setDateFormat("yyyyMMddHHmmss").create();

    public static YtUserinfo getCurrentUser(HttpServletRequest request) {
        //String loginUserjson = sessionProvider.getAttribute(request,response,"loginUser");
        if (request.getSession().getAttribute("loginUser") == null) {
            return null;
        }
        YtUserinfo userInfo = gson.fromJson(request.getSession().getAttribute("loginUser").toString(), YtUserinfo.class);
        return userInfo;
    }
}
