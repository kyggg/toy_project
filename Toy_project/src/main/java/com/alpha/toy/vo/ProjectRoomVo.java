package com.alpha.toy.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProjectRoomVo {

	private int room_no;
	private int member_no;
	private String title;
	private String simpleContent;
	private int people;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date lastDate;
	private String address;
	private String status;
	
	public ProjectRoomVo() {
		super();
	}

	public ProjectRoomVo(int room_no, int member_no, String title, String simpleContent, int people, Date startDate,
			Date lastDate, String address, String status) {
		super();
		this.room_no = room_no;
		this.member_no = member_no;
		this.title = title;
		this.simpleContent = simpleContent;
		this.people = people;
		this.startDate = startDate;
		this.lastDate = lastDate;
		this.address = address;
		this.status = status;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
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

	public String getSimpleContent() {
		return simpleContent;
	}

	public void setSimpleContent(String simpleContent) {
		this.simpleContent = simpleContent;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	

	
}
