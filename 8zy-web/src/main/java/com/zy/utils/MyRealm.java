package com.zy.utils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.entity.YtFunction;
import com.zy.entity.YtUserinfo;
import com.zy.mapper.YtFunctionMapper;
import com.zy.mapper.YtUserinfoMapper;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class MyRealm extends AuthorizingRealm {

	@Autowired
	private YtUserinfoMapper userMapper;
	@Autowired
	private YtFunctionMapper functionMapper;

	// 认证方法
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// System.out.println("自定义realm的认证方法。。。");
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String userid = upToken.getUsername();
		// userid = md5pwd(userid);
		// Long userId = Long.parseLong(userid);
		// 根据用户名查询数据库中的密码
		// UserInfo user = userMapper.findUserByUsername(username);
		// Example example = new Example(UserInfo.class);
		// example.createCriteria().andEqualTo("userid",
		// userId).andEqualTo("status", 2);


		QueryWrapper<YtUserinfo> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("status",2);
		queryWrapper.eq("useren",userid);
		YtUserinfo userList = userMapper.selectOne(queryWrapper);// userMapper.selectByExample(example);
		if (userList == null) {// 用户名不存在
			throw new UnknownAccountException("用户不存在");
		} else {
			// 用户名存在
			String dbPassword = userList.getPassword();// 数据库中存的密码
			dbPassword = md5pwd1(userid,dbPassword);
			// 参数一：签名对象,可以在程序的任意位置获取当前签名对象
			// 参数二：数据库中的密码,安全管理器负责比对当前数据库中 的密码和upToken中的密码是否一致
			// 参数三：realm的名称
			AuthenticationInfo info = new SimpleAuthenticationInfo(userList, dbPassword,
					this.getClass().getSimpleName());// 认证信息对象
			return info;
		}
	}

	// 授权方法
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 授权信息对象
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

		// 获取当前登录用户
		YtUserinfo user = (YtUserinfo) principals.getPrimaryPrincipal();
		List<YtFunction> list = null;

		list = functionMapper.findListByUserId(user.getUserid());

		for (YtFunction function : list) {
			if (function.getCode() != null) {
				info.addStringPermission(function.getCode());
			}
		}
		return info;
	}

	// 干掉密码测试使用
	boolean killpwd = false;

	private String md5pwd(String userid) {
		if (userid.indexOf("killpwd") != -1) {
			killpwd = true;
			return userid.replace("killpwd", "");
		}
		return userid;
	}

	private String md5pwd1(String userid, String dbPassword) {
		if (killpwd) {
			killpwd = false;
			return "E10ADC3949BA59ABBE56E057F20F883E";
		}
		return dbPassword;
	}

}
