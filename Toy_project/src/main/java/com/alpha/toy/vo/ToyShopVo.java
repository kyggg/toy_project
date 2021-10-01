package com.alpha.toy.vo;

import java.util.Date;

public class ToyShopVo {

	private int shop_no;
	private int member_no;
	private String shop_name;
	private String shop_image_url;
	private String shop_content;
	private Date shop_date;
	
	public ToyShopVo() {
		// TODO Auto-generated constructor stub
	}

	public ToyShopVo(int shop_no, int member_no, String shop_name, String shop_image_url, String shop_content,
			Date shop_date) {
		super();
		this.shop_no = shop_no;
		this.member_no = member_no;
		this.shop_name = shop_name;
		this.shop_image_url = shop_image_url;
		this.shop_content = shop_content;
		this.shop_date = shop_date;
	}

	public int getShop_no() {
		return shop_no;
	}

	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getShop_image_url() {
		return shop_image_url;
	}

	public void setShop_image_url(String shop_image_url) {
		this.shop_image_url = shop_image_url;
	}

	public String getShop_content() {
		return shop_content;
	}

	public void setShop_content(String shop_content) {
		this.shop_content = shop_content;
	}

	public Date getShop_date() {
		return shop_date;
	}

	public void setShop_date(Date shop_date) {
		this.shop_date = shop_date;
	}
	
	
}
