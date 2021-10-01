package com.alpha.toy.vo;

public class TechLikeVo {

	private int like_no;
	private int member_no;
	private int tech_no;
	
	public TechLikeVo() {
	
	}

	public TechLikeVo(int like_no, int member_no, int tech_no) {
		super();
		this.like_no = like_no;
		this.member_no = member_no;
		this.tech_no = tech_no;
	}

	public int getLike_no() {
		return like_no;
	}

	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getTech_no() {
		return tech_no;
	}

	public void setTech_no(int tech_no) {
		this.tech_no = tech_no;
	}
	
	
}
