package com.alpha.toy.vo;

public class ChattingVo {
	private int chatting_no;
	private int channel_no;
	private int member_no;
	private String content;
	private String content_date;
	
	public ChattingVo() {
		// TODO Auto-generated constructor stub
	}

	public ChattingVo(int chatting_no, int channel_no, int member_no, String content, String content_date) {
		super();
		this.chatting_no = chatting_no;
		this.channel_no = channel_no;
		this.member_no = member_no;
		this.content = content;
		this.content_date = content_date;
	}

	public int getChatting_no() {
		return chatting_no;
	}

	public void setChatting_no(int chatting_no) {
		this.chatting_no = chatting_no;
	}

	public int getChannel_no() {
		return channel_no;
	}

	public void setChannel_no(int channel_no) {
		this.channel_no = channel_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContent_date() {
		return content_date;
	}

	public void setContent_date(String content_date) {
		this.content_date = content_date;
	}

	
	
}
