package com.zy.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zy.entity.YtUserinfo;

import java.util.List;

/**
 * <p>
 * ???? 服务类
 * </p>
 *
 * @author fyl
 * @since 2019-03-05
 */
public interface IYtUserinfoService extends IService<YtUserinfo> {


    public IPage<YtUserinfo> queryCondition(Integer page, Integer rows, YtUserinfo loginUser, String username,
                                            String deptid, String protype);

	public YtUserinfo getUserByrenId(String userid);

    public List<YtUserinfo> findUserByIdOrEn(String userenid);
}
