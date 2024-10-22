package com.ps.tp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ps.tp.vo.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {

	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.ps.tp.mappers.CommentMapper";
	
	@Override
	public List<CommentVO> alist(int ano) throws Exception {
		
		return sql.selectList(namespace+".areplyList", ano);
	}

	@Override
	public void awrite(CommentVO vo) throws Exception {
		sql.insert(namespace+".areplyWrite", vo);		
	}

	@Override
	public void amodify(CommentVO vo) throws Exception {
		sql.update(namespace+".areplyModify", vo);
	}

	@Override
	public void adelete(CommentVO vo) throws Exception {
		sql.delete(namespace+".areplyDelete", vo);
		
	}

	@Override
	public CommentVO areplySelect(CommentVO vo) throws Exception {
		return sql.selectOne(namespace + ".areplySelect", vo);
	}

}
