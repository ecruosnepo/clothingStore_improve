package com.store.dto;



import lombok.Data;


@Data
public class OrderDetailDto {
	private String order_id;
	private int pd_id;
	private String pd_size;
	private int pd_quantity;
	private int price_sum;
	
	//관리자 페이지 주문정보 조회시 사용
	private String pd_name;
	private int pd_price;
	private String pd_color;
}
