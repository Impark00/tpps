package com.ps.tp.dao;

import java.util.List;

import com.ps.tp.vo.PageVO;

public interface PageDAO {

	public List<PageVO> list() throws Exception;
}
