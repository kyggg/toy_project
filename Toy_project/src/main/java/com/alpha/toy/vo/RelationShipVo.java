package com.alpha.toy.vo;

public class RelationShipVo {
	private int rs_no;
	private int room_no;
	private int member_no;
	
	
	
	public RelationShipVo() {
	}
	

	public RelationShipVo(int rs_no, int room_no, int member_no) {
		super();
		this.rs_no = rs_no;
		this.room_no = room_no;
		this.member_no = member_no;
	}


	public int getRs_no() {
		return rs_no;
	}


	public void setRs_no(int rs_no) {
		this.rs_no = rs_no;
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
	
	
}
