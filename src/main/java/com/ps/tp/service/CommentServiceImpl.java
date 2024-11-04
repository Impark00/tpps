package com.ps.tp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ps.tp.dao.CommentDAO;
import com.ps.tp.vo.CommentVO;


@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDAO dao;
	
	@Override
	public List<CommentVO> alist(int ano) throws Exception {
		return dao.alist(ano);
	}

	@Override
	public void awrite(CommentVO vo) throws Exception {
		dao.awrite(vo);
	}

	@Override
	public void amodify(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.amodify(vo);
	}

	@Override
	public void adelete(CommentVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.adelete(vo);
	}

	@Override
	public CommentVO areplySelect(CommentVO vo) throws Exception {
		
		return dao.areplySelect(vo);
	}

}
