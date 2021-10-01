package com.alpha.toy.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ToDoBoardVo {

	private int tdboard_no;
	private int room_no;
	private String content;
	private String detailContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date finishDate;
	private String complete;

	public ToDoBoardVo() {
		super();
	}

	public ToDoBoardVo(int tdboard_no, int room_no, String content, String detailContent, Date startDate,
			Date finishDate, String complete) {
		super();
		this.tdboard_no = tdboard_no;
		this.room_no = room_no;
		this.content = content;
		this.detailContent = detailContent;
		this.startDate = startDate;
		this.finishDate = finishDate;
		this.complete = complete;
	}

	public int getTdboard_no() {
		return tdboard_no;
	}

	public void setTdboard_no(int tdboard_no) {
		this.tdboard_no = tdboard_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDetailContent() {
		return detailContent;
	}

	public void setDetailContent(String detailContent) {
		this.detailContent = detailContent;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public String getComplete() {
		return complete;
	}

	public void setComplete(String complete) {
		this.complete = complete;
	}

}
