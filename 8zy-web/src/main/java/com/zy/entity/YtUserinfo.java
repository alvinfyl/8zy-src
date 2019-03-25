package com.zy.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zy.entity.BaseEntity;
import com.zy.entity.YtRole;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * <p>
 * ????
 * </p>
 *
 * @author fyl
 * @since 2019-03-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("yt_userinfo")
public class YtUserinfo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableId("ID")
    private String id;

    /**
     * 企业id
     */
    @TableField("CORPORATEID")
    private String corporateid;

    /**
     * 用户id
     */
    @TableField("USERID")
    private String userid;

    /**
     * 用户登录名
     */
    @TableField("USEREN")
    private String useren;

    /**
     * 用户名称
     */
    @TableField("USERNAME")
    private String username;

    /**
     * 密码
     */
    @TableField("PASSWORD")
    private String password;

    /**
     * 特服号
     */
    @TableField("CODE")
    private Integer code;

    /**
     * 联系人
     */
    @TableField("CONTACT")
    private String contact;

    /**
     * 联系人电话
     */
    @TableField("MOBILE")
    private String mobile;

    /**
     * 报告类型：0为无报告，1为推送上行，2为推送报告，3为报告上行都取
     */
    @TableField("REPORTFLAG")
    private Integer reportflag;

    /**
     * 长号码
     */
    @TableField("LONGCODE")
    private String longcode;

    /**
     * 状态： 0 删除，1初始， 2正常，3禁用
     */
    @TableField("STATUS")
    private Integer status;

    /**
     * 报告推送URL地址
     */
    @TableField("REPORTURL")
    private String reporturl;

    /**
     * 上行推送URL地址
     */
    @TableField("MOURL")
    private String mourl;

    /**
     * 1.预付提交计费，2.预付成功计费，3.后付提交计费，4.后付成功计费
     */
    @TableField("REDUCTMODEL")
    private Integer reductmodel;

    /**
     * 最大session连接数
     */
    @TableField("MAXSESSION")
    private Integer maxsession;

    /**
     *  账号类型：0管理员，1web前端，2http接口，3cmpp接口
     */
    @TableField("PROTYPE")
    private Integer protype;

    /**
     *  锁定
     */
    @TableField("LOCKCOUNT")
    private Integer lockcount;

    /**
     * 备注
     */
    @TableField("REMARK")
    private String remark;

    /**
     * 签名
     */
    @TableField("SIGN")
    private String sign;

    /**
     * 签名leixin
     */
    @TableField("SIGNTYPE")
    private String signtype;

    /**
     * 部门
     */
    @TableField("DEPTID")
    private String deptid;

    /**
     * 拓展号
     */
    @TableField("EXTCODE")
    private String extcode;

    /**
     * 最大发送速度 0 不限速
     */
    @TableField("MAXSEND")
    private Integer maxsend;

    /**
     * 最后一次修改时间
     */
    @TableField("LASTUPDATETIME")
    private LocalDateTime lastupdatetime;

    /**
     * 最近三次的密码修改记录
     */
    @TableField("OLDPASSWORD")
    private String oldpassword;

    /**
     * 通道组id
     */
    @TableField("CPID")
    private String cpid;

    /**
     * ?????
     */
    @TableField("EMAIL")
    private String email;

    /**
     * 计费部门
     */
    @TableField("FEEDEPTID")
    private String feedeptid;

    
    @TableField(exist = false)
    private YtRole role;
}
