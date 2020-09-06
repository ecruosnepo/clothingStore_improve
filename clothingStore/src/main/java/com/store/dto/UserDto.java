package com.store.dto;
import java.sql.Date;



import lombok.Data;
@Data
public class UserDto {
	
	private String user_email;
	private String user_password;
	private String user_name;
	private String user_birth;
	private String user_gender;
	private String user_phone;
	private String main_address1;
	private String main_address2;
	private String main_address3;
	private String main_address4;
	private Date regDate;
}
