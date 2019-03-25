package com.zy.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.zy.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 标签表-类型标签表2
 * </p>
 *
 * @author fyl
 * @since 2019-03-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Ltype extends BaseEntity {

    private static final long serialVersionUID = 1L;
    /**
     * 表主键
     */
    @TableId(type=IdType.AUTO)
    private String id;
    /**
     * 标签名称
     */
    private String name;

    /**
     * 自定义排序/movie/list/a0a1b3c2
     */
    private String indexs;

    /**
     * 大类型
     * 首页 电影 电视剧 动漫 综艺 音乐MV 视频短片 公开课
     */
    private String bigtype;

}
