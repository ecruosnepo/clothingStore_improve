package com.store.dto;

import lombok.Data;

@Data
public class CategoryDto {
	private int cat_id;
	private String cat_name;
	private int cat_id_ref;
	private String cat_desc;
	private String cat_gender;
}
