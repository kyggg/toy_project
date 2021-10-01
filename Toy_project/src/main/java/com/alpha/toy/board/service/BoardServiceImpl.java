package com.alpha.toy.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.toy.board.mapper.BoardSQLMapper;
import com.alpha.toy.member.mapper.MemberSQLMapper;
import com.alpha.toy.vo.BoardVo;
import com.alpha.toy.vo.BulletinBoardImageVo;
import com.alpha.toy.vo.BulletinBoardVo;
import com.alpha.toy.vo.CommentVo;
import com.alpha.toy.vo.CommentVofr;
import com.alpha.toy.vo.ImageVo;
import com.alpha.toy.vo.LikeVo;
import com.alpha.toy.vo.LikeVofr;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.SkillCategoryVo;
import com.alpha.toy.vo.TechCommentVo;
import com.alpha.toy.vo.TechImageVo;
import com.alpha.toy.vo.TechLikeVo;
import com.alpha.toy.vo.TechSkillVo;
import com.alpha.toy.vo.TechVo;


@Service
public class BoardServiceImpl {

	@Autowired
	private BoardSQLMapper boardSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	
	public ArrayList<SkillCategoryVo> getCategoryList(){
		return boardSQLMapper.getCategoryList();
	}
	
	
	public void techWriteContent(TechVo vo, int [] skill_category_no, ArrayList<TechImageVo> techImageVoList) {
		
		int tech_no = boardSQLMapper.createTechPK();
		vo.setTech_no(tech_no);
		
		boardSQLMapper.techWriteContent(vo);
		
		for(TechImageVo techImageVo : techImageVoList) {
			
			techImageVo.setTech_no(tech_no);
			boardSQLMapper.registerImage(techImageVo);
		}
		
		if(skill_category_no == null) {
			return;
		}
		
		for(int skill : skill_category_no) {
			TechSkillVo skillVo = new TechSkillVo();
			skillVo.setSkill_category_no(skill);
			skillVo.setTech_no(tech_no);
			
			boardSQLMapper.registerSkill(skillVo);
		}
	}
	
	public ArrayList<HashMap<String, Object>> getContentList(String search_type, String search_word, int page_num, TechSkillVo vo) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		// SELECT 쿼리 실행하여 리스트 가져와서 배열에 저장
		ArrayList<TechVo> boardlist = boardSQLMapper.getContentList(search_type, search_word, page_num);

