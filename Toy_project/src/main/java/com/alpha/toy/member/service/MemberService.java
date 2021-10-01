package com.alpha.toy.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.toy.commons.MessageDigestUtil;
import com.alpha.toy.member.mapper.MemberSQLMapper;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.ProjectRoomVo;
import com.alpha.toy.vo.RelationShipVo;

@Service
public class MemberService {

	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	public void signUpMember(MemberVo param) {
		
		// 비밀번호 해쉬값 획득 및 변경
		String hashCode = MessageDigestUtil.getPasswordHashCode(param.getMember_pw());
		param.setMember_pw(hashCode);
		
		memberSQLMapper.signUpMember(param);
	}
	
	
	public MemberVo compareIdAndPw(MemberVo param) {
		
		//비밀번호 암호화 비교
		String hashCode = MessageDigestUtil.getPasswordHashCode(param.getMember_pw());
		param.setMember_pw(hashCode);
		
		MemberVo memberVo = memberSQLMapper.compareIdAndPw(param);
		return memberVo;
	}
	
	public ArrayList<RelationShipVo> selectRelationShip(int room_no) {
		
		return memberSQLMapper.selectRelationShip(room_no);
	}
	
	public ProjectRoomVo selectLeader(int room_no) {
		return memberSQLMapper.selectLeader(room_no);
	}
	
	public MemberVo memberName(int tdboard_no){
		return memberSQLMapper.selectToDoName(tdboard_no);
	}
	
	public int verificationId(String member_id) {
		int verificationId = memberSQLMapper.verificationId(member_id);
		return verificationId;
	}
	
	//ID 확인
	   public int checkId(String member_id) {
	      return memberSQLMapper.checkId(member_id);
	   }
	   
	   //비밀번호 확인
	   public int checkPassword(String member_pw) {
	      String hashCodePassword = MessageDigestUtil.getPasswordHashCode(member_pw);
	      return memberSQLMapper.checkPassword(hashCodePassword);
	   }
	   
	   
	   
	 //회원탈퇴시 정보 삭제
	   public void deleteUser(int member_no) {
	      memberSQLMapper.deleteMember(member_no);
	      memberSQLMapper.deleteProjectRoom(member_no);
	      memberSQLMapper.deleteRelationshipMember(member_no);
	      memberSQLMapper.deleteDoPerson(member_no);
	      memberSQLMapper.deleteApprove(member_no);
	   }
	   
	   //비밀번호 재설정
	   public void updateMemberPW(String member_pw,int member_no) {
	      String passwordHashCode = MessageDigestUtil.getPasswordHashCode(member_pw);
	      memberSQLMapper.updateMemberPW(passwordHashCode, member_no);
	   }
	
	
	
}
