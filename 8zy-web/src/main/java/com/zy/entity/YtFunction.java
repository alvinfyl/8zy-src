package com.zy.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 菜单表
 * </p>
 *
 * @author fyl
 * @since 2019-03-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("yt_function")
public class YtFunction extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableId("ID")
    private String id;

    /**
     * 菜单父id
     */
    @TableField("PID")
    private String pid;

    /**
     * 菜单名称
     */
    @TableField("NAME")
    private String name;

    /**
     * 描述
     */
    @TableField("DESCRIPTION")
    private String description;

    /**
     * 地址
     */
    @TableField("PATH")
    private String path;

    /**
     * 排序
     */
    @TableField("ZINDEX")
    private Integer zindex;

    /**
     * 图标
     */
    @TableField("ICON")
    private String icon;

    /**
     * 是否父亲导航
     */
    @TableField("ISPARENT")
    private Integer isparent;

    /**
     * 用户编辑相关shiro
     */
    @TableField("CODE")
    private String code;

    /**
     * 是否为菜单
     */
    @TableField("ISMENU")
    private String ismenu;

    @TableField(exist = false)
    private String text;
    public String getText() {
        return name;
    }

    @TableField(exist = false)
    private List<YtFunction> functions = new ArrayList<YtFunction>();
    @TableField(exist = false)
    private List<YtFunction> nodes = new ArrayList<YtFunction>();


}
