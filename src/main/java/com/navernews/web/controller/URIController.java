package com.navernews.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class URIController {
	
	@GetMapping("/views/**")
	public void goView() {
	}
	
	@GetMapping("/")
	public String hello() {
		return "views/index";
	}
}