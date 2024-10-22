package com.ps.tp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@PostMapping(value="/idcheck")
	public ResponseEntity<Integer> idCheck(@RequestBody String userId) throws Exception{
		int checkedId=service.idCheck(userId);
		return ResponseEntity.ok(checkedId);
	}
	
	@PostMapping(value="/signup")
	public String postSignup(UserVO vo,RedirectAttributes rttr) throws Exception{
		
		
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
		
		switch(service.signin(vo)) {
		case 1:
			session.setAttribute("userinfo", vo);
			return "redirect:/";
		case 0:
			session.setAttribute("userinfo", null);
			rttr.addFlashAttribute("msg",0);
			break;
		case -1:
			session.setAttribute("userinfo", null);
			rttr.addFlashAttribute("msg",-1);
			break;
		}
		return "redirect:/signin";
	}
	
	@GetMapping(value="/logout")
	public String getLogout(HttpSession session) throws Exception{
		service.logout(session);
		return "redirect:/";
	}
	
}
