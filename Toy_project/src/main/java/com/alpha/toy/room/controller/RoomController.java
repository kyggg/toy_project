package com.alpha.toy.room.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpha.toy.member.service.MemberService;
import com.alpha.toy.room.service.RoomService;
import com.alpha.toy.vo.ApproveVo;
import com.alpha.toy.vo.ChannelVo;
import com.alpha.toy.vo.DoPersonVo;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.ProjectBoardCategoryVo;
import com.alpha.toy.vo.ProjectBoardVo;
import com.alpha.toy.vo.ProjectRoomVo;
import com.alpha.toy.vo.RelationShipVo;
import com.alpha.toy.vo.ReviewMemberVo;
import com.alpha.toy.vo.StackCategoryVo;
import com.alpha.toy.vo.ToDoBoardVo;

@RequestMapping("/project/*")
@Controller
public class RoomController {

	@Autowired
	private RoomService roomService;

	@Autowired
	private MemberService memberService;

	// 프로젝트 룸 개설페이지
	@RequestMapping("room.do")
	public String projectRoom(Model model) {

		ArrayList<StackCategoryVo> stackList = roomService.getStackList();
		model.addAttribute("stackList", stackList);
	
		
		return "room/createRoom";
	}

	// 프로젝트 룸 생성프로세스(Insert)
	@RequestMapping("createProjectRoomProcess.do")
	public String createProjectRoomProcess(ProjectRoomVo param, RelationShipVo param2, int[] stack_category_no,
			HttpSession session) {
		MemberVo memberVo = (MemberVo) session.getAttribute("sessionUser");
		int member_no = memberVo.getMember_no();
		param.setMember_no(member_no);

		roomService.createProjectRoom(param, stack_category_no, param2);
		return "coperatetool/projectSuccess";

	}

	// 프로젝트에 참여하기(최초1회 DB에 저장하기 위한 것 + 중복참여 검사)
	@RequestMapping("enterProject.do")
	public String EnterProject(RelationShipVo param) {
		return "redirect:./coperate.do?room_no=" + param.getRoom_no();
	}

	// 협업페이지
	@RequestMapping("coperate.do")
	public String cooperatePage(ProjectBoardCategoryVo pbcVo, Model model, int room_no, HttpSession session) {

		ArrayList<HashMap<String, Object>> selectPBCategory = roomService.selectPBCategory(room_no);
		ArrayList<HashMap<String, Object>> selectChannel = roomService.selectChannel(room_no);
		ArrayList<HashMap<String, Object>> toDo = roomService.selectToDo(room_no);
		ArrayList<ToDoBoardVo> comToDo = roomService.comToDo(room_no);
		ArrayList<ToDoBoardVo> incomToDo = roomService.incomToDo(room_no);
	
		ArrayList<MemberVo> projectMember = roomService.selectProjectMembers(room_no);
		ArrayList<RelationShipVo> selectRelationMemberNo = roomService.selectRelationMemberNo(room_no);
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");

		
		
		int memberNoByRoomNo = roomService.getMemberNoByRoomNo(room_no);
		int leaderNoProjectNo = roomService.leaderNoProjectNo(room_no);
		

		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("selectChannel", selectChannel);
		model.addAttribute("pbcCategory", selectPBCategory);
		model.addAttribute("pbcVo", pbcVo);
		model.addAttribute("memberNoByRoomNo", memberNoByRoomNo);
		model.addAttribute("room_no", room_no);
		model.addAttribute("toDo", toDo);
		model.addAttribute("comToDo", comToDo);
		model.addAttribute("incomToDo", incomToDo);
		model.addAttribute("projectMember", projectMember);
		model.addAttribute("selectRelationMemberNo", selectRelationMemberNo);
		model.addAttribute("leaderNoProjectNo", leaderNoProjectNo);

		return "coperatetool/mainPage";

	}

	// 일정페이지
	@RequestMapping("planPage.do")
	public String planPage(Model model, int room_no, HttpSession session, ProjectBoardCategoryVo pbcVo) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		ProjectRoomVo selectLeader = memberService.selectLeader(room_no);
		int memberNoByRoomNo = roomService.getMemberNoByRoomNo(room_no);

		ArrayList<HashMap<String, Object>> selectPBCategory = roomService.selectPBCategory(room_no);
		ArrayList<HashMap<String, Object>> selectChannel = roomService.selectChannel(room_no);
		ArrayList<HashMap<String, Object>> toDo = roomService.selectToDo(room_no);
		ArrayList<MemberVo> projectMember = roomService.selectProjectMembers(room_no);
		int countToDo = roomService.countToDo(room_no);
		int countNoToDo = roomService.countNoToDo(room_no);
		int countYesToDo = roomService.countYesToDo(room_no);

