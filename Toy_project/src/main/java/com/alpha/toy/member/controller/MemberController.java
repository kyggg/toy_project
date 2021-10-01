package com.alpha.toy.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpha.toy.member.service.MemberService;
import com.alpha.toy.vo.MemberVo;


@RequestMapping("/member/*")
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//웰컴페이지
	@RequestMapping("welcomePage.do")
	public String welcomePage(HttpSession session) {
		
		return"member/welcomePage";
	}
	
	
	//회원가입 프로세스
	@RequestMapping("signUpPage.do")
	public String signUpPage() {
		return"member/joinMemberPage";
	}
	
	@RequestMapping("signUpProcess.do")
	public String signUpProcess(MemberVo param) {
		memberService.signUpMember(param);
		
		return"redirect:./welcomePage.do";
	}
	
	//로그인 프로세스
	@RequestMapping("signInPage.do")
	public String signInPage(String member_id, Model model) {
		
		model.addAttribute("member_id",member_id);
		
		return"member/loginPage";
	}
	
	@RequestMapping("loginProcess.do")
	public String loginProcess(MemberVo param, HttpSession session) {
		
		MemberVo sessionUser = memberService.compareIdAndPw(param);
		
		
		//로그인 성공
		if(sessionUser != null) {
			session.setAttribute("sessionUser", sessionUser);
			return"redirect:../index/home.do";
		} else {
			//로그인 실패
			return"redirect:./signInPage.do";
		}
	}
	
	@RequestMapping("logoutProcess.do")
	public String logoutProcess(HttpSession session) {

		session.invalidate();

		return "redirect:../index/index.do";
	}
	
	
		//회원탈퇴
	   @RequestMapping("deleteUser.do")
	   public String deleteUser(int member_no) {
	      memberService.deleteUser(member_no);
	      return"redirect:../index/index.do";
	   }
	   
	   //비밀번호 재설정
	   public void updateMemberPW(String member_pw, int member_no) {
	      memberService.updateMemberPW(member_pw, member_no);
	   }
	   
}









