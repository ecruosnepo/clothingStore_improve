package com.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.dao.ProductDao;
import com.store.dto.ProductDto;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductDao dao;
	
	//상품 목록
	@Override
	public List<ProductDto> listProduct(Integer cat_id_ref, Integer catId, List<String> size, String sortby) {
		System.out.println("상품 목록");
		System.out.println(sortby);
		System.out.println(catId);
		return dao.listProductDao(cat_id_ref, catId, size, sortby);
	}

	@Override
	public ProductDto viewProduct(int id) {
		System.out.println("상품 상세");
		return dao.viewProductDao(id);
	}
	
	@Override
	public ProductDto adminViewProduct(int pd_id) {
		System.out.println("관리자 상품 상세");
		return dao.adminViewProductDao(pd_id);
	}
	
	@Override
	public List<ProductDto> getColorList(String pd_name) {
		System.out.println("색상 목록");
		return dao.getColorListDao(pd_name);
	}
	
	//상품 목록
	@Override
	public List<ProductDto> listSearchProduct(String keyword,List<String> size, String sortby) {
		System.out.println("상품 검색 목록");
		System.out.println(sortby);
		System.out.println(keyword);
		return dao.listSearchProductDao(keyword, size, sortby);
	}

	@Override
	public int getProductId(String pd_name, String pd_color) {
		System.out.println("상품 번호");
		return dao.getProductIdDao(pd_name, pd_color);
	}
	
	@Override
	public int regProduct(ProductDto pDto) {
		System.out.println("상품 등록");
		return dao.regProductDao(pDto);
	}

	@Override
	public int deleteProduct(String id) {
		System.out.println("상품 제거");
		return dao.deleteProductDao(id);
	}

	@Override
	public int updateProduct(ProductDto pDto) {
		System.out.println("상품 정보 수정");
		return dao.updateProductDao(pDto);
	}
	
	@Override
	public List<ProductDto> listProductSize(int catId, List<String> size, String sortby) {
		System.out.println("상품 사이즈 목록");
		System.out.println(size);
		System.out.println(sortby);
		return dao.listProductSizeDao(catId, size, sortby);
	}
}
