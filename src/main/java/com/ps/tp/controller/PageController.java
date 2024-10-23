package com.ps.tp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ps.tp.service.CommentService;
import com.ps.tp.service.PageService;
import com.ps.tp.vo.CommentVO;
import com.ps.tp.vo.PageVO;
import com.spring.pagenation.domain.BoardVO;
import com.spring.pagenation.domain.Page;


@Controller
public class PageController {
	
	@Inject
	PageService pageservice;
	@Inject
	CommentService commentservice;
	
	@GetMapping(value="/")
	public String home() throws Exception{
		return "home";
	}
//aboard
	@GetMapping(value="/aboard/list")
		public void getalist(Model model) throws Exception{
		
		List<PageVO> list = null;
		list = pageservice.alist();
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("/aboard/write")
	public void getaWrite() throws Exception{		
	}
	
	@PostMapping("/aboard/write")
	public String postaWrite(PageVO vo) throws Exception{
		pageservice.awrite(vo);
		return "redirect:/aboard/list";
	}
	
	@GetMapping("/aboard/view")
	public void getaView(@RequestParam("ano") int ano, Model model) throws Exception{
		PageVO vo = pageservice.aview(ano);
		model.addAttribute("view", vo);
		
		List<CommentVO> comment = null;
		comment = commentservice.alist(ano);
		model.addAttribute("comment", comment);

	}
		
	

	@GetMapping("/aboard/modify")
	public void getaModify(@RequestParam("ano") int ano, Model model) throws Exception{
		PageVO vo = pageservice.aview(ano);
		model.addAttribute("view", vo);
	}
	
	@PostMapping("/aboard/modify")
	public String postaModify(PageVO vo)throws Exception{
		pageservice.amodify(vo);
		return "redirect:/aboard/view?ano=" + vo.getAno();
	}
	
	@GetMapping("/aboard/delete")
	public String getaDelete(@RequestParam("ano") int ano)throws Exception{
		pageservice.adelete(ano);
		return "redirect:/aboard/list";
	}
	
	@GetMapping("/aboard/listtest")
	public void getListPageSearch(Model model, @RequestParam(value="num", defaultValue="1") int num, 
			@RequestParam(value="searchType", required = false, defaultValue="title") String searchType, 
			@RequestParam(value="keyword", required = false, defaultValue="") String keyword) throws Exception{
	
	Page page = new Page();
	
	page.setNum(num);
	page.setCount(pageservice.searchCount(searchType, keyword));
	
	//검색 타입과 검색어
	page.setSearchType(searchType);
	page.setKeyword(keyword);
	
	List<BoardVO> list = null;
	list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
	
	model.addAttribute("list", list);
	model.addAttribute("page", page);
	model.addAttribute("select", num);
	
	//
	model.addAttribute("searchType", searchType);
	model.addAttribute("keyword", keyword);
	}



	
	
	
	
	
	

	//bboard
		@GetMapping(value="/bboard/list")
			public void getblist(Model model) throws Exception{
			
			List<PageVO> list = null;
			list = pageservice.blist();
			
			model.addAttribute("list", list);
		}





}
