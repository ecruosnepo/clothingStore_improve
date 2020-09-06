package com.store.service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.dao.UserDao;
import com.store.dto.UserDto;

@Service
public class UserService implements UserServiceImpl {
    
	private int result;
	
	@Autowired
	private UserDao dao;
	
	@Override
	public UserDto sGetUserInfo(String user_email) {
		return dao.getUserInfo(user_email);
	}

	// 화원가입
	@Override
	public int sUserSignUp(String email, String password, String check2) throws Exception {
    	 return dao.UserSignUp(email, password);	
	}                 	

	// 로그인
	@Override   // 20200804 UserEmail = UserLogin
	public int sUserLogin(String email, String password) throws Exception {
		 result = dao.userLoginCheck(email, password);
		
		// 이메일 폼 체크
		if(null == email || "".equals(email)) { 
			return 2; 
		}
		
		// 패스워드 폼 체크
		if(null == password || "".equals(password)) {
			return 3;
		}		
		
		// email 체크
		int checkEmail = dao.UserEmail(email);
		if(0 == checkEmail) {
			// : DB에 같은 이메일 값이 존재하지 않는다.
			return 2;
		}
			
		// 패스워드 체크
		int checkPassword = dao.UserPassword(password);
		if(0 == checkPassword) {
			// : DB에 같은 패스워드 값이 존재하지 않는다.
			return 3;
		}
		UserDto dto = dao.getUserInfo(email);
		if(( dto.getUser_email().equals("manager@1") || "manager@1".equals(dto.getUser_email()) ) ) {
			return 4;
		}
		 
		// login 체크
		if ( 0 == result ) {
			return 5;
		} 
		else {
			return 1;
		}
		 
	}

	
	// 내 상세정보 편집
	@Override
	public void sUserUpdate( String name, String birth, String phone, String gender, String email) throws Exception {
		dao.UserUpdate(name, birth, phone, gender, email);		
	}

	// 로그아웃
	@Override
	public void sLogout(HttpSession session) {
		 session.invalidate();	
	}
	
	@Override
	public void sUpdateMainAddress(String user_email, 
								   String main_address1, 
								   String main_address2, 
								   String main_address3,
								   String main_address4) throws Exception {
		dao.updateMainAddress(user_email, main_address1, main_address2, main_address3, main_address4);		
	}
	
	@Override
	public void sUpdateOderUserInfo(String user_email,String user_name, String main_address1, String main_address2, String main_address3,
			String main_address4, String user_phone) throws Exception {
		dao.updateOrderUserInfo(user_email, user_name, main_address1, main_address2, main_address3, main_address4, user_phone);		
	}

	// 계정 삭제
	@Override
	public int sDeleteInfoUser(String email) throws Exception {
		int result = dao.deleteInfoUser(email);
		return result;
	}

	@Override
	public int sUpdatePassword(String user_password, String user_email) throws Exception {
		return dao.updatePassword(user_password, user_email);
	}

	@Override
	public int sUserEmail(String user_email) throws Exception {
		return dao.UserEmail(user_email);
	}

	@Override
	public int sUserLoginCheck(String user_email, String user_password) throws Exception {
		return dao.userLoginCheck(user_email, user_password);
	}


}