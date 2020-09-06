package com.store.service;

import java.util.List;
import java.util.Map;

import com.store.dto.BoardDto;
import com.store.dto.OrderDto;
import com.store.dto.StockDto;

public interface AdminService {

	public Map<String, Object> adminQnaService(int page);
	public BoardDto adminQnaViewService(int id);
	public void adminQnaUpdateService(int id, String answer);
	public void adminQnaDeleteService(int id, String realPath);
	public Map<String, Object> adminQnaSearchService(int page, String search, String boardCat);
	public Map<String, Object> adminMemberListService(int page);
	public int adminMemDelService(List<String> chArr, String realPath)throws Exception;
	public Map<String, Object> adminMemSearch(int page, String search);
	public Map<String, Object> adminPdListService(int page);
	public Map<String, Object> adminPdListService(int page, String search);
	public int adminPdDeleteService(List<String> pd_id,List<String> pd_size, String realPath);
	public Map<String, Object> adOrderListService(int page);
	public Map<String, Object> adOrderViewService(String order_id);
	public Map<String, Object> adPdMiniSearchService(String search);
	public List<StockDto> adSelectStockService(int pd_id);
}
