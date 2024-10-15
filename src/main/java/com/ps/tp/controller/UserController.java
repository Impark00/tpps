package com.ps.tp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ps.tp.service.UserService;
import com.ps.tp.vo.UserVO;

@Controller
public class UserController {
	
	@Inject
	private UserService service;
	
	
	@GetMapping(value="/signup")
	public String getSignup() throws Exception{
		return "userinfo/signup";
	}
	
	@PostMapping(value="/signup")
	public String postSignup(UserVO vo) throws Exception{
		service.signup(vo);
		return "redirect:/signin";
	}
	
	@GetMapping(value="/signin")
	public String getSignin() throws Exception{
		return "userinfo/signin";
	}
	
	@PostMapping(value="/signin")
	public String postSignin(UserVO vo,HttpServletRequest req,RedirectAttributes rttr) throws Exception{
		HttpSession session=req.getSession();
		
		if(service.signin(vo)==1) {
			session.setAttribute("userinfo", vo);
		}else {
			session.setAttribute("userinfo",null);
			rttr.addFlashAttribute("msg",false);
			return "/redirect:/signin";
		}
		return "redirect:/";
	}
	
	@GetMapping(value="/logout")
	public String getLogout(HttpSession session) throws Exception{
		service.logout(session);
		return "redirect:/";
	}
	
}
