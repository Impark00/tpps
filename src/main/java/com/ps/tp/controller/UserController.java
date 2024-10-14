package com.ps.tp.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ps.tp.service.UserService;
import com.ps.tp.vo.UserVO;

@Controller
public class UserController {
	
	@Inject
	private UserService service;
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@GetMapping(value="/signup")
	public String getSignup() throws Exception{
		return "userinfo/signup";
	}
	
	@PostMapping(value="/signup")
	public String postSignup(UserVO vo) throws Exception{
		
	}
	
}
