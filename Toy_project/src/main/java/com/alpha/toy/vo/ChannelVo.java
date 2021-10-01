package com.alpha.toy.vo;

public class ChannelVo {

	private int channel_no;;
	private int room_no;
	private String channel_name;
	
	public ChannelVo() {
		// TODO Auto-generated constructor stub
	}

	public ChannelVo(int channel_no, int room_no, String channel_name) {
		super();
		this.channel_no = channel_no;
		this.room_no = room_no;
		this.channel_name = channel_name;
	}

	public int getChannel_no() {
		return channel_no;
	}

	public void setChannel_no(int channel_no) {
		this.channel_no = channel_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getChannel_name() {
		return channel_name;
	}

	public void setChannel_name(String channel_name) {
		this.channel_name = channel_name;
	}
	
	
}
