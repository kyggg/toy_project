package com.alpha.toy.message.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.MessageVo;

public interface MessageSQLMapper {
	public int createMessagePK();
	
	//write
	public void writeMessage(MessageVo vo);
	
	//read(select)
	public ArrayList<MessageVo> getmessage(
			@Param("member_name") String member_name,
			@Param("member_receive_name") String member_receive_name,
			@Param("page_num") int page_num
		);
	//카운트
	public int getContentCount(String member_id);
	
	public ArrayList<MessageVo> getsendmessage(
			@Param("member_name") String member_name,
			@Param("member_send_name") String member_send_name,
			@Param("page_num") int page_num
		);
	//페이징
	public int getsendContentCount(
			@Param("member_name") String member_name,
			@Param("member_send_name") String member_send_name,
			@Param("page_num") int page_num
		);
	public MessageVo getContentByNo(int message_no);
	
	//DB삭제
	public void deleteMessage(int message_no);
	
	//읽음확인
	public void increaseReadCount(int message_no);
	
	//보낸 메시지 삭제
	public void increasesendMessage(int message_no);
	
	//받은 메시지 삭제
	public void increasereceiveMessage(int message_no);
	
	public MemberVo messageName(String member_receive_name);
	
}
