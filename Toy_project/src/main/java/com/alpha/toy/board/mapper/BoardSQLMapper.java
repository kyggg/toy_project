package com.alpha.toy.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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

public interface BoardSQLMapper {
	
	//이미지 프라이머리키
	public int createTechPK();

	// 글쓰기
	public void techWriteContent(TechVo vo);

	// 게시글 목록
	public ArrayList<TechVo> getContentList(
			@Param("search_type") String search_type, 
			@Param("search_word") String search_word,
			@Param("page_num") int page_num
			);
	
	//총 게시물 수
	public int getContentCount(
			@Param("search_type") String search_type, 
			@Param("search_word") String search_word,
			@Param("page_num") int page_num
			);
	// 게시글 보기
	public TechVo getContentByNo(int tech_no);

	// 게시글 삭제
	public void deleteContent(int tech_no);

	// 게시글 수정
	public void updateContent(TechVo vo);

	// 조회수 증가
	public void increaseReadCount(int tech_no);

	public int countContent();

	// ---------------------------------댓글-------------------------------
	// 댓글 작성
	public void writeComment(TechCommentVo vo);

	// 댓글 보기
	ArrayList<TechCommentVo> getCommentList(TechCommentVo vo);

	public TechCommentVo getCommentByNo(int tech_no);
//	-------------------------------좋아요------------------------------
	public void setLike(TechLikeVo vo);

	public void deleteLike(TechLikeVo vo);
	
	public int countLike(int tech_no);
	
	public TechLikeVo getLike(TechLikeVo vo);
	
	//이미지 관련....
	//이미지 등록
	public void registerImage(TechImageVo vo);
	
	public ArrayList<TechImageVo> getImageInfoByTechNo(int tech_no);
	
	//카테고리 관련
	public ArrayList<SkillCategoryVo> getCategoryList();
	
	public void registerSkill(TechSkillVo vo);
	
	public SkillCategoryVo getSkillName(int tech_no);
	
	
	
	//QnA 게시판/////////////////////////////////////////////////////////////////////////////////////////////////

	// insert
	public void writeContentQa(BoardVo vo);

	public BoardVo getBoardNoQa(int board_no);

	public void modifyContentQa(BoardVo vo);

	
	public ArrayList<CommentVo> getCommentQa(CommentVo vo);

	// 게시글 목록
	public ArrayList<BoardVo> getContentListQa();

	// 게시글 보기
	public BoardVo getContentByNoQa(int board_no);

	// 게시글 삭제
	public void deleteContentQa(BoardVo param);

	// 게시글 수정
	public void updateContentQa(BoardVo vo);

	// 조회수 증가
	public void increaseReadCountQa(int board_no);

	// 댓글 작성
	public void drawCommentQa(CommentVo vo);

	// 댓글 보기
	ArrayList<CommentVo> getCommentListQa(CommentVo vo);


	public int countContentQa();

	public ArrayList<ImageVo> getImageQa(int board_no);

	public void setLikeQa(LikeVo vo);

	public void deleteLikeQa(LikeVo vo);

	public int countLikeQa(int board_no);

	public LikeVo getLikeQa(LikeVo vo);
	
	public void deleteLikeAllQa(BoardVo vo);
	
	public void deleteCommentAllQa(BoardVo vo);
	
	/////////타미//////////

	//create Primary Key
	public int createBulletinBoardPK();
	
	public MemberVo compareIdAndPw(MemberVo vo);
	
//	INSERT...
	public void writeContentfr(BulletinBoardVo vo);

// SELECT ...	
	public ArrayList<BulletinBoardVo> getContentsfr(
			@Param("search_word") String search_word,
			@Param("page_num") int page_num
			);
	
	public int getContentCountfr(
			@Param("search_word") String search_word,
			@Param("page_num") int page_num
			);
	
// SELECT  -----------readContentPage -----------
	public BulletinBoardVo getContentByNofr(int board_no);
	
// SELECT  ----------Delete Content -----------
	public void deleteContentfr(int board_no);
	
// ---------------Update Content----------------
	public void updateContentfr(BulletinBoardVo vo);
	
// ---------조회수 증가   Increase # of Views -----------
	public void increaseReadCountfr(int board_no);
	
// ------------ Comment -----------------------
	public void writeCommentfr(CommentVofr vo);
	
	public ArrayList<CommentVofr> getCommentListfr(CommentVofr vo);
	
	public CommentVofr getCommentVo(int board_no);
	
		
// -------------Like 좋아요 ---------------------
	public void setLikefr (LikeVofr vo);
	
	public void deleteLikefr (LikeVofr vo);
	
	public int countLikefr (int board_no);
	
	public LikeVofr getLikefr(LikeVofr vo);
	
// --------------- Image ------------
	public void registerBoardImage(BulletinBoardImageVo vo);
	
	public ArrayList<BulletinBoardImageVo> getImageDetailByBoardNo(int board_no);
	
	
	
	
	
	
}
