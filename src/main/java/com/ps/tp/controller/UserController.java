package com.ps.tp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ps.tp.service.UserService;
import com.ps.tp.vo.PageVO;
import com.ps.tp.vo.UserVO;

@Controller
public class UserController {
	
	@Inject
	private UserService service;
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Bean//객체 생성을 하지 않으면 오류가 생김
	BCryptPasswordEncoder passEncoder() {
		return new BCryptPasswordEncoder();
	}
	
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
		String inputpass=vo.getUserPassword();
		String pass=encoder.encode(inputpass);
		vo.setUserPassword(pass);
		
		String inputpassRe=vo.getUserPasswordRe();			
		String passRe=encoder.encode(inputpassRe);
		vo.setUserPasswordRe(passRe);
		
		service.signup(vo);
		return "redirect:/signin";
	}
	
	@GetMapping(value="/signin")
	public String getSignin() throws Exception{
		return "userinfo/signin";
	}
	
	/*@PostMapping(value="/signin")
	public String postSignin(UserVO vo,HttpServletRequest req,RedirectAttributes rttr) throws Exception{
		UserVO login=service.signin(vo);
		if(login!=null) {
			boolean passMatch=encoder.matches(vo.getUserPassword(), login.getUserPassword());
			if(passMatch) {
				UserVO userinfo=service.viewUserInfo(vo);
				HttpSession session=req.getSession();
				session.setAttribute("userinfo",userinfo);
				return "redirect:/";
			}else {
				
				rttr.addFlashAttribute("msg",0);
				return "redirect:/signin";
			}
		}
		
		rttr.addFlashAttribute("msg",-1);
		return "redirect:/signin";
	}*/
	
	@PostMapping(value="/signin")
	public String postSignin(UserVO vo,HttpServletRequest req,RedirectAttributes rttr) throws Exception{
		UserVO login=service.signin(vo);
		if(login!=null) {
			boolean passMatch=encoder.matches(vo.getUserPassword(), login.getUserPassword());
			if(passMatch) {
				UserVO userinfo=service.viewUserInfo(vo);
				if(userinfo.getVerify()==1) {
					HttpSession session=req.getSession();
					session.setAttribute("userinfo",userinfo);
					return "redirect:/";
				}
				HttpSession session=req.getSession();
				session.setAttribute("userinfo",userinfo);
				return "redirect:/";
			}else {
				
				rttr.addFlashAttribute("msg",0);
				return "redirect:/signin";
			}
		}
		
		rttr.addFlashAttribute("msg",-1);
		return "redirect:/signin";
	}
	
	@GetMapping(value="/logout")
	public String getLogout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping(value="/mypage")
	public String getMypage(HttpServletRequest req,Model model) throws Exception{
		HttpSession session=req.getSession();
		UserVO userinfo=(UserVO) session.getAttribute("userinfo");
		 List<PageVO> list = service.getUserPage(userinfo.getUserId());
		 model.addAttribute("list", list);
		 model.addAttribute("userinfo",userinfo);
		return "userinfo/mypage";
	}
	
	@GetMapping(value="/modifyuser")
	public String getModifyuser(HttpServletRequest req,Model model) throws Exception{
		HttpSession session=req.getSession();
		UserVO userinfo=(UserVO)session.getAttribute("userinfo");
		model.addAttribute("userinfo",userinfo);
		return "userinfo/modifyuser";
	}
	
	@PostMapping(value="/modifyuser")
	public String postModifyuser(UserVO vo,HttpServletRequest req) throws Exception{
		HttpSession session=req.getSession();
		service.modifyUserInfo(vo);
		UserVO newuserinfo=service.viewUserInfo(vo);
		session.setAttribute("userinfo",newuserinfo);
		return "redirect:/mypage";
	}
	
	
}