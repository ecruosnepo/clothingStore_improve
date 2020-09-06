package com.store.dto;

import lombok.Data;

@Data
public class MyPageDto {
	private String order_id;
	private String pd_img;
	private String pd_name;
	private int pd_price;
	private int pd_id; 
	private String pd_color;
	private int pd_quantity;
	private String pd_size;
	private int price_sum;
}
