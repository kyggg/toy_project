package com.alpha.toy.vo;

public class ProjectBoardCategoryVo {
	private int category_no;
	private int room_no;
	private String ca_name;
	
	public ProjectBoardCategoryVo() {

	}

	public ProjectBoardCategoryVo(int category_no, int room_no, String ca_name) {
		super();
		this.category_no = category_no;
		this.room_no = room_no;
		this.ca_name = ca_name;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getCa_name() {
		return ca_name;
	}

	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	
	
}
