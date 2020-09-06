package com.store.dto;

import java.sql.Date;
import lombok.Data;
@Data
public class OrderDto {
	private String order_id;	
	private String user_email;
	//받는 사람 이름
	private String dv_name;
	private String dv_address1;
	private String dv_address2;
	private String dv_address3;
	private String dv_address4;
	private String dv_phone;
	private String dv_option;//배송료
	private String dv_message;
	private int total_price;//배송료 포함 총금액
	private String payment_method;
	private Date payDate;
	private String order_state;
	
	//이용자 border-order확인용
	private String pd_name;
}
