package com.alpha.toy.vo;

public class ToyShopLikeVo {

	private int like_no;
	private int member_no;
	private int shop_no;
	
	public ToyShopLikeVo() {
	
	}

	public ToyShopLikeVo(int like_no, int member_no, int shop_no) {
		super();
		this.like_no = like_no;
		this.member_no = member_no;
		this.shop_no = shop_no;
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

	public int getShop_no() {
		return shop_no;
	}

	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}

	
	
}
