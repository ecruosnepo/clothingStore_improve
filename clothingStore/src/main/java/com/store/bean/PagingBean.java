package com.store.bean;

import org.springframework.stereotype.Component;

@Component
public class PagingBean {
   //현재페이지
   private int thisPage;
   //모든 목록의 개수
   private int totalList;
   //페이지당 들어갈 목록의 개수
   private int listSize;
   //현재 페이지 목록의 시작 인덱스
   private int startIdx;
   //현재 페이지 목록의 마지막 인덱스
   private int endIdx;
   //총페이지수
   private int totalPage;
   //한 페이지당 보여질 페이지의 개수
   private int pagePerPaging;
   //페이지의 시작 번호
   private int startPageIdx;
   //페이지의 끝나는 번호
   private int endPageIdx;
   //검색어
   private String keyword;
   
   public PagingBean() {}
   
   public PagingBean(int thisPage, int totalList ,int listSize ,int pagePerPaging) {
	      //현재 페이지
		  this.thisPage=thisPage;
	      //페이지당 글 갯수
	      this.listSize=listSize;
	      //페이지 번호 표시 갯수
	      this.pagePerPaging=pagePerPaging;
	      //전체 글 갯수
	      this.totalList=totalList;
	      
	      setStartIdx();
	      setEndIdx();
	      setTotalPage();
	      setStartPageIdx();
	      setEndPageIdx();
   }
   
   public PagingBean(int thisPage, int totalList ,int listSize ,int pagePerPaging, String keyword) {
      //현재 페이지
	  this.thisPage=thisPage;
      //페이지당 글 갯수
      this.listSize=listSize;
      //페이지 번호 표시 갯수
      this.pagePerPaging=pagePerPaging;
      //전체 글 갯수
      this.totalList=totalList;
      
      setStartIdx();
      setEndIdx();
      setTotalPage();
      setStartPageIdx();
      setEndPageIdx();
      setKeyword(keyword);
   }

   public int getThisPage() {
      return thisPage;
   }

   public void setThisPage(int thisPage) {
      this.thisPage = thisPage;
   }

   public int getTotalList() {
      return totalList;
   }

   public void setTotalList(int totalList) {
      this.totalList = totalList;
   }

   public int getListSize() {
      return listSize;
   }

   public void setListSize(int listSize) {
      this.listSize = listSize;
   }

   public int getStartIdx() {
      return startIdx;
   }

   public void setStartIdx() {
      this.startIdx = (this.thisPage-1)*this.listSize;
   }

   public int getTotalPage() {
      return totalPage;
   }

   public void setTotalPage() {
      this.totalPage = (int) Math.ceil((float)this.totalList/this.listSize);
   }

   public int getPagePerPaging() {
      return pagePerPaging;
   }

   public void setPagePerPaging(int pagePerPaging) {
      this.pagePerPaging = pagePerPaging;
   }

   public int getStartPageIdx() {
      return startPageIdx;
   }

   public void setStartPageIdx() {
      this.startPageIdx = this.thisPage-(this.thisPage-1)%this.pagePerPaging;
   }

   public int getEndPageIdx() {
      return endPageIdx;
   }

   public void setEndPageIdx() {
      this.endPageIdx = (this.totalPage > this.startPageIdx+this.pagePerPaging-1)? startPageIdx+this.pagePerPaging-1 : totalPage;
   }
   public int getEndIdx() {
      return endIdx;
   }

   public void setEndIdx() {
      this.endIdx = this.startIdx+this.listSize-1;
   }
   
   public String getKeyword() {
	   return keyword;
   }
   
   public void setKeyword(String keyword) {
	   this.keyword = keyword;
   }

}