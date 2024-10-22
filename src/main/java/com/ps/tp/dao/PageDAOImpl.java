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
	
	
	@Override
	public List<PageVO> list() throws Exception {
		
		return sql.selectList(namespace + ".pagelist");
	}

}
