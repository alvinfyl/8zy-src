package com.zy.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 电影电视剧下载链接
 * </p>
 *
 * @author fyl
 * @since 2019-03-24
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Downlinks extends BaseEntity {

    private static final long serialVersionUID = 1L;
    /**
     * 表主键
     */
    @TableId(type = IdType.AUTO)
    private String id;
    /**
     * 关联的视频电影电视剧ID
     */
    private String keyid;

    /**
     * 迅雷地址thunder
     */
    private String thunder;

    /**
     * mp4下载地址
     */
    private String downlink;

    /**
     * 链接名字
     */
    private String linkname;

    /**
     * 视频大小，没有为空
     */
    private String tsize;

    /**
     * 排序字段
     */
    private Integer sorts;

    /**
     * 视频类型 bt bd hd ..
     */
    private String type;


}
