package com.zy.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.zy.entity.YtRole;
import com.zy.entity.YtUserRoleRelation;
import com.zy.entity.YtUserinfo;
import com.zy.service.IYtRoleService;
import com.zy.service.IYtUserRoleRelationService;
import com.zy.service.IYtUserinfoService;
import com.zy.utils.IpAddressutils;
import com.zy.utils.MD5;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController  extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    IYtUserinfoService userinfoService;
    @Autowired
    IYtRoleService roleService;
    @Autowired
    IYtUserRoleRelationService userRoleRelationService;


    private final Gson gson = new GsonBuilder().setDateFormat("yyyyMMddHHmmss").create();

    private Map<String, Logintimes> loginusers = new HashMap<String, Logintimes>();


    @RequestMapping(value = "login/out", method = RequestMethod.GET)
    public String loginout(HttpServletRequest request) {
        // UserInfo user = SessionUtil.getCurrentUser(request);

        // request.getSession(true).invalidate();
        Subject subject = SecurityUtils.getSubject();
        if (subject != null) {
            subject.logout();
        }
        return "redirect:/login.jsp";
    }



    /**
     * 这个方法是给/login.jsp登陆用的
     **/
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, String checkcode, String userid, String password2) {

        // DesEncrypt desEncrypt = new DesEncrypt();
        String uid = userid;// desEncrypt.decrypt(userid);
        // String pwd = password2;
        String pwd = password2.toUpperCase();// desEncrypt.decrypt(password2);
        YtUserinfo model = new YtUserinfo();
        model.setPassword(pwd);
        model.setUseren(uid);

        String key = (String) request.getSession().getAttribute("key");
        ModelAndView modelAndView = null;
        //if (StringUtils.isNotBlank(checkcode) && checkcode.trim().equalsIgnoreCase(key)) {
        if(true){
            // if(true){//测试使用
            if (loginusers.get(uid) != null) {
                long interval = (new Date().getTime() - loginusers.get(uid).getLasttime().getTime()) / 1000;
                if (interval < 900) {
                    if (loginusers.get(uid).getTimes() > 4) {// 大于5次 锁定用户
                        boolean js = false;
                        QueryWrapper<YtUserinfo> queryWrapper = new QueryWrapper<>();
                        queryWrapper.eq("status",2);
                        queryWrapper.eq("userid",uid);
                        YtUserinfo nn_list = userinfoService.getOne(queryWrapper.last( " limit 1 "));
                        if (nn_list != null) {
                            if (nn_list.getLockcount() != null) {
                                js = true;
                            }
                        }
                        if (js) {
                            loginusers.remove(uid);
                            YtUserinfo upui = new YtUserinfo();
                            upui.setId(nn_list.getId());
                            upui.setLockcount(0);
                            userinfoService.updateById(upui);
                        } else {
                            modelAndView = new ModelAndView("forward:/login.jsp");
                            modelAndView.addObject("message", "该账号密码输入超过限定次数，请再等待" + (900 - interval) + "秒或联系管理员解锁！");
                            return modelAndView;
                        }
                    }
                } else {
                    loginusers.remove(uid);
                }
            }

            // 使用shiro提供的方式进行认证
            Subject subject = SecurityUtils.getSubject();// 状态为“未认证”
            String password = model.getPassword();
            password  = MD5.getMD5(password);
            // 用户名密码令牌
            AuthenticationToken token = new UsernamePasswordToken(model.getUseren(), password);
            try {
                subject.login(token);
                YtUserinfo user = (YtUserinfo) subject.getPrincipal();

                String deptid = user.getDeptid();
                if (StringUtils.isNotBlank(deptid)) {
                }

                // 获取roletype存入session中
                YtUserRoleRelation urr =   userRoleRelationService.getOne(new QueryWrapper<YtUserRoleRelation>().eq("userid",user.getUserid()));
                if (urr!=null&&StringUtils.isNotBlank(urr.getRoleid())) {
                    YtRole role = roleService.getById(urr.getRoleid());
                    if (role != null) {
                        user.setRole(role);
                        request.getSession().setAttribute("role", role);
                    }
                }
                LocalDateTime date = user.getLastupdatetime();
                if (2 != (user.getProtype())) {// 不为接口用户
                    // 密码3个月修改校验 大于3个月返回true 初始化密码登录 强制修改
					/*if (date != null && localdateLtDate(date)) {
						Base64Encoder encoder = new Base64Encoder();
						modelAndView = new ModelAndView(
								"redirect:/forgetpwd.jsp?" + encoder.encode(user.getUserid().getBytes()));
						return modelAndView;
					}*/
                }
                logger.info("{}", gson.toJson(user));
                request.getSession().setAttribute("loginUser", gson.toJson(user));
                request.getSession().setAttribute("sign", user.getSign());
                //获取ip地址
                String ip = IpAddressutils.getIpAddress(request);
                loginusers.remove(uid);
                modelAndView = new ModelAndView("redirect:/index.jsp");

                if (date == null) {
                    request.getSession().setAttribute("isfirst", "0");
                } else {
                    request.getSession().setAttribute("isfirst", "0");
                }
                return modelAndView;
            } catch (UnknownAccountException e) {// 账号不存在异常
                modelAndView = new ModelAndView("forward:/login.jsp");
                modelAndView.addObject("message", "账号不存在");
                return modelAndView;
            } catch (Exception e) {
                e.printStackTrace();
                modelAndView = new ModelAndView("forward:/login.jsp");
                List<YtUserinfo> nn_list = userinfoService.findUserByIdOrEn(uid);
                if (nn_list != null && nn_list.size() > 0) {
                    /*
                     * if ("4".equals(nn_list.get(0).getStatus())) {//锁定用户
                     * modelAndView.addObject("message", "账号密码输入超过限定次数，请联系管理员解锁！"); return
                     * modelAndView; }
                     */
                    model.setUserid(nn_list.get(0).getUserid());
                    //获取ip地址
                    String ip = IpAddressutils.getIpAddress(request);
                }

                if (loginusers.get(uid) == null) {
                    Logintimes ll = new Logintimes(new Date(), 1);
                    loginusers.put(uid, ll);
                } else {
                    long interval = (new Date().getTime() - loginusers.get(uid).getLasttime().getTime()) / 1000;
                    loginusers.get(uid).setLasttime(new Date());
                    if (interval < 900) {// 5分钟
                        loginusers.get(uid).setTimes(loginusers.get(uid).getTimes() + 1);
                        /*
                         * if(loginusers.get(uid).getTimes()>5){//大于5次 锁定用户 if (nn_list != null &&
                         * nn_list.size() > 0) { UserInfo uu = new UserInfo();
                         * uu.setUserid(nn_list.get(0).getUserid()); uu.setStatus("4");//4锁定
                         * userMapper.updateByPrimaryKeySelective(uu); loginusers.remove(uid);
                         *//*
                         * modelAndView.addObject("message", "账号密码输入超过限定次数，请联系管理员解锁！"); return
                         * modelAndView;
                         *//*
                         * } }
                         */
                    } else {
                        loginusers.get(uid).setTimes(1);
                    }
                }
                if (loginusers.get(uid) != null) {
                    // 密码不正确异常
                    modelAndView.addObject("message", "密码不正确 剩余次数:" + (5 - loginusers.get(uid).getTimes()));
                }

                if (loginusers.get(uid).getTimes() > 4) {// 大于5次 锁定用户
                    modelAndView = new ModelAndView("forward:/login.jsp");
                    modelAndView.addObject("message", "该账号密码输入超过限定次数，请再等待900秒或联系管理员解锁！");// 或联系管理员解锁
                    return modelAndView;
                }

                return modelAndView;
            }
        }
        List<YtUserinfo> nn_list = userinfoService.findUserByIdOrEn(uid);
        if (nn_list != null && nn_list.size() > 0) {
            model.setUserid(nn_list.get(0).getUserid());
            //获取ip地址
            String ip = IpAddressutils.getIpAddress(request);
        }
        // 验证码输入错误,跳转到登录页面,设置错误信息
        modelAndView = new ModelAndView("forward:/login.jsp");
        modelAndView.addObject("message", "验证码输入错误");
        // 密码不正确异常
        return modelAndView;
    }

    /**
     * 这个方法是给/new_md_bs/login用的
     **/
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView showlogin(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("redirect:/login.jsp");
        return modelAndView;
    }
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("redirect:/index.jsp");
        return modelAndView;
    }

    class Logintimes {
        private Date lasttime;
        private int times;

        Logintimes(Date lasttime, int times) {
            this.lasttime = lasttime;
            this.times = times;
        }

        public Date getLasttime() {
            return lasttime;
        }

        public void setLasttime(Date lasttime) {
            this.lasttime = lasttime;
        }

        public int getTimes() {
            return times;
        }

        public void setTimes(int times) {
            this.times = times;
        }
    }


}
