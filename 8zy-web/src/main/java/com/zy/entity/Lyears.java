package com.zy.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.zy.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 标签表-年代标签表3
 * </p>
 *
 * @author fyl
 * @since 2019-03-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Lyears extends BaseEntity {

    private static final long serialVersionUID = 1L;
    /**
     * 表主键
     */
    @TableId(type=IdType.AUTO)
    private String id;
    /**
     * 名称
     */
    private String name;

    private String indexs;


}
