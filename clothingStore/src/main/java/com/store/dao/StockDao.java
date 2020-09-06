package com.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.StockDto;

@Mapper
public interface StockDao {
	public int addStockDao(StockDto sDto);
	public int orderUpdateStockDao(@Param("pd_id")int pd_id, @Param("pd_size")String pd_size, @Param("pd_quantity")int pd_quantity, @Param("op")String op);
	public int updateStockDao(StockDto sDto);
	public Integer checkStockDao(@Param("pd_id")int pd_id, @Param("pd_size")String pd_size);
	
	//관리자 페이지
	//상품의 재고 갯수
	public int countStockDao(@Param("pd_id")int pd_id);
	//재고 삭제
	public int deleteStockDao(@Param("pd_size")String pd_size, @Param("pd_id")int pd_id);
	public int updateStockDao(@Param("pd_id")int pd_id, @Param("pd_size")String pd_size, @Param("pd_quantity")int pd_quantity);
	public List<StockDto> productStockDao(@Param("pd_id")int pd_id);
}
