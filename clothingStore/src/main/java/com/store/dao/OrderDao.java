package com.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.MyPageDto;
import com.store.dto.OrderDto;

@Mapper
public interface OrderDao {
	public int addOrderDao(OrderDto oDto);
	
	public int addOrderDetailDao(@Param("order_id")String order_id,@Param("user_email")String user_email, @Param("price_sum")int price_sum);	
	
	//회원별 주문 내역 출력
	public List<OrderDto> userOrderListDao(@Param("user_email") String user_email);
	
	public int addOrder(
			@Param("user_email") String user_email,
			@Param("dv_name") String dv_name,
			@Param("dv_address1") String dv_address1,
			@Param("dv_address2") String dv_address2,
			@Param("dv_address3") String dv_address3,
			@Param("dv_address4") String dv_address4,
			@Param("dv_option") String dv_option,
			@Param("dv_message") String dv_message,
			@Param("total") int total,
			@Param("payment_method") String payment_method
			);
	public int updateOrder(
			@Param("user_email") String user_email,
			@Param("dv_name") String dv_name,
			@Param("dv_address1") String dv_address1,
			@Param("dv_address2") String dv_address2,
			@Param("dv_address3") String dv_address3,
			@Param("dv_address4") String dv_address4,
			@Param("dv_option") String dv_option,
			@Param("dv_message") String dv_message,
			@Param("total") int total,
			@Param("payment_method") String payment_method
			);
	//관리자 페이지
	//전체 리스트 출력
	public List<OrderDto> adminOrderListDao();
	//전체 리스트 갯수
	public int adminOrderCountDao();
	//order_id별로 보기
	public OrderDto adOrderViewDao(String order_id);
	
	public List<OrderDto> selectOrderList(@Param("user_email")String user_email);
	
	public List<MyPageDto> selectPdMyPage(@Param("user_email")String user_email);
	
	public OrderDto selectOrderDto();

	//order수정
	public int adOrderUpdateDao(OrderDto oDto);
}