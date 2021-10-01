package com.alpha.toy.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.toy.board.service.BoardServiceImpl;
import com.alpha.toy.message.service.MessageServicelmpl;
import com.alpha.toy.vo.BoardVo;
import com.alpha.toy.vo.BulletinBoardImageVo;
import com.alpha.toy.vo.BulletinBoardVo;
import com.alpha.toy.vo.CommentVo;
import com.alpha.toy.vo.CommentVofr;
import com.alpha.toy.vo.LikeVo;
import com.alpha.toy.vo.LikeVofr;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.SkillCategoryVo;
import com.alpha.toy.vo.TechCommentVo;
import com.alpha.toy.vo.TechImageVo;
import com.alpha.toy.vo.TechLikeVo;
import com.alpha.toy.vo.TechSkillVo;
import com.alpha.toy.vo.TechVo;



@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardServiceImpl boardService;
	@Autowired
	private MessageServicelmpl messageService;
	
	@RequestMapping("Tech_Main.do")
	public String TechPage() {
		return "board/Tech_Main";
	}

	@RequestMapping("Tech_Html.do")
	public String TechHtml(
			Model model,
			TechSkillVo vo,
			HttpSession session,
			String search_type, 
			String search_word, 
			@RequestParam(defaultValue = "1") int page_num) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		ArrayList<HashMap<String, Object>> contentlist = 
				boardService.getContentList(search_type, search_word, page_num, vo);
		
		// 총 게시글 수
		int count = boardService.getContentCount(search_type, search_word, page_num);
		
		int totalPageCount = (int)Math.ceil(count/10.0);
		int currentPage = page_num;
		
		
		int beginPage = ((currentPage-1)/5)*5+1;
		int endPage = ((currentPage-1)/5 + 1)*(5);
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}

		String addParam ="";
		
		if(search_type != null && search_word != null) {
			addParam += "&search_type=" + search_type;
			addParam += "&search_word=" + search_word;
		}
		model.addAttribute("addParam", addParam);
		model.addAttribute("sessionUser", sessionUser);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPageCount", totalPageCount);

		model.addAttribute("contentlist", contentlist);
		// 조회수
		int countContent = boardService.countContent();

		model.addAttribute("countContent", countContent);
		
		String result = sessionUser.getMember_id();
		int readCount = messageService.getContentCount(result);
		
		model.addAttribute("readCount",readCount);
		model.addAttribute("sessionUser", sessionUser);
		
		
		
		
		

		return "board/Tech_Html";
	}

	@RequestMapping("Tech_Write.do")
	public String TechWrite(Model model,HttpSession session) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		ArrayList<SkillCategoryVo> list = boardService.getCategoryList();
		model.addAttribute("categoryList", list);
		model.addAttribute("sessionUser", sessionUser);
		
		String result = sessionUser.getMember_id();
		int readCount = messageService.getContentCount(result);
		
		model.addAttribute("readCount",readCount);
		model.addAttribute("sessionUser", sessionUser);
		
		return "board/Tech_Write";
	}

	@RequestMapping("Auction_Main.do")
	public String Auction_Main() {
		return "board/Auction_Main";
	}

	@RequestMapping("Auction_View.do")
	public String Auction_View() {
		return "board/Auction_View";
	}
	
	@RequestMapping("Auction_Write.do")
	public String Auction_Write() {
		return "board/Auction_Write";
	}
	
	@RequestMapping("techWriteContentProcess.do")
	public String techWriteContentProcess(Model model, TechVo param, int [] skill_category_no, MultipartFile [] tech_files, HttpSession session) {
		
		ArrayList<TechImageVo> techImageVoList =  new ArrayList<TechImageVo>();
		
		//파일 업로드
		for(MultipartFile techFile : tech_files) {
			// 예외처리 : 하나도 안날려도 왠지 모르게 한바퀴는 돈다.
			if(techFile.isEmpty()) {
				continue;
			}
			String rootFolderName = "/Users/sungsin/uploadFolder/";
			
			//랜덤 파일 네임 만들기 : 충돌방지 (시간 + 랜덤 활용)
			String originalFilename = techFile.getOriginalFilename();
			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));			
			String uuidName = UUID.randomUUID().toString();
			long currentTimeMillis = System.currentTimeMillis();			
			String randomFileName = uuidName + "_" + currentTimeMillis + ext;
			
			//오늘 날짜 폴더 만들기
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolderName = sdf.format(today);
			String uploadFolderName = rootFolderName + todayFolderName;
			
			File uploadFolder = new File(uploadFolderName);
			
			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}
			
			String saveFilePathName = uploadFolderName + "/" + randomFileName;
			
			try {
				techFile.transferTo(new File(saveFilePathName));
			}catch(Exception e) {
				e.printStackTrace(); 
			}
			
			//데이터 처리
			TechImageVo techImageVo = new TechImageVo();
			techImageVo.setImage_ori(originalFilename);
			techImageVo.setImage_url(todayFolderName + "/" + randomFileName);
			
			techImageVoList.add(techImageVo);
		}
		
		//데이터 처리
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);

		String result = sessionUser.getMember_id();
		int readCount = messageService.getContentCount(result);
		
		model.addAttribute("readCount",readCount);
		model.addAttribute("sessionUser", sessionUser);
		
		boardService.techWriteContent(param, skill_category_no, techImageVoList);

		return "redirect:../board/Tech_Html.do";
	}

	@RequestMapping("techReadContentPage.do")
	public String readContent(int tech_no, TechCommentVo vo, TechLikeVo param, Model model, HttpSession session) {
		// 세션에 들어있는 member_no를 LikeVo member_no에 값 넣어주기
		// 안 넣으면 0만 가져옴
		MemberVo like = (MemberVo) session.getAttribute("sessionUser");
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = like.getMember_no();
		param.setMember_no(member_no);
		
		// 조회수 증가
		boardService.increaseReadCount(tech_no);

		// 게시물 조회
		HashMap<String, Object> readContent = boardService.getContent(tech_no, param);
		model.addAttribute("content", readContent);

		// 댓글
		ArrayList<HashMap<String, Object>> commentlist = boardService.getComment(vo);
		model.addAttribute("commentlist", commentlist);
		model.addAttribute("sessionUser", sessionUser);
		

		String result = sessionUser.getMember_id();
		int readCount = messageService.getContentCount(result);
		
		model.addAttribute("readCount",readCount);

		return "board/Tech_ReadContent";
	}

	// 댓글 프로세스
	@RequestMapping("writeCommentProcess.do")
	public String writeCommentProcess(TechCommentVo param) {

		boardService.writeComment(param);

		return "redirect:../board/techReadContentPage.do?tech_no=" + param.getTech_no();
	}

	// 게시물 삭제
	@RequestMapping("deleteContentProcess.do")
	public String deleteContentProcess(int tech_no) {

		boardService.deleteContent(tech_no);

		return "redirect:../board/Tech_Html.do";
	}

	// 게시글 수정
	// 게시글 자세히 보기와 같게 만들어야함(내용을 만들어야되기때문)
	@RequestMapping("updateContentProcess.do")
	public String updateContentProcess(TechVo param) {

		boardService.updateContent(param);

		return "redirect:../board/techReadContentPage.do?tech_no=" + param.getTech_no();
	}

	@RequestMapping("Tech_Update.do")
	public String updateContentPage(int tech_no, Model model, TechLikeVo vo, HttpSession session) {

		HashMap<String, Object> map = boardService.getContent(tech_no, vo);
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("content", map);

		return "board/Tech_Update";
	}
	
	@RequestMapping("setLike.do")
	public String setLike(TechLikeVo param) {
		boardService.setLike(param);
		return"redirect:./techReadContentPage.do?tech_no="+ param.getTech_no();
	}
	
	@RequestMapping("deleteLike.do")
	public String deleteLike(TechLikeVo param) {
		boardService.deleteLike(param);
		return"redirect:./techReadContentPage.do?tech_no="+ param.getTech_no();
	}
	
	
	/////////////////////////////QnA 게시판///////////////////////////////////
	
	
	@RequestMapping("QnAList.do")
	public String QnAList(Model model, HttpSession session) {

		ArrayList<HashMap<String, Object>> contentList = boardService.getContentListQa();
		// hashmap 두 가지를 준 것이 객체가 2개이기 때문에 (memberVo(name을 사용해야 하기 때문에, boardVo), 한가지
		// 객체만을 사용하게 되면 그냥 boardVo만 사용해도 된다.
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("contentlist", contentList);
		

		String result = sessionUser.getMember_id();
		int readCount = messageService.getContentCount(result);
		
		model.addAttribute("readCount",readCount);

		return "board/QnAList";
	}

	@RequestMapping("QnAWrite.do")
	public String QnAWrite(HttpSession session, Model model) {
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		model.addAttribute("sessionUser", sessionUser);
		

		String result = sessionUser.getMember_id();
		int readCount = messageService.getContentCount(result);
		
		model.addAttribute("readCount",readCount);
		return "board/QnAWrite";
	}
	
	
	// 글 작성
	@RequestMapping("writeContentProcessQa.do")
	public String writeContentProcess(BoardVo param, HttpSession session) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");

		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);
		
		if (param.getBoard_no() == 0){//board_no가 없으면 게시글생성
			boardService.writeContentQa(param);
		}else {
			//게시글 수정
			boardService.modifyContentProcessQa(param);
		};

		return "redirect:../board/QnAList.do";
	}

	// 글 view
	@RequestMapping("readContentPageQa.do")
	public String readContent(int board_no, CommentVo param, Model model, LikeVo vo, HttpSession session) {
		MemberVo like = (MemberVo) session.getAttribute("sessionUser");
		int member_no = like.getMember_no();
		vo.setMember_no(member_no);
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		model.addAttribute("sessionUser", sessionUser);
			
		HashMap<String, Object> map = boardService.readContentQa(board_no, vo);
		model.addAttribute("content", map);
		// 댓글(Select)
		ArrayList<HashMap<String, Object>> commentList = boardService.getCommentQa(param);
		model.addAttribute("commentList", commentList);
		

		String result = sessionUser.getMember_id();
		int readCount = messageService.getContentCount(result);
		
		model.addAttribute("readCount",readCount);

		return "board/QnAView";
	}
	
	// 게시글 수정
	@RequestMapping("modifyContentPageQa.do")
	public String modifyContentPage(int board_no, Model model, LikeVo vo,HttpSession session) {
		HashMap<String, Object> readContent = boardService.readContentQa(board_no, vo);
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		model.addAttribute("sessionUser", sessionUser);
		model.addAttribute("readContent", readContent);
		

		String result = sessionUser.getMember_id();
		int readCount = messageService.getContentCount(result);
		
		model.addAttribute("readCount",readCount);

		return "board/QnAWrite";
	}
	

	@RequestMapping("modifyContentProcessQa.do")
	public String modifyContentProcess(BoardVo param) {

		boardService.modifyContentProcessQa(param);

		return "redirect:../board/QnAView.do?board_no=" + param.getBoard_no();
	}

	
	@RequestMapping("drawCommentProcessQa.do")
	public String drawComment(CommentVo param) {
		
		boardService.drawCommentQa(param);
		
		return "redirect:./readContentPageQa.do?board_no=" + param.getBoard_no();
	}

	@RequestMapping("deleteContentProcessQa.do")
	public String deleteContent(BoardVo param) {
		
		//좋아요삭제
		boardService.deleteLikeAllQa(param);
		//댓글삭제
		boardService.deleteCommentAllQa(param);
		//게시물삭제
		boardService.deleteContentQa(param);

		return "redirect:./QnAList.do";
	}

	@RequestMapping("setLikeQa.do")
	public String setLike(int member_no, int board_no) {
		LikeVo param = new LikeVo();
		param.setMember_no(member_no);
		param.setBoard_no(board_no);
		
		boardService.setLikeQa(param);
		
		return "redirect:./readContentPageQa.do?board_no=" + board_no;
	}

	@RequestMapping("deleteLikeQa.do")
	public String deleteLike(int like_no, int board_no) {
		LikeVo param = new LikeVo();
		param.setLike_no(like_no);
		param.setBoard_no(board_no);
		
		boardService.deleteLikeQa(param);
		
		return "redirect:./readContentPageQa.do?board_no=" + board_no;
	}
	
	/////////////////타미////////////
	@RequestMapping("bulletinBoard_mainfr.do")
	public String bulletinBoard_main (
			Model model, 
			String search_word, 
			@RequestParam(defaultValue = "1") int page_num) {
		
		ArrayList<HashMap<String, Object>> contentList = 
				boardService.getContentsfr(search_word, page_num);  //Vid4 -> 1:39:00
		
		int count = boardService.getContentCountfr(search_word, page_num);
		
		int totalPageCount = (int) Math.ceil(count/10.0);		
		int currentPage = page_num;
		
		int beginPage = ((currentPage-1)/5)*5 +1;
		int endPage = ((currentPage-1)/5 + 1)*(5);		
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);		
		model.addAttribute("totalPageCount", totalPageCount);
		
		model.addAttribute("contentList", contentList);
		
		return "board/bulletinBoard_mainfr";
	}
	

		
	//------------------------- BulletinBoard (Content) WRITE --------------------------------
	@RequestMapping("board_writefr.do")
	public String board_writefr() {
		
		return "board/board_writefr";
	}
	
	
	@RequestMapping("writeProcessfr.do")
	public String writeProcessfr(BulletinBoardVo param, MultipartFile [] bulletinboard_files, HttpSession session) {
		
		ArrayList<BulletinBoardImageVo> bulletinBoardImageVoList = new ArrayList<BulletinBoardImageVo>();
		
		//File Upload
		for(MultipartFile bboardFile : bulletinboard_files) {
			
			if(bboardFile.isEmpty()) {
				continue;
			}
			
			String rootFolderName = "/Users/sungsin/uploadFolder/";
			
			String originalFileName = bboardFile.getOriginalFilename();			
			String eg = originalFileName.substring(originalFileName.indexOf("."));			
			String uuid = UUID.randomUUID().toString();			
			long currentTimeMil = System.currentTimeMillis();			
			String randomFileName = uuid + "_" + currentTimeMil + eg;
			
			//오늘 날짜 폴더 만들기
			Date todayDate = new Date();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolderName = simpleDateFormat.format(todayDate);			
			String uploadFolderName = rootFolderName + todayFolderName;
			
			File uploadFolder = new File(uploadFolderName);
			
			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}
			
			String saveFileName = uploadFolderName + "/" + randomFileName;
			
			try {				
				bboardFile.transferTo(new File(saveFileName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			BulletinBoardImageVo bulletingBoardImageVo = new BulletinBoardImageVo();
			bulletingBoardImageVo.setImage_ori(originalFileName);
			bulletingBoardImageVo.setImage_url(todayFolderName + "/" + randomFileName); 
			
			bulletinBoardImageVoList.add(bulletingBoardImageVo);
		}
		
		//아래 Data 처리
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		
		int member_no = sessionUser.getMember_no();
		
		param.setMember_no(member_no);
		
		boardService.writeContentfr(param, bulletinBoardImageVoList);
		
		
		return "redirect:./bulletinBoard_mainfr.do";
	}
	
	//------------------- readContentPage ----------------------
	@RequestMapping("readContentPagefr.do")
	public String readContentPagefr(int board_no, Model model, CommentVofr vo, LikeVofr param, HttpSession session) {
		
		// -------- Like 좋아요 Usable only when Logged In ---------------
		MemberVo like = (MemberVo) session.getAttribute("sessionUser");
		int member_no = like.getMember_no();
		param.setMember_no(member_no);
						
		//----Increase # Views / 죄회수 증가 -----
		boardService.increaseReadCountfr(board_no);
		
		// -------- 게시물 조회 ---------		
		HashMap<String, Object> map = boardService.getContentfr(board_no, param);		
		model.addAttribute("content", map);
		
		
		//---------Comment 댓글--------
		ArrayList<HashMap<String, Object>> commentlist = boardService.getCommentfr(vo);
		model.addAttribute("commentlist", commentlist);
		
		return "board/readContentPagefr";
	}
	
	//------------Write Comment Process --------------------
	
	@RequestMapping("writeCommentProcessfr.do")
	public String writeCommentProcessfr(CommentVofr param) {
		
		boardService.writeCommentfr(param);
		
		return "redirect:../board/readContentPagefr.do?board_no=" + param.getBoard_no();
	}
	
	
	// -------------- Delete Content PROCESS-----------
	@RequestMapping("deleteContentProcessfr.do")
	public String deleteContentProcessfr(int board_no) {
		
		boardService.deleteContentfr(board_no);
		
		return "redirect:../board/bulletinBoard_mainfr.do";
		
	}
	

	//----------------- Update Content PAGE ----------------
	@RequestMapping("updateContentPagefr.do")
	public String updateContentPagefr(int board_no, Model model, LikeVofr vo) {
		
		HashMap<String, Object> map = boardService.getContentfr(board_no, vo);
		
		model.addAttribute("content", map);
		
		return "board/updateContentPagefr";
	}
	
	//----------------Update Content PROCESS ---------------
	@RequestMapping("updateContentProcessfr.do")
	public String updateContentProcessfr(BulletinBoardVo param) {
		
		boardService.updateContentfr(param);
		
		return "redirect:./readContentPagefr.do?board_no=" + param.getBoard_no();
	}
	
	//------------------- Set Like ----------------------------
	@RequestMapping("setLikefr.do")
	public String setLikefr(LikeVofr param) {
		
		boardService.setLikefr(param);
		
		return "redirect:./readContentPagefr.do?board_no="+param.getBoard_no();
	}
	
	//-------------------- Delete Like -----------------------
	@RequestMapping("deleteLikefr.do")
	public String deleteLikefr(LikeVofr param) {
		
		boardService.deleteLikefr(param);
		
		return "redirect:./readContentPagefr.do?board_no="+param.getBoard_no();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
