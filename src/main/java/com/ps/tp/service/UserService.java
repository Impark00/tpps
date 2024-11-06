package com.ps.tp.service;

import java.util.List;

import com.ps.tp.vo.PageVO;
import com.ps.tp.vo.UserVO;

public interface UserService {

	int idCheck(UserVO userId) throws Exception;
	
	void signup(UserVO vo) throws Exception;
	
	UserVO signin(UserVO vo) throws Exception;
	
	UserVO viewUserInfo(UserVO vo) throws Exception;
	
	void modifyUserInfo(UserVO vo) throws Exception;

	List<PageVO> getUserPage(String userId);
}
