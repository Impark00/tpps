package com.ps.tp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ps.tp.vo.PageVO;

@Repository
public class PageDAOImpl implements PageDAO {
	
	@Inject
	private SqlSession sql;
	//매퍼
	private static String namespace="com.ps.tp.mappers.PageMapper";
	
	
	//aboard
	@Override
	public List<PageVO> alist() throws Exception {
		
		return sql.selectList(namespace + ".alist");
	}

	@Override
	public void awrite(PageVO vo) throws Exception {
		sql.insert(namespace + ".awrite", vo);
	}

	@Override
	public PageVO aview(int ano) throws Exception {
		return sql.selectOne(namespace + ".aview", ano);
	}

	@Override
	public void amodify(PageVO vo) throws Exception {
		sql.update(namespace + ".amodify", vo);	
	}

	@Override
	public void adelete(int ano) throws Exception {
		sql.delete(namespace + ".adelete", ano);
		
	}
	
	
	
	//bboard
		@Override
		public List<PageVO> blist() throws Exception {
			
			return sql.selectList(namespace + ".blist");
		}


}
