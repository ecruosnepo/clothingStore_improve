package com.store.service;

import java.util.List;

import com.store.dto.CartDto;
import com.store.dto.CartListDto;

public interface CartService {
	public List<CartListDto> cartListView(String email);
	public int addCart(CartDto cDto);
	public int deleteCart(int cart_id);
	public int updateQuantityCart(int cart_id, int pd_quantity); // 입력값 만큼 증가
	public int updateDuplicateCart(int cart_id); // 1개 증가	
	public CartDto cartDuplicateCheck(String email, int pd_id, String pd_size);
	public List<CartDto> cartInfo(String email);
	public int deleteOrderCart(String email);
}
