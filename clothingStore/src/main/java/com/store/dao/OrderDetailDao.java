package com.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.dto.OrderDetailDto;

@Mapper
public interface OrderDetailDao {

	public List<OrderDetailDto> orderDetailListDao(String order_id);
	public int orderDetailCountDao(String order_id);

}
