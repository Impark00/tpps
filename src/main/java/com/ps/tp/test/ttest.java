package com.ps.tp.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ttest {

	@GetMapping(value="/")
	public String home () {
		return "/home";
	}
}
