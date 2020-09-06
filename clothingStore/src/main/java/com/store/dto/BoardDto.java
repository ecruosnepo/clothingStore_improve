package com.store.dto;


import java.sql.Date;

import lombok.Data;

@Data
public class BoardDto {
	private int id;
	//답변 유무
	private int b_check;
	private String user_email;
	private String title;
	private String question;
	private String answer;
	private String boardCat;
	private Date regDate;
	private String file;
	private String orderId;
	
	public String getTitle() {
		if(title==null) {
			return title;
		}
		return title.replaceAll("(?i)<script", "&lt;script");
	}
	public String getQuestion() {
		if(question==null) {
			return question;
		}
		return question.replaceAll("(?i)<script", "&lt;script");
	}
	public String getAnswer() {
		if(answer==null) {
			return answer;
		}
		return answer.replaceAll("(?i)<script", "&lt;script");
	}
}
