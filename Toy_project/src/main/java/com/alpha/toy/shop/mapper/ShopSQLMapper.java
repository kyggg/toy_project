package com.alpha.toy.shop.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.alpha.toy.vo.ToyBuyVo;
import com.alpha.toy.vo.ToyProductVo;
import com.alpha.toy.vo.ToyShopLikeVo;
import com.alpha.toy.vo.ToyShopVo;

public interface ShopSQLMapper {

	//총 가게 수
	public int getShopCount(@Param("page_num") int page_num);
	
	//가게 등록하기
	public void shopRegister(ToyShopVo vo);
	
	//가게관리 목록
	public ArrayList<ToyShopVo> getShopList(@Param("page_num") int page_num);

	//가게 상세 보기
	public ToyShopVo getShopByNo(int shop_no);
	
	//가게 삭제
	public void deleteShop(int shop_no);
	
	//가게 수정
	public void updateShop(ToyShopVo vo);
	
	//상품 등록
	public void productRegister(ToyProductVo vo);
	
	//상품 목록
	ArrayList<ToyProductVo> getProductList(ToyProductVo vo);
	ArrayList<ToyProductVo> getProductList2(ToyProductVo vo);
	
	//상품 상세 보기
	public ToyProductVo getProductByNo(int shop_no);
	
	//물품 구매
	public void buyProduct(ToyBuyVo vo);
		
	//남은 수량 - 구매 수량 0보다 커야 된다...
	public int canBuy(ToyBuyVo vo);
	
	//상점 찜하기
	public void setLike(ToyShopLikeVo vo);

	public void deleteLike(ToyShopLikeVo vo);
	
	public ToyShopLikeVo getLike(ToyShopLikeVo vo);
	
	public int countLike(int shop_no);
	
	//구매내역-------------------------------------
	ToyProductVo purchaseProduct(int product_no);

	ArrayList<ToyBuyVo> purchaseBuy(int member_no);
	
	//찜목록보기
	ArrayList<ToyShopLikeVo> likeList(int member_no);
	
	ToyShopVo likeShopInfo(int shop_no);
}
