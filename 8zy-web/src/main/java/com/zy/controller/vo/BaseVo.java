package com.zy.controller.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class BaseVo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8058923415800662315L;

    /**
     * 自增主键
     */
    private String id;

    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date modifyTime;
}
