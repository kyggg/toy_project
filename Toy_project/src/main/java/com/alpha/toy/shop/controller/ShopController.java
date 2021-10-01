package com.alpha.toy.shop.controller;

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

import com.alpha.toy.shop.service.ShopServiceImpl;
import com.alpha.toy.vo.MemberVo;
import com.alpha.toy.vo.ToyBuyVo;
import com.alpha.toy.vo.ToyProductVo;
import com.alpha.toy.vo.ToyShopLikeVo;
import com.alpha.toy.vo.ToyShopVo;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@Autowired
	private ShopServiceImpl shopService;
	
	@RequestMapping("Shop_Main.do")
	public String ShopMain(Model model, 
							ToyProductVo vo,
						   @RequestParam(defaultValue = "1") int page_num
						   ) {
		
		ArrayList<HashMap<String, Object>> shoplist = shopService.getShopList(page_num);
		ArrayList<HashMap<String, Object>> productlist = shopService.getProductList2(vo);

		model.addAttribute("shoplist", shoplist);
		model.addAttribute("productlist", productlist);
		
		return "shop/Shop_Main";
	}
	
	//가게 목록보기
	@RequestMapping("Shop_Manage.do")
	public String ShopManage(Model model, @RequestParam(defaultValue = "1") int page_num) {
		
		ArrayList<HashMap<String, Object>> shoplist = shopService.getShopList(page_num);
		
		//총 가게 수
		int count = shopService.getShopCount(page_num);
		
		int totalPageCount = (int)Math.ceil(count/10.0);
		int currentPage = page_num;
		
		int beginPage = ((currentPage-1)/5)*5+1;
		int endPage = ((currentPage-1)/5 + 1)*(5);
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPageCount", totalPageCount);

		model.addAttribute("shoplist", shoplist);
		
		return "shop/Shop_Manage";
	}
	//가게 등록페이지
	@RequestMapping("Shop_Register.do")
	public String ShopRegister() {
		return "shop/Shop_Register";
	}
	//가게 등록 프로세스
	@RequestMapping("shopRegisterProcess.do")
	public String shopRegisterProcess(ToyShopVo param, MultipartFile [] shop_image, HttpSession session) {
		
		String filePath = "";
		
		for(MultipartFile shopFile : shop_image) {
			if(shopFile.isEmpty()) {
				continue;
			}
			String rootFolderName = "/Users/sungsin/shopUpload/";
			
			String originalFilName = shopFile.getOriginalFilename();
			String ext = originalFilName.substring(originalFilName.lastIndexOf("."));
			String uuidName = UUID.randomUUID().toString();
			long currentTimeMillis = System.currentTimeMillis();
			String randomFileName = uuidName + "_" + currentTimeMillis + ext;
			
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
				shopFile.transferTo(new File(saveFilePathName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			filePath += todayFolderName + "/" + randomFileName; 
			param.setShop_image_url(todayFolderName + "/" + randomFileName);
		}
		
		//데이터 처리
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		param.setMember_no(member_no);
		
		param.setShop_image_url(filePath);
		shopService.shopRegister(param);
		
		return "redirect:../shop/Shop_Manage.do";
	}
	
	//가게 상세보기 페이지
	@RequestMapping("Shop_View.do")
	public String ShopView(int shop_no, ToyProductVo vo, Model model) {
		
		//가게 상세보기
		HashMap<String, Object> shopView = shopService.getShopView(shop_no);
		model.addAttribute("shopView",shopView);
		
		//상품 목록
		ArrayList<HashMap<String, Object>> productlist = shopService.getProductList(vo);
		model.addAttribute("productlist", productlist);
		
		return "shop/Shop_View";
	}

	//상품 등록 프로세스
	@RequestMapping("productRegisterProcess.do")
	public String productRegisterProcess(ToyProductVo param, MultipartFile [] product_image) {
		
		String filePath = "";
		
		for(MultipartFile productFile : product_image) {
			if(productFile.isEmpty()) {
				continue;
			}
			String rootFolderName = "/Users/sungsin/productUpload/";
			
			String originalFilName = productFile.getOriginalFilename();
			String ext = originalFilName.substring(originalFilName.lastIndexOf("."));
			String uuidName = UUID.randomUUID().toString();
			long currentTimeMillis = System.currentTimeMillis();
			String randomFileName = uuidName + "_" + currentTimeMillis + ext;
			
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
				productFile.transferTo(new File(saveFilePathName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			filePath += todayFolderName + "/" + randomFileName; 
		}
		
		param.setProduct_image_url(filePath);
		shopService.productRegister(param);
		
		return "redirect:../shop/Shop_View.do?shop_no=" + param.getShop_no();
	}
	
	//가게 삭제
	@RequestMapping("deleteShopProcess.do")
	public String deleteShopProcess(int shop_no) {
		
		shopService.deleteShop(shop_no);
		
		return "redirect:../shop/Shop_Main.do";
	}
	
	//가게 수정프로세스
	@RequestMapping("updateShopProcess.do")
	public String updateShopProcess(ToyShopVo vo) {
		
		shopService.updateShop(vo);
		
		return "redirect:../shop/Shop_View.do?shop_no=" + vo.getShop_no();
	}
	//가게 수정페이지
	@RequestMapping("Shop_Update.do")
	public String updateShopPage(int shop_no, Model model) {
		
		HashMap<String, Object> map = shopService.getShopView(shop_no);
		
		model.addAttribute("shopView", map);
		
		return "shop/Shop_Update";
	}
	//상품 등록페이지
	@RequestMapping("Shop_ProductRegister")
	public String ShopProductRegister(int shop_no, Model model) {
		
		HashMap<String, Object> product = shopService.getShopView(shop_no);
		
		model.addAttribute("content", product);
		
		return "shop/Shop_ProductRegister";
	}
	//상품 상세보기페이지
	@RequestMapping("Shop_ProductDetail")
	public String ShopProductDetail(int product_no, ToyProductVo vo, Model model) {
				
		//물품 상세보기
		HashMap<String, Object> productView = shopService.getProductView(product_no);
		model.addAttribute("productView",productView);
		
		return "shop/Shop_ProductDetail";
	}
	//상품 구매하기 페이지
	@RequestMapping("Shop_BuyProduct")
	public String ShopBuyProduct(int product_no, ToyProductVo vo, Model model) {
		
		//HashMap<String, Object> product = shopService.getShopView(product_no);	
		//model.addAttribute("content", product);
		
		HashMap<String, Object> productView = shopService.getProductView(product_no);
		model.addAttribute("productView",productView);
		
		ArrayList<HashMap<String, Object>> productlist = shopService.getProductList(vo);
		model.addAttribute("productlist", productlist);
		
		return "shop/Shop_BuyProduct";
	}
	//상품 구매 결과 페이지
	@RequestMapping("Shop_BuyResult")
	public String ShopBuyResult(int product_no, ToyProductVo vo, Model model) {
		
		HashMap<String, Object> productView = shopService.getProductView(product_no);
		model.addAttribute("productView",productView);
		
		return "shop/Shop_BuyResult";
	}
	
	@RequestMapping("Shop_BuyResultFail")
	public String ShopBuyResultFail() {
		return "shop/Shop_BuyResultFail";
	}
	
	@RequestMapping("buyProductProcess.do")
	public String buyProductProcess(ToyBuyVo param, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();

		//남은 수량 존재???
		int value = shopService.canBuy(param);
		if(value < 0) {
			return "shop/Shop_BuyResultFail";
		}
		
		
		//내 돈 있냐??
		
		
		param.setMember_no(member_no);
		
		shopService.buyProduct(param);
		
		return "redirect:../shop/Shop_BuyResult.do?product_no=" + param.getProduct_no();
	}
	
	@RequestMapping("Shop_ClientShopView")
	public String ShopClientShopView(Model model, @RequestParam(defaultValue = "1") int page_num, HttpSession session) {
		
		ArrayList<HashMap<String, Object>> shoplist = shopService.getShopList(page_num);
		
		
		//총 가게 수
		int count = shopService.getShopCount(page_num);
		
		int totalPageCount = (int)Math.ceil(count/10.0);
		int currentPage = page_num;
		
		int beginPage = ((currentPage-1)/5)*5+1;
		int endPage = ((currentPage-1)/5 + 1)*(5);
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalPageCount", totalPageCount);

		model.addAttribute("shoplist", shoplist);
		
		return "shop/Shop_ClientShopView";
	}

	@RequestMapping("Shop_ClientProductView")
	public String ShopClientProductView(ToyProductVo vo, Model model, int shop_no, ToyShopLikeVo param, HttpSession session) {
		
		MemberVo like = (MemberVo) session.getAttribute("sessionUser");
		int member_no = like.getMember_no();
		param.setMember_no(member_no);
		
		
		HashMap<String, Object> content = shopService.getShopView(shop_no);
		model.addAttribute("content", content);
		
		HashMap<String, Object> getLike = shopService.getLike(shop_no, param);
		model.addAttribute("getLike", getLike);
		
		//상품 목록
		ArrayList<HashMap<String, Object>> productlist = shopService.getProductList(vo);
		model.addAttribute("productlist", productlist);
		
		
		return "shop/Shop_ClientProductView";
	}
	
	
	@RequestMapping("Shop_ClientProductView2")
	public String ShopClientProductView2(ToyProductVo vo, Model model, ToyShopLikeVo param, HttpSession session) {
		
		MemberVo like = (MemberVo) session.getAttribute("sessionUser");
		int member_no = like.getMember_no();
		param.setMember_no(member_no);
		
		ArrayList<HashMap<String, Object>> productlist = shopService.getProductList2(vo);
		model.addAttribute("productlist", productlist);

		
		
		return "shop/Shop_ClientProductView2";
	}
	

	@RequestMapping("Shop_PurchaseHistory")
	public  String ShopPurchaseHistory(HttpSession session,  Model model) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		ArrayList<HashMap<String, Object>> purchaseHistory = shopService.purchaseBuy(member_no);
			
		model.addAttribute("purchaseHistory",purchaseHistory);
		
		
		return "shop/Shop_PurchaseHistory";
	}
	
	@RequestMapping("Shop_ShopLikeList")
	public String shopLikeList(HttpSession session,  Model model) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int member_no = sessionUser.getMember_no();
		
		ArrayList<HashMap<String, Object>> likeList = shopService.likeList(member_no);
		
		model.addAttribute("likeList",likeList);
		
		return "shop/Shop_ShopLikeList";
	}

	@RequestMapping("setLike.do")
	public String setLike(ToyShopLikeVo param) {
		shopService.setLike(param);
		return "redirect:./Shop_ClientProductView.do?shop_no="+ param.getShop_no();
	}
	
	@RequestMapping("deleteLike.do")
	public String deleteLike(ToyShopLikeVo param) {
		shopService.deleteLike(param);
		return "redirect:./Shop_ClientProductView.do?shop_no="+ param.getShop_no();
	}
	
}
