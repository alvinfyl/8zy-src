package com.zy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** 这个类用于对/pages进行转义 **/
@Controller
@RequestMapping("")
public class WebController {
	@RequestMapping(value = "web/{baseAddress}", method = RequestMethod.GET)
	public String toIndex(@PathVariable(value = "baseAddress") String baseAddress) {
		return "/web/" + baseAddress ;
	}
}
