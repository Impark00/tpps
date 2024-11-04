package com.ps.tp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ps.tp.service.CommentService;
import com.ps.tp.service.PageService;
import com.ps.tp.utils.ImageUtils;
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
	public String postaWrite(PageVO vo, @RequestParam("image") MultipartFile image) throws Exception {
	    // 이미지 파일 처리
	    if (image != null && !image.isEmpty()) {
	        String imagePath = ImageUtils.saveImage(image); // 이미지 저장 메서드 호출
	        vo.setImagepath(imagePath); // PageVO에 이미지 경로 설정
	    }	

	    pageservice.awrite(vo); // 게시글 저장
	    return "redirect:/aboard/list"; // 목록 페이지로 리다이렉트
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
	    
	    model.addAttribute("now", new Date());
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
	public String postaModify(PageVO vo, @RequestParam(value = "image", required = false) MultipartFile image) throws Exception {
	    // 이미지 파일 처리
	    if (image != null && !image.isEmpty()) {
	        String imagePath = ImageUtils.saveImage(image); // 이미지 저장 메서드 호출
	        vo.setImagepath(imagePath); // PageVO에 이미지 경로 설정
	    } else {
	        // 이미지가 제공되지 않는 경우, 기존 이미지 경로를 유지
	        PageVO existingVo = pageservice.aview(vo.getAno()); // 기존 게시글 정보 가져오기
	        vo.setImagepath(existingVo.getImagepath()); // 기존 이미지 경로 설정
	    }

	    pageservice.amodify(vo); // 게시글 수정
	    return "redirect:/aboard/view?ano=" + vo.getAno(); // 수정된 게시글 보기로 리다이렉트
	}
	
	@GetMapping("/aboard/delete")
	public String getaDelete(@RequestParam("ano") int ano)throws Exception{
		pageservice.adelete(ano);
		return "redirect:/aboard/list";
	}
	
	@GetMapping("/aboard/list")
	public void getListPageSearch(Model model, @RequestParam(value="num", defaultValue="1") int num, 
			@RequestParam(value="searchType", required = false, defaultValue="title") String searchType, 
			@RequestParam(value="keyword", required = false, defaultValue="") String keyword,
		 @RequestParam(value="atag", required = false, defaultValue="") String atag) throws Exception{
	
	Page page = new Page();
	
	page.setNum(num);
	page.setCount(pageservice.asearchCount(searchType, keyword, atag));
	
	//검색 타입과 검색어	
	page.setSearchType(searchType);
	page.setKeyword(keyword);
	page.setAtag(atag);
	
	List<PageVO> list = null;
	list = pageservice.alistPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword, atag);
	
	model.addAttribute("list", list);
	model.addAttribute("page", page);
	model.addAttribute("select", num);
	 model.addAttribute("atag", atag);
	  List<String> atagList = pageservice.aTagList(); // 태그 목록을 가져오는 서비스 메서드 필요
	    model.addAttribute("atagList", atagList);
	
	
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
