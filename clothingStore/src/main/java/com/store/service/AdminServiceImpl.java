package com.store.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.bean.PagingBean;
import com.store.dao.AddressDao;
import com.store.dao.BoardDao;
import com.store.dao.CartDao;
import com.store.dao.OrderDao;
import com.store.dao.OrderDetailDao;
import com.store.dao.ProductDao;
import com.store.dao.StockDao;
import com.store.dao.UserDao;
import com.store.dto.BoardDto;
import com.store.dto.OrderDetailDto;
import com.store.dto.OrderDto;
import com.store.dto.StockDto;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	BoardDao boardDao;
	@Autowired
	UserDao userDao;
	@Autowired
	AddressDao addressDao;
	@Autowired
	CartDao cartDao;
	@Autowired
	ProductDao productDao;
	@Autowired
	StockDao stockDao;
	@Autowired
	OrderDao orderDao;
	@Autowired
	OrderDetailDao oDetailDao;
	@Autowired
	PagingBean pageBean;

	@Override
	public Map<String, Object> adminQnaService(int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		pageBean = new PagingBean(page, boardDao.boardListAllCountDao(), 10, 3);

		map.put("dto", boardDao.boardListAllDao());
		map.put("page", pageBean);

		return map;
	}

	@Override
	public BoardDto adminQnaViewService(int id) {
		return boardDao.boardViewDao(id);
	}

	@Override
	public void adminQnaUpdateService(int id, String answer) {
		boardDao.boardAnswerUpdate(id, answer);
	}

	@Override
	public void adminQnaDeleteService(int id, String realPath) {
		String fileName = boardDao.bIdFindFileDao(id);
		String filePath = realPath + "/" + fileName;
		File delFile = new File(filePath);
		System.out.println(filePath);
		if (delFile.exists()) {
			System.out.println("파일 있음" + delFile);
			delFile.delete();
		} else
			System.out.println("파일 없음");

		boardDao.boardDeleteListDao(id);
	}

	@Override
	public Map<String, Object> adminQnaSearchService(int page, String search, String boardCat) {
		Map<String, Object> map = new HashMap<String, Object>();
		pageBean = new PagingBean(page, boardDao.boardListAllCountDao("%" + search + "%", "%" + boardCat + "%"), 10, 3);

		List<String> list = new ArrayList<String>();
		list.add("");
		list.add("배송");
		list.add("결제");
		list.add("반품");
		list.add("환불");
		list.add("기타");

		map.put("boardDto", boardDao.boardListAllDao("%" + search + "%", "%" + boardCat + "%"));
		map.put("boardCatList", list);
		map.put("page", pageBean);

		return map;
	}

	@Override
	public Map<String, Object> adminMemberListService(int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		pageBean = new PagingBean(page, userDao.userListCount(), 10, 3);

		map.put("dto", userDao.userAllList());
		map.put("page", pageBean);
		return map;
	}

	@Override
	public int adminMemDelService(List<String> chArr, String realPath) throws Exception {
		List<String> delList = chArr;

		int result = 0;
		for (String email : delList) {

			// 이메일에 해당하는 파일 지우기
			List<String> files = boardDao.bEmailFindFileDao(email);
			for (String file : files) {
				String filePath = realPath + "/" + file;
				File oFile = new File(filePath);
				System.out.println(filePath);

				if (oFile.exists()) {
					System.out.println("파일 있음" + oFile);
					oFile.delete();
				} else
					System.out.println("파일 없음");
			}
			// 기본 정보 삭제
			result += userDao.deleteInfoUser(email);
			// 주소 삭제
			addressDao.deleteInfoAddress(email);
			// 카트 정보 삭제
			cartDao.deleteUserCartDao(email);
			// 게시판 글 삭제
			boardDao.boardDelUserDao(email);
		}

		return result;
	}

	@Override
	public Map<String, Object> adminMemSearch(int page, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		pageBean = new PagingBean(page, userDao.userSearchCount("%" + search + "%"), 10, 3);

		map.put("searchList", userDao.userSearchList("%" + search + "%"));
		map.put("page", pageBean);

		return map;
	}

	@Override
	public Map<String, Object> adminPdListService(int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		pageBean = new PagingBean(page, productDao.listPdCountDao(), 10, 3);
		map.put("pdList", productDao.adminListProductDao());
		map.put("page", pageBean);
		System.out.println(pageBean.getTotalList());
		return map;
	}

	@Override
	public Map<String, Object> adminPdListService(int page, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		pageBean = new PagingBean(page, productDao.listPdCountDao("%" + search + "%"), 10, 3);
		map.put("pdList", productDao.adminListProductDao("%" + search + "%"));
		map.put("page", pageBean);
		System.out.println(pageBean.getTotalList());
		return map;
	}

	@Override
	public int adminPdDeleteService(List<String> pd_id, List<String> pd_size, String realPath) {
		int result = 0;
		int delCount;
		for (int i = 0; i < pd_id.size(); i++) {
			int id = Integer.parseInt(pd_id.get(i));
			delCount = stockDao.countStockDao(id);
			if (delCount == 1) {
				// 선택한 항목에 대한 재고의 칼럼이 1개일 경우
				//이미지 삭제
				String[] pd_img = productDao.adminImageDao(id).split(",");
				System.out.println("pd_img"+pd_img);
				for (String img : pd_img) {
					String filePath=realPath + "/" +img; 
					File image = new File(filePath); 
					System.out.println(filePath);
					if(image.exists()) {
						System.out.println("파일 있음"+image); 
						image.delete(); 
					}else
						System.out.println("파일 없음"); 
				}
				// 상품 삭제
				productDao.adminDeletePdsDao(id);
				// 재고칼럼 삭제
				result += stockDao.deleteStockDao(pd_size.get(i), id);

			} else if (delCount > 1) {
				// 해당항목에 대한 재고의 칼럼이 2개 이상일 경우
				// 해당 재고칼럼만 삭제
				result += stockDao.deleteStockDao(pd_size.get(i), id);
			}
		}
		return result;
	}

	@Override
	public Map<String, Object> adOrderListService(int page) {
		Map<String, Object> map=new HashMap<String, Object>();
		pageBean = new PagingBean(page, orderDao.adminOrderCountDao(), 10, 3);
		map.put("orderList", orderDao.adminOrderListDao());
		map.put("page", pageBean);
		
		return map;
	}

	@Override
	public Map<String, Object> adOrderViewService(String order_id) {
		Map<String, Object> map=new HashMap<String, Object>();
		List<OrderDetailDto> odDto=oDetailDao.orderDetailListDao(order_id);
		Map<Integer, Object> sDto=new HashMap<Integer, Object>();
		System.out.println(odDto);
		
		for (int i = 0; i < odDto.size(); i++) {
			List<StockDto> sdto=stockDao.productStockDao(odDto.get(i).getPd_id());
			sDto.put(odDto.get(i).getPd_id(), sdto );
			System.out.println(odDto.get(i).getPd_id());
			System.out.println(sdto);
		}
		
		map.put("orderList", orderDao.adOrderViewDao(order_id));
		map.put("detailList", odDto);
		map.put("stockList", sDto);
		System.out.println(sDto);
		System.out.println(sDto.get(11));
		return map;
	}

	@Override
	public Map<String, Object> adPdMiniSearchService(String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pdList", productDao.adPdMiniSearchDao("%" + search + "%"));
		return map;
	}

	@Override
	public List<StockDto> adSelectStockService(int pd_id) {
		return stockDao.productStockDao(pd_id);
	}
}
