package com.zy.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author fyl
 * @since 2019-03-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("yt_user_role_relation")
public class YtUserRoleRelation extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * ?????
     */
    @TableId("USERID")
    private String userid;

    /**
     * 角色id
     */
    @TableField("ROLEID")
    private String roleid;


}
