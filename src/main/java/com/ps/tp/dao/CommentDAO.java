package com.ps.tp.dao;

import java.util.List;

import com.ps.tp.vo.CommentVO;

public interface CommentDAO {

	// aboard
	public List<CommentVO> alist(int ano) throws Exception;
	
	public void awrite(CommentVO vo) throws Exception;
	
	public void amodify(CommentVO vo) throws Exception;
	
	public void adelete(CommentVO vo) throws Exception;

	public CommentVO areplySelect(CommentVO vo) throws Exception;
	
}
