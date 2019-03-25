package com.zy.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 标签表-导演
 * </p>
 *
 * @author fyl
 * @since 2019-03-24
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Ldirector extends BaseEntity {

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
     */
    private String bigtype;


}
