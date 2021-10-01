package com.alpha.toy.vo;

public class ReviewMemberVo {

	private int rating_no;
	private int room_no;
	private int sender_no;
	private int receiver_no;
	private int rating_score;
	private String one_line_review;
	
	public ReviewMemberVo() {
	}

	public ReviewMemberVo(int rating_no, int room_no, int sender_no, int receiver_no, int rating_score,
			String one_line_review) {
		super();
		this.rating_no = rating_no;
		this.room_no = room_no;
		this.sender_no = sender_no;
		this.receiver_no = receiver_no;
		this.rating_score = rating_score;
		this.one_line_review = one_line_review;
	}

	public int getRating_no() {
		return rating_no;
	}

	public void setRating_no(int rating_no) {
		this.rating_no = rating_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public int getSender_no() {
		return sender_no;
	}

	public void setSender_no(int sender_no) {
		this.sender_no = sender_no;
	}

	public int getReceiver_no() {
		return receiver_no;
	}

	public void setReceiver_no(int receiver_no) {
		this.receiver_no = receiver_no;
	}

	public int getRating_score() {
		return rating_score;
	}

	public void setRating_score(int rating_score) {
		this.rating_score = rating_score;
	}

	public String getOne_line_review() {
		return one_line_review;
	}

	public void setOne_line_review(String one_line_review) {
		this.one_line_review = one_line_review;
	}
	
	
}
