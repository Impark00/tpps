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
	public List<PageVO> alist() throws Exception {
		
		return page.alist();
	}
	
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


	
	//bboard
	@Override
	public List<PageVO> blist() throws Exception {
		
		return page.blist();
	}




}
