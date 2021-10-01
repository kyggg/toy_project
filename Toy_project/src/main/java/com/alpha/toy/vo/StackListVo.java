package com.alpha.toy.vo;

public class StackListVo {
	
	private int stackList_no;
	private int stack_category_no;
	private int room_no;
	
	public StackListVo() {
	}

	public StackListVo(int stackList_no, int stack_category_no, int room_no) {
		super();
		this.stackList_no = stackList_no;
		this.stack_category_no = stack_category_no;
		this.room_no = room_no;
	}

	public int getStackList_no() {
		return stackList_no;
	}

	public void setStackList_no(int stackList_no) {
		this.stackList_no = stackList_no;
	}

	public int getStack_category_no() {
		return stack_category_no;
	}

	public void setStack_category_no(int stack_category_no) {
		this.stack_category_no = stack_category_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	
	

}
