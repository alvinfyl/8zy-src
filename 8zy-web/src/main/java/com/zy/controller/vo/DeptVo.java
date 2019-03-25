package com.zy.controller.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=true)
public class DeptVo extends BaseVo {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6925201776781424360L;

    private String pid;

    /**
     * 机构编号
     */
    private String departno;

    /**
     * 机构编号名称
     */
    private String deptname;

    /**
     * 注释
     */
    private String remark;

}
