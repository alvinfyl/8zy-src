package com.zy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/** 这个类用于对/pages进行转义 **/
@Controller
@RequestMapping("pages")
public class PageController {
	@RequestMapping(value = "toPage/{baseAddress}/{address}", method = RequestMethod.GET)
	public String toIndex(@PathVariable(value = "baseAddress") String baseAddress,
			@PathVariable(value = "address") String address) {

		return "/pages/" + baseAddress + "/" + address;
	}
}
