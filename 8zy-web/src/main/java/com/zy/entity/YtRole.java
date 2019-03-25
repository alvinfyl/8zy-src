package com.zy.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author fyl
 * @since 2019-03-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("yt_role")
public class YtRole extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableId("ID")
    private String id;

    /**
     * 角色名称
     */
    @TableField("ROLENAME")
    private String rolename;

    /**
     * 备注
     */
    @TableField("MEMO")
    private String memo;

    /**
     * 创建时间
     */
    @TableField("CREATETIME")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createtime;

    /**
     * 创建用户ID
     */
    @TableField("CREATEUSER")
    private String createuser;

    /**
     * 角色类型,用于数据访问权限
     */
    @TableField("ROLETYPE")
    private String roletype;

    /**
     * 编辑时间
     */
    @TableField("MODTIME")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime modtime;

    /**
     * 修改人
     */
    @TableField("MODUSER")
    private String moduser;


}
