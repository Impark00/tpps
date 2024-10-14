package com.ps.tp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {
	@GetMapping(value="/")
	public String home() throws Exception{
		return "home";
	}
}
