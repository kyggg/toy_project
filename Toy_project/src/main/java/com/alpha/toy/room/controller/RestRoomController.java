package com.alpha.toy.room.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alpha.toy.member.service.MemberService;
import com.alpha.toy.room.service.RoomService;
import com.alpha.toy.vo.ApproveVo;
import com.alpha.toy.vo.ChannelVo;
import com.alpha.toy.vo.ChattingVo;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.ProjectBoardCategoryVo;
import com.alpha.toy.vo.ProjectBoardVo;
import com.alpha.toy.vo.ProjectRoomVo;
import com.alpha.toy.vo.RelationShipVo;

@RequestMapping("/project/*")
@RestController
public class RestRoomController {

	@Autowired
	private RoomService roomService;

	@Autowired
	private MemberService memberService;


	// Clear ToDo (Update)
	@RequestMapping("clearToDoProcess.do")
	public void clearToDo(int tdboard_no) {

		roomService.clearToDo(tdboard_no);
	}

	@RequestMapping("deleteToDoProcess.do")
	public void delectToDo(int tdboard_no) {

		roomService.deleteToDo(tdboard_no);
	}

	@RequestMapping("PBCategoryProcess.do")
	public void createPBCategoryProcess(ProjectBoardCategoryVo param) {
		roomService.createPBCategory(param);
	}

	@RequestMapping("selectPBCategory.do")
	public ArrayList<HashMap<String, Object>> selectPBCategory(int room_no) {
		return roomService.selectPBCategory(room_no);
	}

	// 협업툴 게시판 카테고리 삭제 프로세스
	@RequestMapping("deletePBCategoryProcess.do")
	public void deletePBCategory(int category_no) {
		roomService.deletePBCategory(category_no);
	}

	@RequestMapping("createChannelProcess.do")
	public void createChannelProcess(ChannelVo param) {
		roomService.createChannel(param);
	}

	@RequestMapping("selectChannelProcess.do")
	public ArrayList<HashMap<String, Object>> selectChannel(int room_no) {
		return roomService.selectChannel(room_no);
	}

	@RequestMapping("deleteChannelProcess.do")
	public void deleteChannel(int channel_no) {
		roomService.deleteChannel(channel_no);
	}

	@RequestMapping("updateApproveProcess.do")
	public void updateApproveProcess(ApproveVo param,int room_no, RelationShipVo param2) {
		ApproveVo approveVo = roomService.getMemberByApproveNo(param.getApprove_no());
		int member_no = approveVo.getMember_no();
		param.setMember_no(member_no);
		param2.setMember_no(member_no);
		param2.setRoom_no(room_no);
		
		roomService.updateApprove(param);
		RelationShipVo doNotDuplicate = roomService.doNotDuplicateParticipation(param2);
		
		if(doNotDuplicate == null && param.getExamination().equals("Y")) {
			roomService.EnterProject(param2);
		}
		
		if(param.getExamination().equals("N")) {
			roomService.deleteRelationShip(member_no, room_no);
		}
	}

	@RequestMapping("toDoData.do")
	public HashMap<String, Object> calendarPage(int room_no, HttpSession session, Model model) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		ProjectRoomVo selectLeader = memberService.selectLeader(room_no);
		ArrayList<HashMap<String, Object>> toDo = roomService.selectToDo(room_no);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("sessionUser", sessionUser);
		map.put("selectLeader", selectLeader);
		map.put("toDo", toDo);
		map.put("room_no", room_no);

		return map;
	}
	@RequestMapping("insertChattingProcess.do")
	public void insertChatting(ChattingVo param) {
		roomService.insertChatting(param);
	}
	
	@RequestMapping("selectChattingProcess.do")
	public ArrayList<HashMap<String, Object>> selectChatting(int channel_no,int chatting_no ,HttpSession session){
		return roomService.selectChatting(channel_no, chatting_no ,session);
	}
	
	//협업툴 게시판 자세히 보기
	@RequestMapping("readDetailBoardProcess.do")
	public HashMap<String, Object> readDetailBoard(int board_no) {
		HashMap<String, Object> map = new HashMap<>();
		ProjectBoardVo readDetailBoard = roomService.readDetailBoard(board_no);
		int member_no = readDetailBoard.getMember_no();
		MemberVo memberName = roomService.getMemberNameByNo(member_no);
		map.put("readDetailBoard", readDetailBoard);
		map.put("memberName", memberName);
		return map;
	}
	
	//협업툴 게시판 글 삭제 프로세스
	@RequestMapping("deleteDetailBoardProcess.do")
	public void deleteDetailBoard(int board_no) {
		roomService.deleteDetailBoard(board_no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
