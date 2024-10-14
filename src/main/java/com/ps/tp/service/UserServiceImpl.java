package com.ps.tp.service;

import javax.inject.Inject;

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
	public void signup(UserVO vo) throws Exception {
		
		String inputpass=vo.getUserPassword();
		String pass=encoder.encode(inputpass);
		vo.setUserPassword(pass);
		
		String inputpassRe=vo.getUserPasswordRe();
		String passRe=encoder.encode(inputpassRe);
		vo.setUserPasswordRe(passRe);
		dao.signup(vo);
	}

}
