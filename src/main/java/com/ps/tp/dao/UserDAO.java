package com.ps.tp.dao;

import com.ps.tp.vo.UserVO;

public interface UserDAO {
	
	int idCheck(UserVO userId) throws Exception;
	
	void signup(UserVO vo) throws Exception;
	
	UserVO signin(UserVO vo) throws Exception;
	
	UserVO viewUserInfo(String vo) throws Exception;
}
