package com.store.service;


import javax.servlet.http.HttpSession;

import com.store.dto.UserDto;

public interface UserServiceImpl {
	public UserDto sGetUserInfo(String user_email);
	 
	public int sUserSignUp(String user_email, String user_password, String check2) throws Exception ;
	// 20200804 UserEmail = UserLogin
	public int sUserLogin(String user_email, String password) throws Exception;
	
	public void sUserUpdate(String name, String birth, String phone, String gender, String email) throws Exception;
	
	public void sLogout(HttpSession session);
	
	public void sUpdateMainAddress(String user_email, String main_address1, String main_address2, String main_address3, String main_address4) throws Exception;

	public void sUpdateOderUserInfo(String user_email, String user_name, String main_address1, String main_address2, String main_address3, String main_address4, String user_phone) throws Exception;
   
	public int sDeleteInfoUser(String email) throws Exception;
	
	public int sUpdatePassword(String user_password, String user_email) throws Exception;
	
	public int sUserEmail(String user_email) throws Exception; 
	
    public int sUserLoginCheck(String user_email, String user_password) throws Exception;
}
