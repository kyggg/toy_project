package com.alpha.toy.vo;

import java.util.Date;

public class MessageVo {
	private int message_no;
	private int member_no;
	private String member_receive_name;
	private String member_send_name;
	private String message_title;
	private String message_content;
	private int message_receivedelete;
	private int message_senddelete;
	private int message_readcount;
	private Date message_writedate;

	public MessageVo() {
		// TODO Auto-generated constructor stub
	}

	public MessageVo(int message_no, int member_no, String member_receive_name, String member_send_name,
			String message_title, String message_content, int message_receivedelete, int message_senddelete,
			int message_readcount, Date message_writedate) {
		super();
		this.message_no = message_no;
		this.member_no = member_no;
		this.member_receive_name = member_receive_name;
		this.member_send_name = member_send_name;
		this.message_title = message_title;
		this.message_content = message_content;
		this.message_receivedelete = message_receivedelete;
		this.message_senddelete = message_senddelete;
		this.message_readcount = message_readcount;
		this.message_writedate = message_writedate;
	}

	public int getMessage_receivedelete() {
		return message_receivedelete;
	}

	public void setMessage_receivedelete(int message_receivedelete) {
		this.message_receivedelete = message_receivedelete;
	}

	public int getMessage_senddelete() {
		return message_senddelete;
	}

	public void setMessage_senddelete(int message_senddelete) {
		this.message_senddelete = message_senddelete;
	}

	public String getMember_receive_name() {
		return member_receive_name;
	}

	public void setMember_receive_name(String member_receive_name) {
		this.member_receive_name = member_receive_name;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

//	public String getMember_name() {
//		return member_name;
//	}
//
//	public void setMember_name(String member_name) {
//		this.member_name = member_name;
//	}

	public String getMember_send_name() {
		return member_send_name;
	}

	public void setMember_send_name(String member_send_name) {
		this.member_send_name = member_send_name;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public int getMessage_readcount() {
		return message_readcount;
	}

	public void setMessage_readcount(int message_readcount) {
		this.message_readcount = message_readcount;
	}

	public Date getMessage_writedate() {
		return message_writedate;
	}

	public void setMessage_writedate(Date message_writedate) {
		this.message_writedate = message_writedate;
	}

}
