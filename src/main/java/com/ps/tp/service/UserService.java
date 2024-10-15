package com.ps.tp.service;

import javax.servlet.http.HttpSession;

import com.ps.tp.vo.UserVO;

public interface UserService {

	void signup(UserVO vo) throws Exception;
	
	int signin(UserVO vo) throws Exception;
	
	void logout(HttpSession session) throws Exception;
}
