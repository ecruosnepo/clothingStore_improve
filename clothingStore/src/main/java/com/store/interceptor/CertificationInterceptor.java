package com.store.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import com.store.dto.UserDto;

public class CertificationInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		HttpSession session = req.getSession();
		String loginDto = (String)session.getAttribute("email");
		System.out.println("로그인 확인 인터셉터");
		
		if(ObjectUtils.isEmpty(loginDto)) {
			res.sendRedirect("/login");
			return false;
		}else {
			session.setMaxInactiveInterval(60*30);
			return true;
		}
	}

}
