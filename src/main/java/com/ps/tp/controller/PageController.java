package com.ps.tp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ps.tp.service.CommentService;
import com.ps.tp.service.PageService;
import com.ps.tp.vo.CommentVO;
import com.ps.tp.vo.Page;
import com.ps.tp.vo.PageVO;


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
	
	@GetMapping("/aboard/write")
	public void getaWrite() throws Exception{		
	}
	
	@PostMapping("/aboard/write")
	public String postaWrite(PageVO vo) throws Exception{
		pageservice.awrite(vo);
		return "redirect:/aboard/list";
	}
	
	@GetMapping("/aboard/view")
	public void getaView(@RequestParam("ano") int ano, Model model, HttpServletRequest req) throws Exception {
	    HttpSession session = req.getSession();

	    List<Integer> viewedPosts = (List<Integer>) session.getAttribute("viewedPosts");
	    
	    if (viewedPosts == null) {
	        viewedPosts = new ArrayList<>();
	    }
	    
	    if (!viewedPosts.contains(ano)) {
	        pageservice.aviewcount(ano); // 조회수 증가
	        viewedPosts.add(ano); // 조회한 게시글 ID 추가
	        session.setAttribute("viewedPosts", viewedPosts); // 세션에 저장
	    }
	    
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
	
	@GetMapping("/aboard/list")
	public void getListPageSearch(Model model, @RequestParam(value="num", defaultValue="1") int num, 
			@RequestParam(value="searchType", required = false, defaultValue="title") String searchType, 
			@RequestParam(value="keyword", required = false, defaultValue="") String keyword) throws Exception{
	
	Page page = new Page();
	
	page.setNum(num);
	page.setCount(pageservice.asearchCount(searchType, keyword));
	
	//검색 타입과 검색어	
	page.setSearchType(searchType);
	page.setKeyword(keyword);
	
	List<PageVO> list = null;
	list = pageservice.alistPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
	
	model.addAttribute("list", list);
	model.addAttribute("page", page);
	model.addAttribute("select", num);
	
	//
	model.addAttribute("searchType", searchType);
	model.addAttribute("keyword", keyword);
	}

	@PostMapping("/aboard/achu")
	public String postachu(@RequestParam("ano") int ano, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	    HttpSession session = req.getSession();

	    // 세션에서 추천한 게시글 리스트 가져오기
	    List<Integer> likedPosts = (List<Integer>) session.getAttribute("likedPosts");

	    // 처음 추천하는 경우 (리스트가 null)
	    if (likedPosts == null) {
	        likedPosts = new ArrayList<>();
	    }

	    // 이미 추천한 게시글인지 확인
	    if (!likedPosts.contains(ano)) {
	        pageservice.achu(ano); // 추천수 증가
	        likedPosts.add(ano); // 추천한 게시글 ID 추가
	        session.setAttribute("likedPosts", likedPosts); // 세션에 저장
	    }else {
	        rttr.addFlashAttribute("message", "이미 추천한 게시글입니다."); // 메시지 추가
	    }

	    return "redirect:/aboard/view?ano=" + ano;
	}
	
	
	
	
	

	//bboard
		@GetMapping(value="/bboard/list")
			public void getblist(Model model) throws Exception{
			
			List<PageVO> list = null;
			list = pageservice.blist();
			
			model.addAttribute("list", list);
		}





}
