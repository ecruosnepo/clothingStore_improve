package com.store.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.store.dto.StockDto;

public interface StockService {
	public List<StockDto> productStock(int pId);
	public int addStock(StockDto sDto);
	public int orderUpdateStock(int pd_id, String pd_size, int pd_quantity, String op);
	public int updateStock(StockDto sDto);
	public Integer checkStock(int pd_id, String pd_size);
}
