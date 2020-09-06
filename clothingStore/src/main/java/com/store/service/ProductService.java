package com.store.service;

import java.util.List;

import com.store.dto.ProductDto;

public interface ProductService {
	//상품 목록
	public List<ProductDto> listProduct(Integer cat_id_ref, Integer catId, List<String> size, String sortby);
	public ProductDto viewProduct(int id);
	public ProductDto adminViewProduct(int pd_id); 
	public List<ProductDto> getColorList(String name);
	public int getProductId(String pd_name,String pd_color);
	public int regProduct(ProductDto pDto);
	public int deleteProduct(String id);
	public int updateProduct(ProductDto pDto);
	public List<ProductDto> listProductSize(int catId, List<String> size, String sortby);
	public List<ProductDto> listSearchProduct(String keyword, List<String> size, String sortby);	
}
