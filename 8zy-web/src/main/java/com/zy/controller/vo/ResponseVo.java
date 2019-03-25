package com.zy.controller.vo;

import lombok.Data;

@Data
public class ResponseVo {
	
	private boolean success;
	//返回消息
	private String message;
	//data对象
	private Object data;
}
