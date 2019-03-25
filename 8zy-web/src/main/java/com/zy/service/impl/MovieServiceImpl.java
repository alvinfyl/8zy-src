package com.zy.service.impl;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zy.entity.Movie;
import com.zy.mapper.MovieMapper;
import com.zy.service.IMovieService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 电影电视剧详情 服务实现类
 * </p>
 *
 * @author fyl
 * @since 2019-03-16
 */
@Service
public class MovieServiceImpl extends ServiceImpl<MovieMapper, Movie> implements IMovieService {

}
