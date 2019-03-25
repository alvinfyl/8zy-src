package com.zy.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 基础父类测试
 * </p>
 */
@Data
@Accessors(chain = true)
public class BaseEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 254416734336283313L;

}