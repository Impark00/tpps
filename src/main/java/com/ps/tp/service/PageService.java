package com.ps.tp.service;

import java.util.List;

import com.ps.tp.vo.PageVO;


public interface PageService {

	//aboard
	public List<PageVO> alist() throws Exception;

	public void awrite(PageVO vo) throws Exception;

	public PageVO aview(int ano) throws Exception;
	
	public void amodify(PageVO vo) throws Exception;
	
	public void adelete(int ano) throws Exception;
	
	//bboard
	public List<PageVO> blist() throws Exception;


}
