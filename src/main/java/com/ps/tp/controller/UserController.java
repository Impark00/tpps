package com.ps.tp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@PostMapping(value="/idcheck", produces="application/json")
	public ResponseEntity<Integer> idCheck(@RequestBody UserVO userId) throws Exception{
		
		int checkedId=service.idCheck(userId);
		return ResponseEntity.ok().body(checkedId);
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
			session.setMaxInactiveInterval(1800);
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
	
	@GetMapping(value="/mypage")
	public String getMypage(HttpSession session,Model model) throws Exception{
		UserVO user=(UserVO) session.getAttribute("userinfo");
		String userId=user.getUserId();
		user=service.viewUserInfo(userId);
		model.addAttribute("user",user);
		return "userinfo/mypage";
	}
	
	@GetMapping(value="/modifyuser")
	public String getModifyuser(HttpSession session,Model model) throws Exception{
		UserVO user=(UserVO)session.getAttribute("userinfo");
		String userId=user.getUserId();
		user=service.viewUserInfo(userId);
		model.addAttribute("user",user);
		return "userinfo/modifyuser";
	}
	
	@PostMapping(value="/modifyuser")
	public String postModifyuser(UserVO vo) throws Exception{
		service.modifyUserInfo(vo);
		return "redirect:/mypage";
	}
	
	
}
