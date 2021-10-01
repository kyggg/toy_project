package com.alpha.toy.vo;

import java.util.Date;

public class ToyBuyVo {

	private int buy_no;
	private int member_no;
	private int product_no;
	private String buy_address;
	private int buy_count;
	private Date buy_date;
	
	public ToyBuyVo() {
		// TODO Auto-generated constructor stub
	}

	public ToyBuyVo(int buy_no, int member_no, int product_no, String buy_address, int buy_count, Date buy_date) {
		super();
		this.buy_no = buy_no;
		this.member_no = member_no;
		this.product_no = product_no;
		this.buy_address = buy_address;
		this.buy_count = buy_count;
		this.buy_date = buy_date;
	}

	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getBuy_address() {
		return buy_address;
	}

	public void setBuy_address(String buy_address) {
		this.buy_address = buy_address;
	}

	public int getBuy_count() {
		return buy_count;
	}

	public void setBuy_count(int buy_count) {
		this.buy_count = buy_count;
	}

	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	
	
}
