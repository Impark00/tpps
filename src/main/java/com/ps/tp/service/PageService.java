package com.ps.tp.service;

import java.util.List;

import com.ps.tp.vo.PageVO;


public interface PageService {

	//aboard

	public void awrite(PageVO vo) throws Exception;

	public PageVO aview(int ano) throws Exception;
	
	public void amodify(PageVO vo) throws Exception;
	
	public void adelete(int ano) throws Exception;
	
	public List<PageVO> alistPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	
	public int asearchCount(String searchType, String keyword) throws Exception;
		
	//bboard
	public List<PageVO> blist() throws Exception;


}
