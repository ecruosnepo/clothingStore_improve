package com.store.dto;

import java.util.Date;

import lombok.Data;

@Data
public class adminProductDto {
	
	//상품
	private int pd_id;
	private String pd_name;
	private int pd_price;
	private String pd_color;
	private String pd_desc;	
	private String cat_id;
	private Date pd_regDate;
	private int discount;
	private String pd_img;
	
	//재고	
	private String pd_size;
	private int pd_stock;
}
