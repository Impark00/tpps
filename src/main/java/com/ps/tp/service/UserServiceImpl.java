	package com.ps.tp.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ps.tp.dao.UserDAO;
import com.ps.tp.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO dao;
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Bean//객체 생성을 하지 않으면 오류가 생김
	BCryptPasswordEncoder passEncoder() {
		return new BCryptPasswordEncoder();
	}
	
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
		
		String inputpass=vo.getUserPassword();
		String pass=encoder.encode(inputpass);
		vo.setUserPassword(pass);
		
		String inputpassRe=vo.getUserPasswordRe();			
		String passRe=encoder.encode(inputpassRe);
		vo.setUserPasswordRe(passRe);
		dao.signup(vo);
	}


	@Override
	public int signin(UserVO vo) throws Exception {
		UserVO login=dao.signin(vo);
		if(login!=null){
			boolean passMatch=encoder.matches(vo.getUserPassword(), login.getUserPassword());
			if(passMatch) {
				return 1;
			}else {
				return 0;
			}
		}
		return -1;
		
	}


	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
	}

	@Override
	public UserVO viewUserInfo(String vo) throws Exception {
		return dao.viewUserInfo(vo);
	}

}
