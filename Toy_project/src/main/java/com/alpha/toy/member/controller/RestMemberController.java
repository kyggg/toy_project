package com.alpha.toy.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alpha.toy.member.service.MemberService;
import com.alpha.toy.vo.MemberVo;

@RequestMapping("/member/*")
@RestController
public class RestMemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("verificationId.do")
	public HashMap<String, Object> verificationId(String member_id) {
		
		HashMap<String, Object> map = new HashMap<>();
		int verificationId = memberService.verificationId(member_id);
		map.put("verificationId", verificationId);
		
		return map;
	}
	
	@RequestMapping("checkSessionUser.do")
	public HashMap<String, Object> checkSessionUser(HttpSession session){
		HashMap<String, Object> map = new HashMap<>();
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		
		if(sessionUser != null) {
			map.put("LoginStatus", true);
			map.put("member_no", sessionUser.getMember_no());
		}else {
			map.put("LoginStatus", false);
		}
		
		return map;
	}

	
	//로그인 시 ID 확인
	   @RequestMapping("checkId.do")
	   public HashMap<String, Object> checkId(String member_id){
	      HashMap<String, Object> map = new HashMap<>();
	      int checkId = memberService.checkId(member_id);
	      map.put("checkId", checkId);
	      return map;
	   }
	   
	   //로그인 시 비밀번호 확인
	   @RequestMapping("checkPassword.do")
	   public HashMap<String, Object> checkPassword(String member_pw){
	      HashMap<String, Object> map = new HashMap<>();
	      int checkPassword = memberService.checkPassword(member_pw);
	      map.put("checkPassword", checkPassword);
	      return map;
	   }
	
	
	
	
	
	
	
	
	
}
