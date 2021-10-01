package com.alpha.toy.vo;

import java.util.Date;

public class ToyProductVo {

	private int product_no;
	private int shop_no;
	private String product_name;
	private int product_price;
	private String product_image_url;
	private int product_count;
	private String product_content;
	private Date product_date;
	
	public ToyProductVo() {
		// TODO Auto-generated constructor stub
	}

	public ToyProductVo(int product_no, int shop_no, String product_name, int product_price, String product_image_url,
			int product_count, String product_content, Date product_date) {
		super();
		this.product_no = product_no;
		this.shop_no = shop_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_image_url = product_image_url;
		this.product_count = product_count;
		this.product_content = product_content;
		this.product_date = product_date;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getShop_no() {
		return shop_no;
	}

	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_image_url() {
		return product_image_url;
	}

	public void setProduct_image_url(String product_image_url) {
		this.product_image_url = product_image_url;
	}

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	
	
}
