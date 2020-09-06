package com.store.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.dto.BoardDto;
import com.store.service.BoardService;
import com.store.service.DefaultService;


@MultipartConfig(fileSizeThreshold=1024*1024, maxFileSize=1024*1024*50)
@Controller
public class CustController {
	
	@Autowired
	private BoardService service;
	@Autowired
	private DefaultService defaultservice;
	
	
	@RequestMapping(value="/customer", method=RequestMethod.GET)
	public String cusCenter(Model model) {
		return "customerCenter/main"; 
	}
	
	@RequestMapping("/customerInfo")
	public String cusInfo() {
		return "customerCenter/information"; 
	}
	
	@RequestMapping("/customerContact")
	public String cusContact() {
		return "customerCenter/contact"; 
	}
	
	@RequestMapping("/customerQna")
	public String qnaMain(HttpSession session, @RequestParam(defaultValue="1") int page, Model model) {
		
		String userId = (String) session.getAttribute("email");
		int checkLogin=0;
		System.out.println(userId);
		
		//로그인 유무 확인
		if(!(userId==null)) {
			//로그인된 회원일 경우 QnA페이지 이동
			Map<String, Object> map=service.boardListService(userId,page);
			model.addAttribute("list", map.get("dto"));
			model.addAttribute("page", map.get("page"));
			checkLogin=1;
		}
		model.addAttribute("checkLogin", checkLogin);
		
		return "customerCenter/q_main"; 
	}
	
	
	@RequestMapping("/customerQnaWriteForm")
	public String qnaWrite(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("email");
		Map<String,Object> map=service.boardWriteFormService(userId);
		model.addAttribute("orderList", map.get("orderList") );
		model.addAttribute("orderCount", map.get("orderCount") );
		
		return "customerCenter/q_write";
	}
	
	@RequestMapping("/customerWrite")
	public String qnaWrite(BoardDto bDto, HttpServletRequest req, HttpSession session, Model model) {
		
		String user_email = (String) session.getAttribute("email");
		System.out.println(bDto.getTitle());
		
		//게시판 글쓰기 확인 값  1:제목미기재 2:분류미선택 10:글쓰기 성공
		int result=10;
		
		if(bDto.getTitle()==null || bDto.getTitle().trim().length()==0) {
			//제목을 입력 안했을 경우
			result=1;
			
		}else if(bDto.getBoardCat()==null || bDto.getBoardCat().trim().length()==0) {
			//게시판의 분류를 선택 안했을 경우
			result=2;
			
		}else {
			//정상적으로 모두 입력 되었을 때
			//첨부파일 받기
			Part filePart=null;
			String realPath="";
			
			try {
				filePart = req.getPart("uploadFile");
				realPath=req.getServletContext().getRealPath("/resources/questionFile");
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ServletException e) {
				e.printStackTrace();
			}
			int b_check=0;
			//파일 저장
			String fileName=service.boardFileUploadService(filePart, realPath);
			bDto.setB_check(b_check);
			bDto.setUser_email(user_email);
			bDto.setFile(fileName);
			
			//입력 실행
			service.boardWriteService(bDto);
		}
		model.addAttribute("result", result);
		
		return "customerCenter/q_write";
	}
	
	@RequestMapping(value="/boardListView")
	public String boardListView(@RequestParam("id")int id, Model model) {
		BoardDto dto=service.boardListViewService(id);
		
		model.addAttribute("dto",dto);
		return "customerCenter/q_view";
	}
	
	@RequestMapping(value="/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("id")int id, HttpServletRequest req) {
		String realPath=req.getServletContext().getRealPath("/resources/questionFile");
		service.boardDeleteService(id, realPath);
		return "redirect:customerQna"; 
	}
	@RequestMapping(value="/boardUpdateForm", method = RequestMethod.GET)
	public String boardUpdateForm(@RequestParam("id")int id, Model model) {
		
		Map<String,Object> map=service.boardUpdateFormService(id);
		model.addAttribute("dto", map.get("board"));
		model.addAttribute("list", map.get("catList"));
		model.addAttribute("orderList", map.get("orderList"));
		model.addAttribute("orderCount", map.get("orderCount"));
		
		return "customerCenter/q_update";
	}
	
	@RequestMapping("/boardUpdate")
	public String boardupdate( BoardDto bDto, HttpServletRequest req, Model model) throws IOException, ServletException {
		
		//게시판 글쓰기 확인 값  1:제목미기재 10:글쓰기 성공
		int result=10;
		
		//제목을 입력 안했을 경우
		if(defaultservice.check(bDto.getTitle())) {
			result=1;
			model.addAttribute("result", result);
			return "customerCenter/q_update";
		}
		
		//새로 올라온 파일
		Part filePart=req.getPart("uploadFile");
		//기존에 올렸던 파일
		String oldFile=req.getParameter("oldFile");
		String realPath=req.getServletContext().getRealPath("/resources/questionFile");
		String fileName;
		
		//기존에 올렸던 파일이 없을 경우
		if("questionFile/".equals(oldFile)) {
			fileName=service.boardFileUploadService(filePart, realPath);
		}else {
			//기존 올렸던 파일이 있을 경우
			fileName=service.boardFileUploadService(filePart, realPath, oldFile);
		}
		
		if("".equals(fileName)) {
			
		}else {
			//boardDto에 file이름 추가
			bDto.setFile(fileName);
		}
		
		service.boardUpdateService(bDto);
		
		model.addAttribute("result", result);
		
		return "customerCenter/q_update"; 
	}
	@RequestMapping("/fileDelete")
	public @ResponseBody int fileDelete(@RequestParam("file") String file, HttpServletRequest req) {
		System.out.println(file);
		String realPath=req.getServletContext().getRealPath("/resources/questionFile");
		String filePath=realPath + "/" +file;
		System.out.println("filePath"+filePath);
		File delfile = new File(filePath);
		
		if(delfile.exists()) {
			System.out.println("파일 있음"+delfile);
			delfile.delete();
		}
		
		int result=service.fileDeleteService(file);
		
		return result;
	}
		
		
	
	
}
