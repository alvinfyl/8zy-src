package com.zy.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.controller.BaseController;
import com.zy.entity.Movie;
import com.zy.service.IMovieService;
import com.zy.utils.BootStrapParams;
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
 * 电影电视剧详情 前端控制器
 * </p>
 *
 * @author fyl
 * @since 2019-03-16
 */
@Controller
@RequestMapping("movie")
public class MovieController extends BaseController {


    @Autowired
    IMovieService iMovieService;

    /*** 带分页的用户查询 **/
    @RequestMapping(value = "querymovie", method = RequestMethod.POST)
    @ResponseBody
    public String queryCondition(@RequestBody BootStrapParams bspage, HttpServletRequest request, HttpServletResponse response) {
        try {
            String username = bspage.get("username");
            QueryWrapper<Movie> queryWrapper = new QueryWrapper<>();
            Page<Movie> pages = new Page<>(bspage.getPage(), bspage.getRows());
            IPage<Movie> result = this.iMovieService.page(pages);
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
    @RequestMapping(value = "addMovie", method = RequestMethod.POST)
    @ResponseBody
    public String addContact(@RequestBody Movie movie, HttpServletRequest request, HttpServletResponse response) {
        try {
            System.out.println(movie);
            if (iMovieService.save(movie)) {
                System.out.println("ok");
                return "success";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "fail";
    }

}
