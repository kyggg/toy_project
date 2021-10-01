package com.alpha.toy.vo;

public class DoPersonVo {

	private int dop_no;
	private int room_no;
	private int member_no;
	private int tdboard_no;

	public DoPersonVo() {
		super();
	}

	public DoPersonVo(int dop_no, int room_no, int member_no, int tdboard_no) {
		super();
		this.dop_no = dop_no;
		this.room_no = room_no;
		this.member_no = member_no;
		this.tdboard_no = tdboard_no;
	}

	public int getDop_no() {
		return dop_no;
	}

	public void setDop_no(int dop_no) {
		this.dop_no = dop_no;
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

	public int getTdboard_no() {
		return tdboard_no;
	}

	public void setTdboard_no(int tdboard_no) {
		this.tdboard_no = tdboard_no;
	}

}
