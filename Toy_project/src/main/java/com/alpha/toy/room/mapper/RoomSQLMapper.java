package com.alpha.toy.room.mapper;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;

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

public interface RoomSQLMapper {

	public ArrayList<StackCategoryVo> getStackList();

	public void createProjectRoom(ProjectRoomVo vo);

	public void createStackList(StackListVo vo);

	public ArrayList<ProjectRoomVo> selectProjectRoom();

	public int createRoomNoPK();

	public ArrayList<StackCategoryVo> loadStack(int room_no);

	public void insertToDo(ToDoBoardVo vo);

	public void insertDoPerson(DoPersonVo vo);

	public ArrayList<ToDoBoardVo> selectToDo(int room_no);

	public ArrayList<ToDoBoardVo> completeTodo(int room_no);

	public ArrayList<ToDoBoardVo> incompleteTodo(int room_no);
	
	public ArrayList<ToDoBoardVo> selectMyToDo(@Param("member_no")int member_no ,@Param("room_no")int room_no);
	
	public int selectMyToDoYesCount(@Param("member_no")int member_no ,@Param("room_no")int room_no);
	
	public int selectMyToDoNoCount(@Param("member_no")int member_no ,@Param("room_no")int room_no);
	
	public ToDoBoardVo selectDetailToDo(@Param("room_no")int room_no, @Param("tdboard_no") int tdboard_no);
	
	//통계
	public int countToDo(int room_no);
	public int countNoToDo(int room_no);
	public int countYesToDo(int room_no);
	//통계 끝
	
	//프로젝트 멤버 셀렉
	public ArrayList<MemberVo> selectProjectMembers(int room_no);
	
	public int createTdboardNoPk();
	
	public void clearToDo(int tdboard_no);
	
	public void deleteToDo(int tdboard_no);
	
	public void createPBCategory(ProjectBoardCategoryVo vo);
	
	public ArrayList<ProjectBoardCategoryVo> selectPBCategory(int room_no);
	
	public void deletePBCategory(int category_no);
	
	public void insertProjectBoard(ProjectBoardVo vo);
	
	public ArrayList<ProjectBoardVo> selectProjectBoard(int category_no);
	
	public ProjectBoardVo readDetailBoard(int board_no);
	
	public int getMemberNoByRoomNo(int room_no);
	
	public void updateDetailBoard(ProjectBoardVo vo);
	
	public void deleteDetailBoard(int board_no);
	
	
	public ArrayList<RelationShipVo> reviewMemberSelect(int room_no);
	
	public void reviewRatingInsert(ReviewMemberVo vo);
	
	public void insertApprove(ApproveVo vo);
	
	public ArrayList<ApproveVo> selectApprove(int room_no);
	
	public ApproveVo resultApprove(ApproveVo vo);
	
	public void updateApprove(ApproveVo vo);
	
	public void createChannel(ChannelVo vo);
	
	public ArrayList<ChannelVo> selectChannel(int room_no);
	
	public void deleteChannel(int channel_no);
	
	public ApproveVo getMemberByApproveNo(int approve_no);
	

	public void insertChatting(ChattingVo vo);
	
	public ArrayList<ChattingVo> selectChatting(
			@Param("channel_no") int channel_no,
			@Param("chatting_no") int chatting_no);
	
	public ArrayList<ChattingVo> selectMyChatting(
			@Param("channel_no") int channel_no,
			@Param("chatting_no") int chatting_no);
	
	public ArrayList<ProjectRoomVo> getMyProject(int member_no);

	public void finishProject(ProjectRoomVo vo);
	
	public ArrayList<RelationShipVo> selectRelationMemberNo(int room_no);
	
	public int leaderNoProjectNo(int room_no);
	
}
