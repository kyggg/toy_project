package com.alpha.toy.room.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.toy.member.mapper.MemberSQLMapper;
import com.alpha.toy.room.mapper.RoomSQLMapper;
import com.alpha.toy.vo.ApproveVo;
import com.alpha.toy.vo.ChannelVo;
import com.alpha.toy.vo.ChattingVo;
import com.alpha.toy.vo.DoPersonVo;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.ProjectBoardCategoryVo;
import com.alpha.toy.vo.ProjectBoardVo;
import com.alpha.toy.vo.ProjectRoomVo;
import com.alpha.toy.vo.RelationShipVo;
import com.alpha.toy.vo.ReviewMemberVo;
import com.alpha.toy.vo.StackCategoryVo;
import com.alpha.toy.vo.StackListVo;
import com.alpha.toy.vo.ToDoBoardVo;

@Service
public class RoomService {

	@Autowired
	private RoomSQLMapper roomSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	public ArrayList<StackCategoryVo> getStackList() {

		return roomSQLMapper.getStackList();
	}

	// 프로젝트 룸 생성
	public void createProjectRoom(ProjectRoomVo param, int[] stack_category_no, RelationShipVo param2) {
		int RoomNoPK = roomSQLMapper.createRoomNoPK();
		param.setRoom_no(RoomNoPK);

		if (stack_category_no == null) {
			return;
		}

		for (int stackList : stack_category_no) {
			StackListVo stackListVo = new StackListVo();
			stackListVo.setStack_category_no(stackList);
			stackListVo.setRoom_no(param.getRoom_no());
			roomSQLMapper.createStackList(stackListVo);
		}

		roomSQLMapper.createProjectRoom(param);
		param2.setRoom_no(RoomNoPK);
		memberSQLMapper.insertRsship(param2);
	}
	///////////////////////////////

	// 프로젝트룸 메인페이지에 나타내기
	public ArrayList<HashMap<String, Object>> projectRoomList(HttpSession session) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();

		ArrayList<ProjectRoomVo> roomList = roomSQLMapper.selectProjectRoom();

		for (ProjectRoomVo roomVo : roomList) {
			MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
			int member_no = sessionUser.getMember_no();
			int room_no = roomVo.getRoom_no();
			RelationShipVo rvo = new RelationShipVo();
			rvo.setMember_no(member_no);
			rvo.setRoom_no(room_no);
			RelationShipVo doNotParticipation = memberSQLMapper.doNotDuplicateParticipation(rvo);
			ApproveVo avo = new ApproveVo();
			avo.setRoom_no(room_no);
			avo.setMember_no(member_no);
			ApproveVo resultApprove = roomSQLMapper.resultApprove(avo);
			ArrayList<StackCategoryVo> loadStack = roomSQLMapper.loadStack(room_no);
			int selectPeople = memberSQLMapper.selectPeople(room_no);

			HashMap<String, Object> map = new HashMap<>();
			map.put("roomVo", roomVo);
			map.put("loadStack", loadStack);
			map.put("people", selectPeople);
			map.put("doNotParticipation", doNotParticipation);
			map.put("resultApprove", resultApprove);
			list.add(map);
		}

