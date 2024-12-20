package com.ps.tp.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ps.tp.vo.PageVO;
import com.ps.tp.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	SqlSessionTemplate sql;
	
	private static String namespace="com.ps.tp.mappers.UserMapper";
	
	@Override
	public int idCheck(UserVO userId) throws Exception {
		return sql.selectOne(namespace+".idCheck",userId);
	}

	@Override
	public void signup(UserVO vo) throws Exception {
		sql.insert(namespace+".signup",vo);
	}

	@Override
	public UserVO signin(UserVO vo) throws Exception {
		return sql.selectOne(namespace+".signin", vo);
	}

	@Override
	public UserVO viewUserInfo(UserVO vo) throws Exception {
		return sql.selectOne(namespace+".viewUserInfo",vo);
	}

	@Override
	public void modifyUserInfo(UserVO vo) throws Exception {
		sql.update(namespace+".modifyUserInfo",vo);
	}

	@Override
	public List<PageVO> getUserPage(String userId) {
		
		return sql.selectList(namespace + ".getUserPage", userId);
	}
	
}
