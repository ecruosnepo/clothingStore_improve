package com.store.dto;

import lombok.Data;

@Data
public class CartListDto {
	// 공통
	private int pd_id;
	
	// 카트 dto
	private int cart_id;
	private String email;	
	private String pd_size;
	private int pd_quantity;
	
	//	상품 dto
	private String pd_name;
	private int pd_price;
	private String pd_color;
	private String pd_img;
	
	// 재고 dto
	private String pd_stock;
}
