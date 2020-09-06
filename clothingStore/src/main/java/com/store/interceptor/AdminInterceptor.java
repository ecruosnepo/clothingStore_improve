package com.store.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		HttpSession session = req.getSession();
		String loginDto = (String)session.getAttribute("manager");
		System.out.println(loginDto);
		
		if(ObjectUtils.isEmpty(loginDto) || !loginDto.equals("manager@1")) {
			res.sendRedirect("/login");
			return false;
		}else {
			session.setMaxInactiveInterval(60*30);
			return true;
		}
	}
}
