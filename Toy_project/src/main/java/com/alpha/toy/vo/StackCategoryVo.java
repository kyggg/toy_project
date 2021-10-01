package com.alpha.toy.vo;

public class StackCategoryVo {
	
	private int stack_category_no;
	private String category_name;
	
	public StackCategoryVo() {
	}
	
	

	public StackCategoryVo(int stack_category_no, String category_name) {
		super();
		this.stack_category_no = stack_category_no;
		this.category_name = category_name;
	}

	public int getStack_category_no() {
		return stack_category_no;
	}

	public void setStack_category_no(int stack_category_no) {
		this.stack_category_no = stack_category_no;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	
	
	

}
