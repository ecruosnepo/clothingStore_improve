package com.store.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.BoardDto;

@Mapper
public interface BoardDao {
	
	//아이디 기준 모든 게시물 출력
	public List<BoardDto> boardListDao(@Param("user_email") String user_email);
	public void boardWriteDao(BoardDto bDto);
	public BoardDto boardViewDao(@Param("id") int id);
	//총 게시물수
	public int boardListCountDao(@Param("user_email") String user_email);
	public void boardDeleteListDao(@Param("id")int id);
	public void boardUpdateDao(BoardDto bDto);
	public List<String> boardFileNameListDao();
	public int fileDeleteDao(@Param("file")String file);
	//boardId로 파일명 찾기
	public String bIdFindFileDao(@Param("id")int id);
	
	//관리자 페이지
	//문의글 답변 작성
	public void boardAnswerUpdate(@Param("id")int id, @Param("answer")String answer);
	//총 게시물수
	public int boardListAllCountDao();
	//모든 게시물 리스트
	public List<BoardDto> boardListAllDao();
	//검색 게시물 리스트
	public List<BoardDto> boardListAllDao(@Param("search") String search, @Param("boardCat") String boardCat);
	//검색 게시물의 개수
	public int boardListAllCountDao(@Param("search") String search, @Param("boardCat") String boardCat);
	//회원삭제시- 문의글 삭제
	public void boardDelUserDao(@Param("user_email")String user_email);
	//userEmail로 파일명 찾기
	public List<String> bEmailFindFileDao(@Param("user_email")String user_email);
}
