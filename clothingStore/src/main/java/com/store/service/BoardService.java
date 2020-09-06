package com.store.service;

import java.util.Map;

import javax.servlet.http.Part;

import com.store.dto.BoardDto;

public interface BoardService {

	public Map<String, Object> boardListService(String userId,int page);
	public void boardWriteService(BoardDto bDto);
	public Map<String,Object> boardWriteFormService(String userId);
	public BoardDto boardListViewService(int id); 
	public void boardDeleteService(int id, String realPath);
	public Map<String,Object> boardUpdateFormService(int id);
	public void boardUpdateService(BoardDto bDto);
	public String boardFileUploadService(Part filePart, String realPath);
	public String boardFileUploadService(Part filePart, String realPath, String oldFile);
	public int fileDeleteService(String file);
}
