package com.ps.tp.dao;

import java.util.HashMap;
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
	
	@Override //게시물목록 + 페이징 + 검색 매서드의 배개변수로 searchType, keyword를 받을수 있게 해주었고
	public List<PageVO> alistPageSearch(int displayPost, int postNum, String searchType, String keyword)throws Exception {
	
	HashMap<String, Object> data = new HashMap<String, Object>();
	data.put("displayPost", displayPost);
	data.put("postNum", postNum);
	
	data.put("searchType", searchType);//해시맵에도 추가를 하였습니다
	data.put("keyword", keyword);
	
	return sql.selectList(namespace +".alistPageSearch", data);
	}


	@Override//게시물 총갯수 + 검색 적용
	public int asearchCount(String searchType, String keyword) throws Exception {

		HashMap data = new HashMap();
		
		data.put("searchType", searchType);//해시맵에도 추가를 하였습니다
		data.put("keyword", keyword);
				
		return sql.selectOne(namespace + ".asearchCount", data);
	}
	
	
	//bboard
		@Override
		public List<PageVO> blist() throws Exception {
			
			return sql.selectList(namespace + ".blist");
		}


}
