	package com.ps.tp.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ps.tp.dao.UserDAO;
import com.ps.tp.vo.PageVO;
import com.ps.tp.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO dao;
	
	
	@Override
	public int idCheck(UserVO userId) throws Exception {
		if(dao.idCheck(userId)==1) {
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public void signup(UserVO vo) throws Exception {
		dao.signup(vo);
	}


	@Override
	public UserVO signin(UserVO vo) throws Exception {
		return dao.signin(vo);
	}


	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}

	@Override
	public UserVO viewUserInfo(String vo) throws Exception {
		return dao.viewUserInfo(vo);
	}

	@Override
	public void modifyUserInfo(UserVO vo) throws Exception {
		dao.modifyUserInfo(vo);
	}

	@Override
	public List<PageVO> getUserPage(String userId) {
		return dao.getUserPage(userId);
	}

}
