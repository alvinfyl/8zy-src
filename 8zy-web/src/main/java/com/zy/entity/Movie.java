package com.zy.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.zy.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * <p>
 * 电影电视剧详情
 * </p>
 *
 * @author fyl
 * @since 2019-03-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Movie extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 表主键
     */
    @TableId(type=IdType.AUTO)
    private String id;

    /**
     * 80s的视频id 五位数24163
     */
    private String keyid;

    /**
     * 大类型
     * 首页 电影 电视剧 动漫 综艺 音乐MV 视频短片 公开课
     */
    private String bigtype;
    /**
     * 主图
     */
    private String mainimg;

    /**
     * 标题
     */
    private String title;

    /**
     * 描述
     */
    private String describes;

    /**
     * 别名
     */
    private String alias;

    /**
     * 演员列表 标签类型label
     */
    private String lPerformers;

    /**
     * 类型
     */
    private String lType;

    private String lArea;

    /**
     * 语言类型
     */
    private String lLanguage;

    /**
     * 导演
     */
    private String lDirector;

    /**
     * 上映日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate  releasedate;

    /**
     * 片长
     */
    private Integer runningtime;

    /**
     * 更新日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate updatetime;

    /**
     * 豆瓣评分
     */
    private Double score;

    /**
     * 豆瓣链接
     */
    private String dblink;

    /**
     * 剧情介绍
     */
    private String introduction;

    /**
     * 视频截图
     */
    private String detailimg;

    /**
     * 点击量 用来排行热门
     */
    private Long clicks;

}
