package com.alpha.toy.message.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alpha.toy.message.service.MessageServicelmpl;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.MessageVo;

@Controller
@RequestMapping("/message/*")
public class MessageController {

	@Autowired
	private MessageServicelmpl messageService;

//	받은메시지 리스트
	@RequestMapping("messageList.do")
	public String messageList(Model model, String member_name, String member_receive_name,
			@RequestParam(defaultValue = "1") int page_num, HttpSession session) {

		ArrayList<HashMap<String, Object>> messageList = messageService.getmessage(member_name, member_receive_name,
				page_num);

		
		model.addAttribute("messageList", messageList);

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");

		String result = sessionUser.getMember_id();

		// 쪽지 카운트
		int readCount = messageService.getContentCount(result);
		model.addAttribute("readCount", readCount);

		return "message/messageList";

	}

//	보낸 메시지 리스트
	@RequestMapping("sendMessageList.do")
	public String sendMessageList(Model model, String member_name, String member_send_name,
			@RequestParam(defaultValue = "1") int page_num, HttpSession session) {

		ArrayList<HashMap<String, Object>> sendmessageList = messageService.getsendmessage(member_name,
				member_send_name, page_num);

		
		model.addAttribute("sendmessageList", sendmessageList);

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");

		String result = sessionUser.getMember_id();

		// 쪽지 카운트
		int readCount = messageService.getContentCount(result);
		model.addAttribute("readCount", readCount);

		return "message/sendMessageList";
	}

//	메시지 작성
	@RequestMapping("writeMessageProcess.do")
	public String writeMessageProcess(HttpSession session, MessageVo param, Model model) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);

		messageService.writeMessage(param);

		String result = sessionUser.getMember_id();

		// 쪽지 카운트
		int readCount = messageService.getContentCount(result);
		model.addAttribute("readCount", readCount);

		return "redirect:./sendMessageList.do?member_name=" + param.getMember_send_name();
	}
	
	//프로젝트 툴 메세지
	@RequestMapping("prowriteMessageProcess.do")
	public String ProwriteMessageProcess(HttpSession session, MessageVo param, Model model, int room_no) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);

		messageService.writeMessage(param);


		return "redirect:../project/coperate.do?room_no=" + room_no;
	}

	//프로젝트 툴 메세지
	@RequestMapping("todowriteMessageProcess.do")
	public String todowriteMessageProcess(HttpSession session, MessageVo param, Model model, int room_no) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);

		messageService.writeMessage(param);


		return "redirect:../project/planPage.do?room_no=" + room_no;
	}

//	받은메시지 읽기
	@RequestMapping("readMessage.do")
	public String readMessage(int message_no, Model model, HttpSession session) {
		// 읽음 확인
		messageService.increaseReadCount(message_no);
		// 내용
		HashMap<String, Object> map = messageService.getContent(message_no);

		model.addAttribute("content", map);

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");

		String result = sessionUser.getMember_id();

		// 쪽지 카운트
		int readCount = messageService.getContentCount(result);
		model.addAttribute("readCount", readCount);

		return "message/readMessage";

	}

//	보낸메시지 읽기
	@RequestMapping("readsendMessage.do")
	public String readSendMessage(int message_no, Model model, HttpSession session) {

		// 내용
		HashMap<String, Object> map = messageService.getContent(message_no);

		model.addAttribute("content", map);
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");

		String result = sessionUser.getMember_id();

		// 쪽지 카운트
		int readCount = messageService.getContentCount(result);
		model.addAttribute("readCount", readCount);

		return "message/readsendMessage";

	}

//	받은 메시지 삭제
	@RequestMapping("deleteMessageProcess.do")
	public String deleteMessageProcess(int message_no, HttpSession session, MessageVo param) {

		MemberVo sessionuser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionuser.getMember_no();

		param.setMember_no(member_no);

		messageService.deleteMessage(message_no);

		return "redirect:./messageList.do?member_name=" + sessionuser.getMember_id();
	}

//	메시지 DB삭제 사용안함
	@RequestMapping("deletesendMessageProcess.do")
	public String deletesendMessageProcess(int message_no, HttpSession session, MessageVo param) {

		messageService.increasesendMessage(message_no);

		MemberVo sessionuser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionuser.getMember_no();

		param.setMember_no(member_no);

		return "redirect:./sendMessageList.do?member_name=" + sessionuser.getMember_id();
	}

//	받은 메시지 삭제
	@RequestMapping("deletereceiveMessageProcess.do")
	public String deletereceiveMessageProcess(int message_no, HttpSession session, MessageVo param) {

		messageService.increasereceiveMessage(message_no);

		MemberVo sessionuser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionuser.getMember_no();

		param.setMember_no(member_no);

		return "redirect:./messageList.do?member_name=" + sessionuser.getMember_id();
	}
	
	
	//테크 보드 메세지
	@RequestMapping("BoardtcwriteMessageProcess.do")
	public String BoardtcwriteMessageProcess(HttpSession session, MessageVo param, Model model) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);

		messageService.writeMessage(param);


		return "redirect:../board/Tech_Html.do";
	}
	//QnA 보드 메세지
	@RequestMapping("BoardQawriteMessageProcess.do")
	public String BoardQawriteMessageProcess(HttpSession session, MessageVo param, Model model) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);

		messageService.writeMessage(param);


		return "redirect:../board/QnAList.do";
	}
	
	//Free 보드 메세지
	@RequestMapping("BoardFrwriteMessageProcess.do")
	public String BoardFrwriteMessageProcess(HttpSession session, MessageVo param, Model model) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);

		messageService.writeMessage(param);


		return "redirect:../board/bulletinBoard_mainfr.do";
	}
	
	
	
	
	

}
