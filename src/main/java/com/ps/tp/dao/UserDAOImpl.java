package com.ps.tp.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.ps.tp.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	SqlSessionTemplate sql;
	
	private static String namespace="com.ps.tp.mappers.UserMapper";
	
	@Override
	public void signup(UserVO vo) throws Exception {
		sql.insert(namespace+".signup",vo);
	}

}