		model.addAttribute("selectPBCategory", selectPBCategory);
		model.addAttribute("selectChannel", selectChannel);
		model.addAttribute("pbcCategory", selectPBCategory);
		model.addAttribute("pbcVo", pbcVo);
		model.addAttribute("memberNoByRoomNo", memberNoByRoomNo);
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("selectLeader", selectLeader);
		model.addAttribute("toDo", toDo);
		model.addAttribute("room_no", room_no);
		model.addAttribute("countToDo", countToDo);
		model.addAttribute("countNoToDo", countNoToDo);
		model.addAttribute("countYesToDo", countYesToDo);
		model.addAttribute("projectMember", projectMember);

		return "coperatetool/planPage";
	}

	// 일정 추가 페이지
	@RequestMapping("insertToDo.do")
	public String insertToDo(Model model, int room_no) {

		ArrayList<RelationShipVo> relationShipVo = memberService.selectRelationShip(room_no);
		ArrayList<MemberVo> projectMember = roomService.selectProjectMembers(room_no);
		
		
		model.addAttribute("relationShipVo", relationShipVo);
		model.addAttribute("projectMember", projectMember);
		model.addAttribute("room_no", room_no);

		return "coperatetool/insertToDo";
	}

	// 일정 추가 프로세스
	@RequestMapping("insertToDoProcess.do")
	public String insertToDoProcess(ToDoBoardVo vo, DoPersonVo dvo, int room_no, Model model) {

		
		ArrayList<MemberVo> projectMember = roomService.selectProjectMembers(room_no);
		model.addAttribute("projectMember", projectMember);
		
		roomService.insertToDo(vo, dvo);

		return "coperatetool/insertSuccess";
	}

	@RequestMapping("detailViewToDo.do")
	public String detailViewToDo(Model model, int room_no, HttpSession session, int tdboard_no) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		ProjectRoomVo selectLeader = memberService.selectLeader(room_no);
		MemberVo membername = memberService.memberName(tdboard_no);

		ToDoBoardVo todov = roomService.selectDetailToDo(room_no, tdboard_no);

		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("selectLeader", selectLeader);
		model.addAttribute("membername", membername);
		model.addAttribute("todov", todov);
		model.addAttribute("room_no", room_no);
		model.addAttribute("tdboard_no", tdboard_no);

		return "coperatetool/detailViewToDo";
	}

	// 리더 게시판 관리 페이지로 이동
	@RequestMapping("boardManagement.do")
	public String projectBoardManagement(ProjectBoardCategoryVo pbcVo, int room_no, Model model) {
		ArrayList<HashMap<String, Object>> selectApprove = roomService.selectApprove(room_no);

		ArrayList<HashMap<String, Object>> selectPBCategory = roomService.selectPBCategory(room_no);
		ArrayList<HashMap<String, Object>> selectChannel = roomService.selectChannel(room_no);

		int memberNoByRoomNo = roomService.getMemberNoByRoomNo(room_no);

		model.addAttribute("approve", selectApprove);
		model.addAttribute("room_no", room_no);

		model.addAttribute("selectChannel", selectChannel);
		model.addAttribute("pbcVo", pbcVo);
		model.addAttribute("pbcCategory", selectPBCategory);
		model.addAttribute("memberNoByRoomNo", memberNoByRoomNo);
		model.addAttribute("room_no", room_no);

		return "coperatetool/projectBoardManage";
	}

	// 협업툴 게시판 페이지 이동
	@RequestMapping("projectBoardPage.do")
	public String projectBoard(ProjectBoardCategoryVo pbcVo, int category_no, String ca_name, Model model,
			int room_no) {
		ArrayList<HashMap<String, Object>> selectProjectBoard = roomService.selectProjectBoard(category_no);
		int memberNoByRoomNo = roomService.getMemberNoByRoomNo(room_no);

		ArrayList<HashMap<String, Object>> selectPBCategory = roomService.selectPBCategory(room_no);
		ArrayList<HashMap<String, Object>> selectChannel = roomService.selectChannel(room_no);

		model.addAttribute("selectChannel", selectChannel);
		model.addAttribute("pbcCategory", selectPBCategory);
		model.addAttribute("selectProjectBoard", selectProjectBoard);
		model.addAttribute("category_no", category_no);
		model.addAttribute("ca_name", ca_name);
		model.addAttribute("pbcVo", pbcVo);
		model.addAttribute("room_no", room_no);
		model.addAttribute("memberNoByRoomNo", memberNoByRoomNo);

		return "coperatetool/projectBoard";
	}

	// 협업툴 게시판 생성 프로세스
	@RequestMapping("insertProjectBoardProcess.do")
	public String insertProjectBoard(ProjectBoardVo param, int room_no, String ca_name) {
		//파라미터 String 타입 UTF-8 변경해야 한글 안깨짐
	    try {
			ca_name = URLEncoder.encode(ca_name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		roomService.insertProjectBoard(param);
		
		return "redirect:./projectBoardPage.do?category_no=" + param.getCategory_no() + "&ca_name=" + ca_name + "&room_no=" + room_no;
	}

	// 협업툴 게시판 글 수정
	@RequestMapping("updateDetailBoardPage.do")
	public String updateDetailBoardPage(int board_no, Model model) {
		ProjectBoardVo readDetailBoard = roomService.readDetailBoard(board_no);
		int member_no = readDetailBoard.getMember_no();
		MemberVo memberName = roomService.getMemberNameByNo(member_no);
		model.addAttribute("DetailBoard", readDetailBoard);
		model.addAttribute("memberName", memberName);
		return "coperatetool/projectUpdateDetailBoard";
	}

	// 협업툴 게시판 글 수정 프로세스
	@RequestMapping("updateDetailBoardProcess.do")
	public String updateDetailBoardProcess(ProjectBoardVo param) {
		roomService.updateDetailBoard(param);
		return "redirect:./readDetailBoard.do?board_no=" + param.getBoard_no();
	}

	// 리뷰페이지 이동
	@RequestMapping("reviewPage.do")
	public String reviewPage(int room_no, Model model) {
		ArrayList<HashMap<String, Object>> reviewMemberSelect = roomService.reviewMemberSelect(room_no);
		model.addAttribute("reviewMember", reviewMemberSelect);
		return "coperatetool/projectMemberReviewPage";
	}

	// 팀원 평가결과 insert
	@RequestMapping("reviewRatingProcess.do")
	public String reviewRatingInsert(ReviewMemberVo param) {
		roomService.reviewRatingInsert(param);
		return "redirect:../index/teamProjectPage.do";
	}

	// 프로젝트 신청양식페이지
	@RequestMapping("ApplicationPage.do")
	public String ApplicationPage(int room_no, int member_no, String title, Model model) {
		model.addAttribute("member_no", member_no);
		model.addAttribute("room_no", room_no);
		model.addAttribute("title", title);
		return "main/projectApplication";
	}

	// 프로젝트 신청프로세스
	@RequestMapping("ApplicationProcess.do")
	public String ApplicationProcess(ApproveVo param) {
		roomService.insertApprove(param);
		return "coperatetool/projectSuccess";
	}

	// 채팅방으로 이동
	@RequestMapping("chattingPage.do")
	public String chattingPage(ChannelVo param, Model model, HttpSession session, int room_no) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		ArrayList<HashMap<String, Object>> selectPBCategory = roomService.selectPBCategory(room_no);
		ArrayList<HashMap<String, Object>> selectChannel = roomService.selectChannel(room_no);

		int member_no = sessionUser.getMember_no();

		int memberNoByRoomNo = roomService.getMemberNoByRoomNo(room_no);

		model.addAttribute("selectChannel", selectChannel);
		model.addAttribute("pbcCategory", selectPBCategory);

		model.addAttribute("memberNoByRoomNo", memberNoByRoomNo);
		model.addAttribute("member_no", member_no);
		model.addAttribute("channel", param);
		model.addAttribute("room_no", room_no);

		return "coperatetool/projectChatting";
	}

//	//charts Page
	@RequestMapping("calendarPage.do")
	public String calendarPage(Model model, int room_no, HttpSession session) {
		ArrayList<HashMap<String, Object>> selectPBCategory = roomService.selectPBCategory(room_no);
		ArrayList<HashMap<String, Object>> selectChannel = roomService.selectChannel(room_no);

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		ProjectRoomVo selectLeader = memberService.selectLeader(room_no);
		ArrayList<HashMap<String, Object>> toDo = roomService.selectToDo(room_no);
		int memberNoByRoomNo = roomService.getMemberNoByRoomNo(room_no);

		int countToDo = roomService.countToDo(room_no);
		int countNoToDo = roomService.countNoToDo(room_no);
		int countYesToDo = roomService.countYesToDo(room_no);

		model.addAttribute("selectChannel", selectChannel);
		model.addAttribute("pbcCategory", selectPBCategory);

		model.addAttribute("toDo", toDo);
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("selectLeader", selectLeader);
		model.addAttribute("memberNoByRoomNo", memberNoByRoomNo);
		model.addAttribute("room_no", room_no);
		model.addAttribute("countToDo", countToDo);
		model.addAttribute("countNoToDo", countNoToDo);
		model.addAttribute("countYesToDo", countYesToDo);

		return "coperatetool/calendarPage";
	}
	
	@RequestMapping("finishProject.do")
	public String finishProject(ProjectRoomVo vo) {
		roomService.finishProject(vo);
		return "redirect:../index/home.do";
		
	}

	@RequestMapping("projectMyPage.do")
	public String projectMyPage(int room_no, HttpSession session, Model model, ProjectBoardCategoryVo pbcVo) {
		int memberNoByRoomNo = roomService.getMemberNoByRoomNo(room_no);
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		
		ArrayList<HashMap<String, Object>> selectPBCategory = roomService.selectPBCategory(room_no);
		ArrayList<HashMap<String, Object>> selectChannel = roomService.selectChannel(room_no);
		
		
		model.addAttribute("pbcVo", pbcVo);
		model.addAttribute("selectPBCategory", selectPBCategory);
		model.addAttribute("selectChannel", selectChannel);
		model.addAttribute("room_no", room_no);
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("memberNoByRoomNo", memberNoByRoomNo);
		return "coperatetool/projectMyPage";
		
	}
	
	
	
}
