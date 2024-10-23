package com.ps.tp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ps.tp.dao.PageDAO;
import com.ps.tp.vo.PageVO;

@Service
public class PageServiceImpl implements PageService {

	@Inject
	private PageDAO page;
	
	//aboard

	@Override
	public void awrite(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		page.awrite(vo);
	}

	@Override
	public PageVO aview(int ano) throws Exception {
		return page.aview(ano);
	}
	
	@Override
	public void amodify(PageVO vo) throws Exception {
		page.amodify(vo);
		
	}

	@Override
	public void adelete(int ano) throws Exception {
		page.adelete(ano); 
		
	}

	
	@Override //목록 + 페이징 + 검색
	public List<PageVO> alistPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		
		return page.alistPageSearch(displayPost, postNum, searchType, keyword);
	}


	@Override //게시물 총 개수 + 검색 적용
	public int asearchCount(String searchType, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return page.asearchCount(searchType, keyword);
	}

	

	
	//bboard
	@Override
	public List<PageVO> blist() throws Exception {
		
		return page.blist();
	}




}
