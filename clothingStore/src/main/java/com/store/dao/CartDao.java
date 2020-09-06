package com.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.CartDto;
import com.store.dto.CartListDto;

@Mapper
public interface CartDao {
	public List<CartListDto> cartListDao(String email);
	public int addCartDao(CartDto cDto);
	public int deleteCartDao(int cart_id);
	public int updateSizeCartDao(String pd_size);
	public int updateQuantityCartDao(int cart_id, int pd_quantity);
	public CartDto cartDuplicateCheckDao(@Param("user_email")String email, @Param("pd_id")int pd_id, @Param("pd_size")String pd_size);
	public List<CartDto> cartInfoDao(@Param("user_email")String email);
	public int deleteOrderCartDao(@Param("user_email")String email);
	//관리자페이지
	//회원삭제시- Cart 삭제
	public void deleteUserCartDao(String user_email);
	public int updateDuplicateCartDao(int cart_id);
}
