package com.alpha.toy.message.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.toy.member.mapper.MemberSQLMapper;
import com.alpha.toy.message.mapper.MessageSQLMapper;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.MessageVo;

@Service
public class MessageServicelmpl {

	@Autowired
	private MessageSQLMapper messageSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;

	public void writeMessage(MessageVo vo) {

		int message_no = messageSQLMapper.createMessagePK();

		vo.setMessage_no(message_no);

		messageSQLMapper.writeMessage(vo);

	};

	public ArrayList<HashMap<String, Object>> getmessage(String member_name,String member_receive_name, int page_num) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<MessageVo> messageList = messageSQLMapper.getmessage(member_name, member_receive_name, page_num);
		
		for (MessageVo messageVo : messageList) {
			
			int memberNo = messageVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(memberNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("memberVo", memberVo);
			map.put("messageVo", messageVo);
			
			list.add(map);
		}
		return list;
	}

	public ArrayList<HashMap<String, Object>> getsendmessage(String member_name,String member_send_name ,int page_num) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		ArrayList<MessageVo> messageList = messageSQLMapper.getsendmessage(member_name, member_send_name, page_num);
		
		for (MessageVo messageVo : messageList) {
			
			int memberNo = messageVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(memberNo);
			
			String member_id = messageVo.getMember_receive_name();
			
			MemberVo messageName = messageSQLMapper.messageName(member_id);
			
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("memberVo", memberVo);
			map.put("messageVo", messageVo);
			map.put("messageName", messageName);
			
			list.add(map);
		}
		return list;
	}
	public int getContentCount(String member_id) {
		int count = messageSQLMapper.getContentCount(member_id);

		return count;
	}
	

	public HashMap<String, Object> getContent(int message_no) {

		MessageVo messageVo = messageSQLMapper.getContentByNo(message_no);

		// html escape
		String content = messageVo.getMessage_content();
		content = StringEscapeUtils.escapeHtml4(content);

		content = content.replaceAll("\n", "<br>");

		messageVo.setMessage_content(content);

		int member_no = messageVo.getMember_no();

		MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);

		HashMap<String, Object> map = new HashMap<String, Object>();

		

		map.put("memberVo", memberVo);
		map.put("messageVo", messageVo);
		
	
		return map;

	}
	
	public void increaseReadCount(int message_no) {
		messageSQLMapper.increaseReadCount(message_no);
		
	}
	
	public void deleteMessage(int message_no) {
		messageSQLMapper.deleteMessage(message_no);
	}
	
	public void increasesendMessage(int message_no) {
		messageSQLMapper.increasesendMessage(message_no);
	}

	public void increasereceiveMessage(int message_no) {
		messageSQLMapper.increasereceiveMessage(message_no);
	}

}
