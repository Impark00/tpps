package com.ps.tp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ps.tp.service.PageService;
import com.ps.tp.vo.PageVO;

@Controller
public class PageController {
	
	@Inject
	PageService pageservice;
	
	@GetMapping(value="/")
	public String home() throws Exception{
		return "home";
	}
	
	/*@GetMapping(value="/aboard/list")
	public String blist() throws Exception{
		return "aboard/list";
	}*/

// aboard
	@GetMapping(value="/aboard/list")
		public void getBoardlist(Model model) throws Exception{
		
		List<PageVO> list = null;
		list = pageservice.list();
		
		model.addAttribute("list", list);
		
	}








}
