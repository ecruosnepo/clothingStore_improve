package com.store.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.bean.PagingBean;
import com.store.dao.BoardDao;
import com.store.dao.OrderDao;
import com.store.dao.OrderDetailDao;
import com.store.dto.BoardDto;
import com.store.dto.OrderDto;

@MultipartConfig(fileSizeThreshold=1024*1024, maxFileSize=1024*1024*50)
@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao dao;
	@Autowired
	OrderDao orderDao;
	@Autowired
	OrderDetailDao oDetailDao;
	@Autowired
	PagingBean pageBean;
	
	@Override
	public Map<String, Object> boardListService(String userId, int page) {
		
		Map<String, Object> map=new HashMap<String, Object>(); 
		pageBean=new PagingBean(page,dao.boardListCountDao(userId),5,3);
		
		map.put("dto", dao.boardListDao(userId));
		map.put("page", pageBean);
		
		return map;
	}
	@Override
	public Map<String,Object> boardWriteFormService(String userId){
		Map<String,Object> map=new HashMap<String, Object>();
		List<OrderDto> orderList= orderDao.userOrderListDao(userId);
		List<Integer> orderCount=new ArrayList<Integer>();
		for(OrderDto dto : orderList) {
			orderCount.add(oDetailDao.orderDetailCountDao(dto.getOrder_id()));
		}
		map.put("orderList", orderList);
		map.put("orderCount", orderCount);
		
		return map;
	}
	@Override
	public void boardWriteService(BoardDto bDto) {
		
		dao.boardWriteDao(bDto);
	}

	@Override
	public BoardDto boardListViewService(int id) {
		BoardDto dto=dao.boardViewDao(id);
		return dto;
	}

	@Override
	public void boardDeleteService(int id, String realPath) {
		
		String fileName=dao.bIdFindFileDao(id);
		String filePath=realPath + "/" +fileName;
		File delFile = new File(filePath);
		System.out.println(filePath);
		if(delFile.exists()) {
			System.out.println("파일 있음"+delFile);
			delFile.delete();
		}else
			System.out.println("파일 없음");
		
		dao.boardDeleteListDao(id);
	}

	@Override
	public Map<String,Object> boardUpdateFormService(int id) {
		Map<String,Object> map=new HashMap<String,Object>();
		//boardId에 해당하는 BoardDto
		BoardDto dto=dao.boardViewDao(id);
		//email에 해당하는 orderList
		List<OrderDto> orderList= orderDao.userOrderListDao(dto.getUser_email());
		//orderid당 상품 수량
		List<Integer> orderCount=new ArrayList<Integer>();
		for(OrderDto oDto : orderList) {
			orderCount.add(oDetailDao.orderDetailCountDao(oDto.getOrder_id()));
		}
		map.put("orderList", orderList);
		map.put("orderCount", orderCount);
		
		//board카테고리 리스트
		List<String> catList=new ArrayList<String>();
		catList.add("배송"); catList.add("결제"); catList.add("교환"); catList.add("환불"); catList.add("기타");
		
		map.put("board",dto);
		map.put("catList", catList);
		map.put("orderList", orderList);
		map.put("orderCount", orderCount);
		
		
		return map;
	}

	@Override
	public void boardUpdateService(BoardDto bDto) {
		dao.boardUpdateDao(bDto);
	}
	
	//파일 올려주고 filename 리턴 메소드
	@Override
	public String boardFileUploadService(Part filePart, String realPath) {
		
		String fileName="";
		
		try {
			fileName=filePart.getSubmittedFileName();
			//파일이 없을 경우 공백 리턴
			if(fileName==null || fileName.equals("")) {
				return "";
			}
			
			List<String> oFileNames=dao.boardFileNameListDao();
			//파일이름 중복 제거
			for(int i=0; i<oFileNames.size();i++) {
				int n=1;
				if(fileName.equals(oFileNames.get(i))) {
					fileName="("+n+")"+fileName;
					n++;
				}
			}
			
			//파일 업로드
			InputStream fis=filePart.getInputStream();
			
			String filePath=realPath + File.separator + fileName;
			FileOutputStream fos=new FileOutputStream(filePath);
			
			byte[] buf=new byte[1024];
			int size=0;
			while((size=fis.read(buf)) != -1) {
				fos.write(buf,0,size);
			}
				fos.close();
				fis.close();
				
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	public String boardFileUploadService(Part filePart, String realPath, String oldFile) {
		String filePath=realPath +"../../"+ oldFile;
		File oFile = new File(filePath);
		String newFile=filePart.getSubmittedFileName();
		
		//기존 파일에서 새로운 파일로 바뀌었을 때
		if(!(newFile==null || "".equals(newFile))) {
			if(oFile.exists()) {
				System.out.println("파일 있음"+oFile);
				oFile.delete();
			}else
				System.out.println("파일 없음");
		}
		//기존 파일이 있지만 파일 수정은 없을 경우
		return boardFileUploadService(filePart, realPath);
	}
	@Override
	public int fileDeleteService(String file) {
		int result=dao.fileDeleteDao(file);
		return result;
	}
	
	
}


