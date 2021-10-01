package com.alpha.toy.vo;

import java.util.Date;

public class ProjectBoardVo {

	private int board_no;
	private int category_no;
	private int member_no;
	private String title;
	private String content;
	private Date content_date;
	
	public ProjectBoardVo() {
		
	}

	public ProjectBoardVo(int board_no, int category_no, int member_no, String title, String content,
			Date content_date) {
		super();
		this.board_no = board_no;
		this.category_no = category_no;
		this.member_no = member_no;
		this.title = title;
		this.content = content;
		this.content_date = content_date;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getContent_date() {
		return content_date;
	}

	public void setContent_date(Date content_date) {
		this.content_date = content_date;
	}

	
}
