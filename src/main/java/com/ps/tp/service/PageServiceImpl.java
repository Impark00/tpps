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
	
	@Override
	public List<PageVO> list() throws Exception {
		
		return page.list();
	}

}
