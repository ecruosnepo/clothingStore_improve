package com.store.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.dao.StockDao;
import com.store.dto.StockDto;

@Service
public class StockServiceImpl implements StockService {
	@Autowired
	StockDao stockDao;

	@Override
	public List<StockDto> productStock(int pId) {
		System.out.println("재고 정보 가져오기");
		return stockDao.productStockDao(pId);
	}
	
	@Override
	public int addStock(StockDto sDto) {
		System.out.println("재고 입력");
		return stockDao.addStockDao(sDto);
	}

	@Override
	public int orderUpdateStock(@Param("pd_id")int pd_id, @Param("pd_size")String pd_size, @Param("pd_quantity")int pd_quantity, String op) {
		System.out.println("주문 재고 수정");
		System.out.println(pd_quantity);
		System.out.println(op);
		return stockDao.orderUpdateStockDao(pd_id, pd_size, pd_quantity, op);
	}
	
	@Override
	public int updateStock(StockDto sDto) {
		System.out.println("재고 수정");
		return stockDao.updateStockDao(sDto);
	}
	
	@Override
	public Integer checkStock(int pd_id, String pd_size) {
		System.out.println("사이즈 유무 확인");
		return stockDao.checkStockDao(pd_id, pd_size);
	}
	
}
