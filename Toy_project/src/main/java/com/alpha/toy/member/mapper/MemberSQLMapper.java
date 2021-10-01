package com.alpha.toy.member.mapper;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.alpha.toy.vo.DoPersonVo;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.ProjectRoomVo;
import com.alpha.toy.vo.RelationShipVo;

public interface MemberSQLMapper {

	//회원가입
	public void signUpMember(MemberVo vo);
	
	//로그인
	public MemberVo compareIdAndPw(MemberVo vo);
	
	//그룹에 추가
	public void insertRsship(RelationShipVo vo);
	
	public void deleteRelationShip(
			@Param("member_no") int member_no,
			@Param("room_no") int room_no);
		
	//그룹 현재인원 select
	public int selectPeople(int room_no);

	public ArrayList<RelationShipVo> selectRelationShip(int room_no);
	
	public DoPersonVo selectToDoMember(int tdboard_no);
	
	public ProjectRoomVo selectLeader(int room_no);
	
	public MemberVo selectToDoName(int tdboard_no);
	
	//번호로 이름 가져오기
	public MemberVo getMemberNameByNo(int member_no);
		
	//아이디 중복체크
	public int verificationId(String member_id);
	
	public RelationShipVo doNotDuplicateParticipation(RelationShipVo vo);
	
	//게시판 목록보기
	public MemberVo getMemberByNo(int member_no);
	
	//ID 확인
	   public int checkId(String member_id);
	   
	   //비밀번호 확인
	   public int checkPassword(String member_pw);
	
	 //회원탈퇴시 정보 삭제
	   public void deleteMember(int member_no);
	   
	   public void deleteProjectRoom(int member_no);
	   
	   public void deleteRelationshipMember(int member_no);
	   
	   public void deleteDoPerson(int member_no);
	   
	   public void deleteApprove(int member_no);
	   //
	   
	   //비밀번호 재설정
	   public void updateMemberPW(
	         @Param("member_pw") String member_pw,
	         @Param("member_no") int member_no);
	   
	   
}