		// 반복문을 통해서 board에 있는 member_no를 가져와서 그 member_no를 통해서 memberVo 가져옴
		for (TechVo techVo : boardlist) {

			int memberNo = techVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(memberNo);
			
			int tech_no = techVo.getTech_no();

			SkillCategoryVo skillName = boardSQLMapper.getSkillName(tech_no);
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("skillName", skillName);
			map.put("memberVo", memberVo);
			map.put("techVo", techVo);

			//new가 어떻게 나오게 할 것인가?
			
			
			long writeTime = techVo.getTech_date().getTime();
			
			long currentTime = System.currentTimeMillis();
			
			long compareTime = currentTime - (1000*60*60*3);
	
			if(compareTime < writeTime) {
				map.put("newTime", "t");
			}
			
			
			
			list.add(map);
		}
		return list;
	}
	
	// 총 게시글 수
	public int getContentCount(String search_type, String search_word, int page_num) {
		int count = boardSQLMapper.getContentCount(search_type, search_word, page_num);
		return count;
	}
	
	// 게시글 내용 보기
	public HashMap<String, Object> getContent(int tech_no, TechLikeVo vo) {
		
		TechVo techVo = boardSQLMapper.getContentByNo(tech_no);
		
		//html escape
		String content = techVo.getTech_content();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll("\n", "<br>");
		techVo.setTech_content(content);
		
		// 게시글 내용 보기
		int member_no = techVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);

		ArrayList<TechImageVo> techImageVoList = 
				boardSQLMapper.getImageInfoByTechNo(tech_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		//좋아요
		TechLikeVo like = boardSQLMapper.getLike(vo);
		int likecount = boardSQLMapper.countLike(tech_no);
		
		map.put("memberVo", memberVo);
		map.put("techVo", techVo);
		map.put("techImageVoList", techImageVoList);
		map.put("like", like);
		map.put("likecount", likecount);
		
		return map;
	}

	// 게시글 삭제
	public void deleteContent(int tech_no) {
		boardSQLMapper.deleteContent(tech_no);
	}

	// 게시글 수정
	public void updateContent(TechVo vo) {
		boardSQLMapper.updateContent(vo);
	}

	// 조회수
	public int countContent() {
		int countContent = boardSQLMapper.countContent();
		return countContent;
	}

	// 조회수 증가
	public void increaseReadCount(int tech_no) {
		boardSQLMapper.increaseReadCount(tech_no);
	}

	// 댓글 쓰기
	public void writeComment(TechCommentVo vo) {
		boardSQLMapper.writeComment(vo);
	}

	// 댓글 목록 보기
	public ArrayList<HashMap<String, Object>> getComment(TechCommentVo vo) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		ArrayList<TechCommentVo> commentlist = boardSQLMapper.getCommentList(vo);

		for (TechCommentVo techCommentVo : commentlist) {

			int member_no = techCommentVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			HashMap<String, Object> map = new HashMap<>();
			map.put("memberVo", memberVo);
			map.put("techCommentVo", techCommentVo);

			list.add(map);
		}
		return list;
	}

	public void setLike(TechLikeVo param) {
		boardSQLMapper.setLike(param);
	}
	
	public void deleteLike(TechLikeVo param) {
		boardSQLMapper.deleteLike(param);
	}
	
	/////////////////////////QnA 게시판///////////////////////////
	
	public void writeContentQa(BoardVo vo) {
		boardSQLMapper.writeContentQa(vo);
	}

	public ArrayList<HashMap<String, Object>> getContentListQa() {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<BoardVo> boardlist = boardSQLMapper.getContentListQa();

		for (BoardVo boardVo : boardlist) {

			int memberNo = boardVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(memberNo);

			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("memberVo", memberVo);
			map.put("boardVo", boardVo);

			// new가 어떻게 나오게 할 것인가?

			long writeTime = boardVo.getBoard_writedate().getTime();

			long currentTime = System.currentTimeMillis();

			long compareTime = currentTime - (1000 * 60 * 60 * 3);

			if (compareTime < writeTime) {
				map.put("newTime", "t");
			}

			list.add(map);
		}
		return list;
	}

	//게시글 내용 보기
	public HashMap<String, Object> getContentQa(int board_no) {

		BoardVo boardVo = boardSQLMapper.getContentByNoQa(board_no);
		int member_no = boardVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("memberVo", memberVo);
		map.put("boardVo", boardVo);

		return map;

	}

	public HashMap<String, Object> readContentQa(int board_no, LikeVo param) {

		LikeVo like = boardSQLMapper.getLikeQa(param);

		int countLike = boardSQLMapper.countLikeQa(board_no);
		//if
		boardSQLMapper.increaseReadCountQa(board_no);

		BoardVo boardVo = boardSQLMapper.getBoardNoQa(board_no);

		int member_no = boardVo.getMember_no();

		MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);

		ArrayList<ImageVo> imageVoList = boardSQLMapper.getImageQa(board_no);

		HashMap<String, Object> map = new HashMap<>();
		map.put("boardVo", boardVo);
		map.put("memberVo", memberVo);
		map.put("imageVoList", imageVoList);
		map.put("countLike", countLike);
		map.put("like", like);

		return map;
	}

	// 댓글 SELECT
	public ArrayList<HashMap<String, Object>> getCommentQa(CommentVo param) {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<CommentVo> commentList = boardSQLMapper.getCommentQa(param);

		for (CommentVo commentVo : commentList) {
			int member_no = commentVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			HashMap<String, Object> map = new HashMap<>();
			map.put("commentVo", commentVo);
			map.put("memberVo", memberVo);

			list.add(map);
		}

		return list;

	}

	// 게시글 삭제
	public void deleteContentQa(BoardVo param) {
		boardSQLMapper.deleteContentQa(param);
	}

	// 댓글 삭제
	
	//댓글쓰기
	public void drawCommentQa(CommentVo param) {
		boardSQLMapper.drawCommentQa(param);
	}

	public int countContentQa() {
		int countContent = boardSQLMapper.countContent();
		return countContent;
	}

	public void setLikeQa(LikeVo param) {
		boardSQLMapper.setLikeQa(param);
	}

	public void deleteLikeQa(LikeVo param) {
		boardSQLMapper.deleteLikeQa(param);
	}

	public void modifyContentProcessQa(BoardVo param) {
		boardSQLMapper.modifyContentQa(param);
	}

	

	public void deleteLikeAllQa(BoardVo param) {
		boardSQLMapper.deleteLikeAllQa(param);
	}
	
	public void deleteCommentAllQa(BoardVo param) {
		boardSQLMapper.deleteCommentAllQa(param);
	}
	
	/////////////////타미////////
	
	
	//------------------ LOGIN ----------------------	
		public MemberVo login (MemberVo param) {
			MemberVo result = memberSQLMapper.compareIdAndPw(param);
			
			return result;
		}
		
		
	//----------Board Write Process ------------

		public void writeContentfr(BulletinBoardVo param, ArrayList<BulletinBoardImageVo> bulletinBoardImageVoList) {
			
			int board_no = boardSQLMapper.createBulletinBoardPK();
			
			param.setBoard_no(board_no);		
			boardSQLMapper.writeContentfr(param);
			
			for(BulletinBoardImageVo bulletinBoardImageVo : bulletinBoardImageVoList) {
				
				bulletinBoardImageVo.setBoard_no(board_no);
				boardSQLMapper.registerBoardImage(bulletinBoardImageVo);
			}
		}
		
		public ArrayList<HashMap<String, Object>> getContentsfr(String search_word, int page_num){
			
			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
			
			
			ArrayList<BulletinBoardVo> boardList = boardSQLMapper.getContentsfr(search_word, page_num);
			
			for(BulletinBoardVo bulletinBoardVo : boardList) {
				
				int memberNo = bulletinBoardVo.getMember_no();
				MemberVo memberVo = memberSQLMapper.getMemberByNo(memberNo);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				map.put("memberVo", memberVo);
				map.put("bulletinBoardVo", bulletinBoardVo);
				
				//new가 어떻게 나오게 할 것인가?
		         
		         
		         long writeTime = bulletinBoardVo.getBoard_writedate().getTime();
		         
		         long currentTime = System.currentTimeMillis();
		         
		         long compareTime = currentTime - (1000*60*60*3);
		   
		         if(compareTime < writeTime) {
		            map.put("newTime", "t");
		         }
				
				list.add(map);
			}
			
			return list;
		}
		
		public int getContentCountfr(String search_word, int page_num) {
			int count = boardSQLMapper.getContentCountfr(search_word, page_num);
			return count;
		}
		
	//----------------------- readContentPage --------------------
		public HashMap<String, Object> getContentfr(int board_no, LikeVofr vo) {
											
			// -----------Read Content -----------
			BulletinBoardVo bulletinBoardVo = boardSQLMapper.getContentByNofr(board_no);		
			int member_no = bulletinBoardVo.getMember_no();		
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			
			ArrayList<BulletinBoardImageVo> boardImageVoList =
					boardSQLMapper.getImageDetailByBoardNo(board_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();	
			
			//-----------Like 좋아요 --------------
			LikeVofr like = boardSQLMapper.getLikefr(vo);
			int likecount = boardSQLMapper.countLikefr(board_no);
			
			map.put("memberVo", memberVo);
			map.put("bulletinBoardVo", bulletinBoardVo);
			map.put("boardImageVoList", boardImageVoList);
			map.put("like", like);
			map.put("likecount", likecount);
			
			
			return map;
		}

	// ------------------ Increase # Views ----------------	
		public void increaseReadCountfr(int board_no) {
			boardSQLMapper.increaseReadCountfr(board_no);
		}
		
	// ---------------- Delete Content -------------------
		public void deleteContentfr(int board_no) {
			boardSQLMapper.deleteContentfr(board_no);		
		}
		
	// ---------------- Update Content ------------
		public void updateContentfr(BulletinBoardVo vo) {
			boardSQLMapper.updateContentfr(vo);
		}
		
	//---------------Write Comment 댓글 쓰기 --------------
		public void writeCommentfr(CommentVofr vo) {
			boardSQLMapper.writeCommentfr(vo);
		}
		
	//-------------- View Comment 댓글 목록 보기 ----------------	
		public ArrayList<HashMap<String, Object>> getCommentfr(CommentVofr vo) {
			
			ArrayList<HashMap<String, Object>> list = new ArrayList<>();
			ArrayList<CommentVofr> commentlist = boardSQLMapper.getCommentListfr(vo);
			
			for(CommentVofr commentVo : commentlist) {
				
				int member_no = commentVo.getMember_no();
				MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
				HashMap<String, Object> map = new HashMap<>();
				map.put("memberVo", memberVo);
				map.put("commentVo", commentVo);
				
				list.add(map);
			}
			
			return list;
		}
		
		public void setLikefr(LikeVofr param) {
			boardSQLMapper.setLikefr(param);
		}
		
		public void deleteLikefr(LikeVofr param) {
			boardSQLMapper.deleteLikefr(param);
		}
	
	
	
}
