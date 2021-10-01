package com.alpha.toy.vo;

public class TechImageVo {

	private int image_no;
	private int tech_no;
	private String image_url;
	private String image_ori;
	
	public TechImageVo() {
	
	}

	public TechImageVo(int image_no, int tech_no, String image_url, String image_ori) {
		super();
		this.image_no = image_no;
		this.tech_no = tech_no;
		this.image_url = image_url;
		this.image_ori = image_ori;
	}

	public int getImage_no() {
		return image_no;
	}

	public void setImage_no(int image_no) {
		this.image_no = image_no;
	}

	public int getTech_no() {
		return tech_no;
	}

	public void setTech_no(int tech_no) {
		this.tech_no = tech_no;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public String getImage_ori() {
		return image_ori;
	}

	public void setImage_ori(String image_ori) {
		this.image_ori = image_ori;
	}
	
	
}
