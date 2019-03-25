package com.zy.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 角色菜单关联表
 * </p>
 *
 * @author fyl
 * @since 2019-03-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("yt_role_func_relation")
public class YtRoleFuncRelation extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 菜单id
     */
    @TableField("FUNCTIONID")
    private String functionid;

    /**
     * 角色id
     */
    @TableField("ROLEID")
    private String roleid;


}