		return list;
	}

	// 프로젝트에 참여하는 로직
	public void EnterProject(RelationShipVo param) {
		memberSQLMapper.insertRsship(param);
	}

	// 프로젝트 중복참여 검사
	public RelationShipVo doNotDuplicateParticipation(RelationShipVo param) {
		return memberSQLMapper.doNotDuplicateParticipation(param);
	}

	// ToDo insert
	public void insertToDo(ToDoBoardVo vo, DoPersonVo dvo) {

		int tdboard_no = roomSQLMapper.createTdboardNoPk();
		vo.setTdboard_no(tdboard_no);
		dvo.setTdboard_no(tdboard_no);

		roomSQLMapper.insertToDo(vo);
		roomSQLMapper.insertDoPerson(dvo);

	}

	public ToDoBoardVo selectDetailToDo(int room_no, int tdboard_no) {
		return roomSQLMapper.selectDetailToDo(room_no, tdboard_no);
	}

	// ToDo select
	public ArrayList<HashMap<String, Object>> selectToDo(int room_no) {

		ArrayList<HashMap<String, Object>> toDo = new ArrayList<HashMap<String, Object>>();

		ArrayList<ToDoBoardVo> toDoList = roomSQLMapper.selectToDo(room_no);

		for (ToDoBoardVo toDoVo : toDoList) {

			int tdboard_no = toDoVo.getTdboard_no();
			DoPersonVo ToDoPerson = memberSQLMapper.selectToDoMember(tdboard_no);
			MemberVo memberName = memberSQLMapper.selectToDoName(tdboard_no);
			
			
			HashMap<String, Object> map = new HashMap<>();

			map.put("memberName", memberName);
			map.put("ToDoPerson", ToDoPerson);
			map.put("toDoVo", toDoVo);
		
			toDo.add(map);
		}
		return toDo;
	}
	
	public ArrayList<ToDoBoardVo> incomToDo(int room_no){
		ArrayList<ToDoBoardVo> incompleteTodo = roomSQLMapper.incompleteTodo(room_no);
		
		return incompleteTodo;
	}
	
	public ArrayList<ToDoBoardVo> comToDo(int room_no){
		ArrayList<ToDoBoardVo> completeTodo =  roomSQLMapper.completeTodo(room_no);
		
		return completeTodo;
	}

	

	// ToDo Update
	public void clearToDo(int tdboard_no) {
		roomSQLMapper.clearToDo(tdboard_no);
	}

	public void deleteToDo(int tdboard_no) {
		roomSQLMapper.deleteToDo(tdboard_no);
	}

	// ToDo 통계
	public int countToDo(int room_no) {
		return roomSQLMapper.countToDo(room_no);
	}

	public int countNoToDo(int room_no) {
		return roomSQLMapper.countNoToDo(room_no);
	}

	public int countYesToDo(int room_no) {
		return roomSQLMapper.countYesToDo(room_no);
	}
	

	// 협업툴 내 게시판 카테고리 생성
	public void createPBCategory(ProjectBoardCategoryVo param) {
		roomSQLMapper.createPBCategory(param);
	}

	// 협업툴 내 채녈 생성
	public void createChannel(ChannelVo param) {
		roomSQLMapper.createChannel(param);
	}

	// 협업툴 내 게시판 카테고리 화면 나타내기 로직

	public ArrayList<HashMap<String, Object>> selectPBCategory(int room_no) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		ArrayList<ProjectBoardCategoryVo> selectPBCategory = roomSQLMapper.selectPBCategory(room_no);
		for (ProjectBoardCategoryVo categoryVo : selectPBCategory) {

			HashMap<String, Object> map = new HashMap<>();
			map.put("categoryVo", categoryVo);

			list.add(map);

		}

		return list;
	}

	// 협업툴 내 채널 화면에 출력하기
	public ArrayList<HashMap<String, Object>> selectChannel(int room_no) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();

		ArrayList<ChannelVo> selectChannel = roomSQLMapper.selectChannel(room_no);
		for (ChannelVo channelVo : selectChannel) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("channelVo", channelVo);
			list.add(map);
		}
		return list;
	}

	// 협업툴 채널 삭제
	public void deleteChannel(int channel_no) {
		roomSQLMapper.deleteChannel(channel_no);
	}

	// 게시판 관리 카테고리 삭제 프로세스
	public void deletePBCategory(int category_no) {
		roomSQLMapper.deletePBCategory(category_no);
	}

	// 게시판 글쓰기 프로세스
	public void insertProjectBoard(ProjectBoardVo param) {
		roomSQLMapper.insertProjectBoard(param);
	}

	// 게시판 글 화면에 출력하기
	public ArrayList<HashMap<String, Object>> selectProjectBoard(int category_no) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();

		ArrayList<ProjectBoardVo> selectProjectBoard = roomSQLMapper.selectProjectBoard(category_no);

		for (ProjectBoardVo projectBoardVo : selectProjectBoard) {
			HashMap<String, Object> map = new HashMap<>();
			int member_no = projectBoardVo.getMember_no();
			MemberVo memberNameByNo = memberSQLMapper.getMemberNameByNo(member_no);
			map.put("boardList", projectBoardVo);
			map.put("memberVo", memberNameByNo);
			list.add(map);
		}
		return list;

	}

	// 게시판 글 자세히 보기
	public ProjectBoardVo readDetailBoard(int board_no) {
		ProjectBoardVo readDetailBoard = roomSQLMapper.readDetailBoard(board_no);
		return readDetailBoard;
	}

	// 게시판 글에서 번호로 이름 가져오기
	public MemberVo getMemberNameByNo(int member_no) {
		MemberVo memberNameByNo = memberSQLMapper.getMemberNameByNo(member_no);
		return memberNameByNo;
	}

	// room_no로 member_no가져오기
	public int getMemberNoByRoomNo(int room_no) {
		int memberNoByRoomNo = roomSQLMapper.getMemberNoByRoomNo(room_no);
		return memberNoByRoomNo;
	}

	// 게시판 글 수정
	public void updateDetailBoard(ProjectBoardVo param) {
		roomSQLMapper.updateDetailBoard(param);
	}

	// 게시판 글 삭제
	public void deleteDetailBoard(int board_no) {
		roomSQLMapper.deleteDetailBoard(board_no);
	}

	// 팀원 평가를 위해 relationShip에 있는 팀원들 select
	public ArrayList<HashMap<String, Object>> reviewMemberSelect(int room_no) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		ArrayList<RelationShipVo> reviewMemberSelect = roomSQLMapper.reviewMemberSelect(room_no);
		for (RelationShipVo relationShipVo : reviewMemberSelect) {
			int member_no = relationShipVo.getMember_no();
			MemberVo memberNameByNo = memberSQLMapper.getMemberNameByNo(member_no);
			HashMap<String, Object> map = new HashMap<>();
			map.put("relationShipVo", relationShipVo);
			map.put("memberName", memberNameByNo);

			list.add(map);
		}
		return list;
	}

	// 팀원 평가 결과 insert
	public void reviewRatingInsert(ReviewMemberVo param) {
		roomSQLMapper.reviewRatingInsert(param);

	}

	// 프로젝트 신청심사 리스트 select
	public ArrayList<HashMap<String, Object>> selectApprove(int room_no) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		ArrayList<ApproveVo> selectApprove = roomSQLMapper.selectApprove(room_no);
		for (ApproveVo approveVo : selectApprove) {
			HashMap<String, Object> map = new HashMap<>();
			int member_no = approveVo.getMember_no();
			MemberVo memberName = memberSQLMapper.getMemberNameByNo(member_no);
			map.put("approveVo", approveVo);
			map.put("memberName", memberName);
			list.add(map);
		}

		return list;
	}

	// 프로젝트 신청시 정보 insert
	public void insertApprove(ApproveVo param) {
		roomSQLMapper.insertApprove(param);
	}

	// 프로젝트 신청심사 update
	public void updateApprove(ApproveVo param) {
		roomSQLMapper.updateApprove(param);

	}

	// 프로젝트 심사결과 거절이면 relationShip에서 삭제
	public void deleteRelationShip(int member_no, int room_no) {
		memberSQLMapper.deleteRelationShip(member_no, room_no);
	}

	// approve_no로 member_no 가져오기
	public ApproveVo getMemberByApproveNo(int approve_no) {
		return roomSQLMapper.getMemberByApproveNo(approve_no);
	}

	// 채팅 insert
	public void insertChatting(ChattingVo param) {
		roomSQLMapper.insertChatting(param);
	}

	// 채팅 select
	public ArrayList<HashMap<String, Object>> selectChatting(int channel_no, int chatting_no, HttpSession session) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");

		if (chatting_no == 0) {
			ArrayList<ChattingVo> selectChatting = roomSQLMapper.selectChatting(channel_no, chatting_no);
			for (ChattingVo chattingVo : selectChatting) {
				HashMap<String, Object> map = new HashMap<>();
				String member_name = sessionUser.getMember_name();
				int member_no = chattingVo.getMember_no();
				MemberVo memberName = memberSQLMapper.getMemberNameByNo(member_no);
				map.put("chattingVo", chattingVo);
				map.put("memberName", memberName);
				map.put("sessionMember_name", member_name);
				list.add(map);
			}
		} else {
			ArrayList<ChattingVo> selectChatting = roomSQLMapper.selectMyChatting(channel_no, chatting_no);
			for (ChattingVo chattingVo : selectChatting) {
				HashMap<String, Object> map = new HashMap<>();
				String member_name = sessionUser.getMember_name();
				int member_no = chattingVo.getMember_no();
				MemberVo memberName = memberSQLMapper.getMemberNameByNo(member_no);
				map.put("chattingVo", chattingVo);
				map.put("memberName", memberName);
				map.put("sessionMember_name", member_name);
				list.add(map);
			}
		}
		return list;
	}

	// MyProject select
	public ArrayList<ProjectRoomVo> getMyProject(int member_no) {
		return roomSQLMapper.getMyProject(member_no);
	}
	
	//프로젝트 완료 중단
	public void finishProject(ProjectRoomVo vo) {
		roomSQLMapper.finishProject(vo);
	}
	
	//프로젝트 멤버 셀렉
	public ArrayList<MemberVo> selectProjectMembers(int room_no){
		return roomSQLMapper.selectProjectMembers(room_no);
	}
	
	public int selectMyToDoYesCount(int member_no, int room_no) {
		
		return roomSQLMapper.selectMyToDoYesCount(member_no, room_no);
	}
	
	public int selectMyToDoNoCount(int member_no, int room_no) {
		
		return roomSQLMapper.selectMyToDoNoCount(member_no, room_no);
	}
	
	//프로젝트 룸별 멤버NO 가져오기
	public ArrayList<RelationShipVo> selectRelationMemberNo(int room_no){
		return roomSQLMapper.selectRelationMemberNo(room_no);
	}
	
	
	public int leaderNoProjectNo(int room_no) {
		return roomSQLMapper.leaderNoProjectNo(room_no);
	}
	
	
	
	

}
