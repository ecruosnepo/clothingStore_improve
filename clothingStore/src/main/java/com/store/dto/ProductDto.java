package com.store.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDto {
	private int pd_id;                  
	private String pd_name;
	private int pd_price;
	private String pd_color;
	private String pd_desc;	
	private String cat_id;
	private Date pd_regDate;
	private int discount;
	private String pd_img;
	private List<MultipartFile> file;
	//cat join
	private String cat_name;
	private int cat_id_ref;
	//관리자 페이지 리스트 추출시 임시 사용
	private String pd_size;
	private int pd_stock;
}
