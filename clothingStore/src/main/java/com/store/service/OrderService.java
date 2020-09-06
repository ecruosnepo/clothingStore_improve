package com.store.service;

import java.util.List;

import com.store.dto.MyPageDto;
import com.store.dto.OrderDto;


public interface OrderService {
	public int addOrder(OrderDto oDto);
	public int addOrderDetail(String order_id, String user_email, int price_sum);	

	public List<OrderDto> userOrderListDao(String user_email);
	
	public List<OrderDto> selectOrderList(String user_email) throws Exception;
	
	public List<MyPageDto> selectPdMyPage(String user_email) throws Exception;
	
	public OrderDto selectOrderDto() throws Exception;

	//관리자 페이지
	//전체 리스트 출력
	public List<OrderDto> adminOrderListDao();
	//전체 리스트 갯수
	public int adminOrderCountDao();
	//order_id
	public OrderDto adOrderViewDao(String order_id);
	//order수정
	public int adOrderUpdate(OrderDto oDto);
}
