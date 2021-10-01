package com.alpha.toy.main.controller;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alpha.toy.message.service.MessageServicelmpl;
import com.alpha.toy.room.service.RoomService;
import com.alpha.toy.shop.service.ShopServiceImpl;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.ProjectRoomVo;
import com.alpha.toy.vo.ToyProductVo;

@RequestMapping("/index/*")
@Controller
public class MainController {
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private MessageServicelmpl messageService;
	
	@Autowired
	private ShopServiceImpl shopService;
	
	@RequestMapping("index.do")
	public String indexPage() {
		
		return "index/index";
	}
	
	@RequestMapping("mainPage.do")
	public String mainPage(HttpSession session, Model model) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		model.addAttribute("sessionUser", sessionUser);
		return "main/mainPage";
	}
	
	@RequestMapping("home.do")
	public String home(HttpSession session, Model model,ToyProductVo vo, @RequestParam(defaultValue = "1") int page_num) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		String result = sessionUser.getMember_id();
		int readCount = messageService.getContentCount(result);
		int member_no = sessionUser.getMember_no();
		ArrayList<HashMap<String, Object>> projectRoomList = roomService.projectRoomList(session);
		ArrayList<HashMap<String, Object>> shoplist = shopService.getShopList(page_num);
		ArrayList<HashMap<String, Object>> productlist = shopService.getProductList2(vo);

		model.addAttribute("shoplist", shoplist);
		model.addAttribute("productlist", productlist);
		
		
		model.addAttribute("roomList", projectRoomList);
		model.addAttribute("readCount",readCount);
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("member_no", member_no);

		return "index/home";
	}
	
	@RequestMapping("teamProjectPage.do")
	public String teamProjectPage(Model model, HttpSession session) {
		ArrayList<HashMap<String, Object>> projectRoomList = roomService.projectRoomList(session);
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		
		int member_no = sessionUser.getMember_no();
		
		ArrayList<ProjectRoomVo> myPro = roomService.getMyProject(member_no);
		
		
		model.addAttribute("roomList", projectRoomList);
		model.addAttribute("myPro", myPro);
		model.addAttribute("member_no", member_no);
		
		
		
		
		return "main/teamProjectPage";
	}
	
	@RequestMapping("projectInformation.do")
	public String projectInformation() {
		
		return "main/projectInformation";
	}
	
	@RequestMapping("projectApplication.do")
	public String projectApplication() {
		
		return "main/projectApplication";
	}
	
	@RequestMapping("myPage.do")
	public String myPage() {
		
		return "main/myPage";
	}
	
}
