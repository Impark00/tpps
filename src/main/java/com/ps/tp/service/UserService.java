package com.ps.tp.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ps.tp.vo.PageVO;
import com.ps.tp.vo.UserVO;

public interface UserService {

	int idCheck(UserVO userId) throws Exception;
	
	void signup(UserVO vo) throws Exception;
	
	UserVO signin(UserVO vo) throws Exception;
	
	void logout(HttpSession session) throws Exception;
	
	UserVO viewUserInfo(String vo) throws Exception;
	
	void modifyUserInfo(UserVO vo) throws Exception;

	List<PageVO> getUserPage(String userId);
}
