package com.ps.tp.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps.tp.service.CommentService;
import com.ps.tp.vo.CommentVO;


@Controller
public class CommentController {

	@Inject
	private CommentService commentservice;
	
	//댓글 조회
	
	
	//댓글 작성
	@PostMapping(value="/acom/write")
	public String postaWrite(CommentVO vo) throws Exception{
		commentservice.awrite(vo);
		return "redirect:/aboard/view?ano=" + vo.getAno();
	}
	
	//댓글 단일 조회 (수정 페이지)
	@GetMapping(value="/acom/modify")
	public void getaModify(@RequestParam("ano") int ano, @RequestParam("arno") int arno, Model model) throws Exception {
		CommentVO vo = new CommentVO();
		vo.setAno(ano);
		vo.setArno(arno);
		CommentVO comment = commentservice.areplySelect(vo);
		model.addAttribute("comment", comment);
		
	}

	@PostMapping(value="/acom/modify")
	public String postaModify(CommentVO vo) throws Exception {
		commentservice.amodify(vo);
		return "redirect:/aboard/view?ano=" + vo.getAno();
	}
	
}
