package com.ps.tp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.ps.tp.vo.UserVO;
@Component("com.ps.tp.interceptor")
public class AdminInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest req,HttpServletResponse res,Object obj) throws Exception{
		HttpSession session=req.getSession();
		UserVO vo=(UserVO) session.getAttribute("userinfo");
		if(vo==null) {
			res.sendRedirect("/signin");
			return false;
		}
		if(vo.getVerify()!=1) {
			res.sendRedirect("/");
			return false;
		}
		return true;
	}
}
