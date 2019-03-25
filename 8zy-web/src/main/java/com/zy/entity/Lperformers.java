package com.zy.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 标签表-演员表
 * </p>
 *
 * @author fyl
 * @since 2019-03-21
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Lperformers extends BaseEntity {

    private static final long serialVersionUID = 1L;
    /**
     * 表主键
     */
    @TableId(type = IdType.AUTO)
    private String id;
    /**
     * 名称
     */
    private String name;

    /**
     * 自定义排序
     */
    private String indexs;


}
