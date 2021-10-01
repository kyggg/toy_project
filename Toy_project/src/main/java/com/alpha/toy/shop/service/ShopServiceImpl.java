package com.alpha.toy.shop.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.toy.member.mapper.MemberSQLMapper;
import com.alpha.toy.shop.mapper.ShopSQLMapper;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.ToyBuyVo;
import com.alpha.toy.vo.ToyProductVo;
import com.alpha.toy.vo.ToyShopLikeVo;
import com.alpha.toy.vo.ToyShopVo;

@Service
public class ShopServiceImpl {

	@Autowired
	private ShopSQLMapper shopSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	//가게 등록하기
	public void shopRegister(ToyShopVo vo) {	
		shopSQLMapper.shopRegister(vo);
	}
	
	//총 가게 수
	public int getShopCount(int page_num) {
		int count = shopSQLMapper.getShopCount(page_num);
		return count;
	}
	
	//가게관리 목록보기
	public ArrayList<HashMap<String, Object>> getShopList(int page_num){
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		
		ArrayList<ToyShopVo> shoplist = shopSQLMapper.getShopList(page_num);
		
		for(ToyShopVo shopVo : shoplist) {
			
			int memberNo = shopVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(memberNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("memberVo", memberVo);
			
			map.put("shopVo", shopVo);

			list.add(map);
		}
		return list;
	}
	
	//가게 상세보기
	public HashMap<String, Object> getShopView(int shop_no){

		ToyShopVo shopVo = shopSQLMapper.getShopByNo(shop_no);
		
		//html escape
		String content = shopVo.getShop_content();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll("\n", "<br>");
		shopVo.setShop_content(content);
		
		//샵 내용보기
		int member_no = shopVo.getMember_no();
		MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("memberVo", memberVo);
		map.put("shopVo", shopVo);
		
		return map;
	}
	
	//가게 삭제
	public void deleteShop(int shop_no) {
		shopSQLMapper.deleteShop(shop_no);
	}
	
	//가게 수정
	public void updateShop(ToyShopVo vo) {
		shopSQLMapper.updateShop(vo);
	}
	
	//상품 등록
	public void productRegister(ToyProductVo vo) {
		shopSQLMapper.productRegister(vo);
	}
	
	//상품 목록보기
	public ArrayList<HashMap<String, Object>> getProductList(ToyProductVo vo){
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		ArrayList<ToyProductVo> productlist = shopSQLMapper.getProductList(vo);
		
		for(ToyProductVo toyProductVo : productlist) {
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("toyProductVo", toyProductVo);
			
			list.add(map);
		}
		return list;
	}
	
public ArrayList<HashMap<String, Object>> getProductList2(ToyProductVo vo){
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		ArrayList<ToyProductVo> productlist = shopSQLMapper.getProductList2(vo);
		
		for(ToyProductVo toyProductVo : productlist) {
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("toyProductVo", toyProductVo);
			
			list.add(map);
		}
		return list;
	}
	
	//상품 상세보기
	public HashMap<String, Object> getProductView(int product_no){

		ToyProductVo productVo = shopSQLMapper.getProductByNo(product_no);
		
		//html escape
		String content = productVo.getProduct_content();
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll("\n", "<br>");
		productVo.setProduct_content(content);
		
		//샵 내용보기		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("productVo", productVo);
		
		
		return map;
	}
	
	//물품 구매하기
	public void buyProduct(ToyBuyVo vo) {
		shopSQLMapper.buyProduct(vo);
	}
	
	
	public int canBuy(ToyBuyVo vo) {
		return shopSQLMapper.canBuy(vo);
	}
	
	
	public ArrayList<HashMap<String,Object>> purchaseBuy(int member_no){
		
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ToyBuyVo> buyList = shopSQLMapper.purchaseBuy(member_no);
		
		for(ToyBuyVo toyBuyVo : buyList) {
			
			ToyProductVo toyProductVo = shopSQLMapper.getProductByNo(toyBuyVo.getProduct_no());
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("toyBuyVo", toyBuyVo);	
			map.put("toyProductVo", toyProductVo);	
			
			list.add(map);
		}
		
			
		return list;
	}	
	
	public ArrayList<HashMap<String,Object>> likeList(int member_no){
		
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<ToyShopLikeVo> likeList = shopSQLMapper.likeList(member_no);
		
		for(ToyShopLikeVo toyShopLikeVo : likeList) {
			
			ToyShopVo shopVo = shopSQLMapper.likeShopInfo(toyShopLikeVo.getShop_no());
			
			HashMap<String,Object> map = new HashMap<String,Object>();
			
			int memberNo = shopVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(memberNo);
			
			map.put("memberVo", memberVo);
			map.put("toyShopLikeVo", toyShopLikeVo);	
			map.put("shopVo", shopVo);	
		
			
			list.add(map);
		}
		
		
		return list;
	}	

	public HashMap<String, Object> getLike(int shop_no,ToyShopLikeVo vo){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ToyShopLikeVo like = shopSQLMapper.getLike(vo);
		int likecount = shopSQLMapper.countLike(shop_no);
		
		map.put("like", like);
		map.put("likecount", likecount);
		
		return map;
	}
	
	public void setLike(ToyShopLikeVo param) {
		shopSQLMapper.setLike(param);
	}
	
	public void deleteLike(ToyShopLikeVo param) {
		shopSQLMapper.deleteLike(param);
	}
	
	
}
