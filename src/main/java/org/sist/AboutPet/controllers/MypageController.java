package org.sist.AboutPet.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.sist.AboutPet.dao.MemberDao;
import org.sist.AboutPet.service.CancelService;
import org.sist.AboutPet.vo.Address;
import org.sist.AboutPet.vo.Cancel;
import org.sist.AboutPet.vo.Member;
import org.sist.AboutPet.vo.Order;
import org.sist.AboutPet.vo.Payment;
import org.sist.AboutPet.vo.Pet;
import org.sist.AboutPet.vo.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/Project/mypage/*")
public class MypageController {
	
	@Autowired
	private MemberDao memberDao = null;
	@Autowired
	private CancelService cancelService;
	
	// 마이페이지 메인
	@RequestMapping("myPage.do")
	public String myPage(Principal principal, Model model) throws Exception {
		String username = (principal != null ? principal.getName() : "Ukleouk");
		// 회원정보
		Member memberDTO = this.memberDao.getMyInfo(username);
		// 마이펫 리스트
		List<Pet> petlist = this.memberDao.getPetList(username);
		// 찜 개수
		int tvMark = this.memberDao.getWishCnt(username, "VIDEO_MARK");
		int logMark = this.memberDao.getWishCnt(username, "LOG_MARK");
		int itemMark = this.memberDao.getWishCnt(username, "ITEM_MARK");
		// 최근 본 영상
		List<Video> mtlist = this.memberDao.getRecentTv(username);
		// 쿠폰 개수
		int couponCnt = this.memberDao.getCouponCnt(username, 0);
		// 장바구니 상품 개수
		int cartCnt = this.memberDao.getCartCnt(username);
		
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("petlist", petlist);
		model.addAttribute("tvMark", tvMark);
		model.addAttribute("logMark", logMark);
		model.addAttribute("itemMark", itemMark);
		model.addAttribute("mtlist", mtlist);
		model.addAttribute("couponCnt", couponCnt);
		model.addAttribute("cartCnt", cartCnt);
		return "mypage.myPage";
	}
	
	// 주문내역
	@RequestMapping("order/orderList.do")
	public String orderList(Principal principal, Model model) throws Exception {
		String username = (principal != null ? principal.getName() : "Ukleouk");
		// 주문 리스트
		List<Order> olist = this.memberDao.getOrderList(username);
		// 주문 상품 리스트
		List<Order> oilist = this.memberDao.getOrderItemList(username);
		
		if (oilist != null && !oilist.isEmpty()) {
			Iterator<Order> ir = oilist.iterator();
			while (ir.hasNext()) {
				Order dto = ir.next();
				
				// item_img
				String img = dto.getItem_img();
				int idx = img.indexOf(",");
				if (idx != -1) dto.setItem_img(img.substring(0, idx));
				
				// item_price
				int rate = dto.getSale_rate();
				if (rate != 0) {
					int price = dto.getItem_price();	// 정가 -> 할인적용 (백원단위)
					price = (int) (Math.floor(price*(1- (double) rate/100)/100)*100);
					dto.setItem_price(price);
				}
				
				// 상품명=옵션명 같으면 옵션이 없는 것 (단일상품)
				if (dto.getItem_name().equals(dto.getOpt_name())) dto.setOpt_name(null);
			}//while
		}//if
		
		model.addAttribute("olist", olist);
		model.addAttribute("oilist", oilist);
		return "mypage/order.orderList";
	}
	
	// 주문상세내역
	@RequestMapping("order/orderDetail.do")
	public String orderDetail(String ord_code, Model model) throws Exception {
		System.out.println(ord_code +"--------------------");
		// 주문
		Order odto = this.memberDao.getOrderDetail(ord_code);
		// 주문 상품
		List<Order> oilist = this.memberDao.getOrderItemDetail(ord_code);
		// 배송지
		Address adto = this.memberDao.getAddress(ord_code);
		// 결제정보
		Payment pdto = this.memberDao.getPayDetail(ord_code);

		int fee = 0, point = 0;
		
		if (oilist != null && !oilist.isEmpty()) {
			Iterator<Order> ir = oilist.iterator();
			while (ir.hasNext()) {
				Order dto = ir.next();
				
				// item_img
				String img = dto.getItem_img();
				int idx = img.indexOf(",");
				if (idx != -1) dto.setItem_img(img.substring(0, idx));
				
				// item_price
				int rate = dto.getSale_rate();
				if (rate != 0) {
					int price = dto.getItem_price();	// 정가 -> 할인적용 (백원단위)
					price = (int) (Math.floor(price*(1- (double) rate/100)/100)*100);
					dto.setItem_price(price);
				}
				
				// 상품명=옵션명 같으면 옵션이 없는 것 (단일상품)
				if (dto.getItem_name().equals(dto.getOpt_name())) dto.setOpt_name(null);
				pdto.setPm_price(pdto.getPm_price()+dto.getItem_price());
			}//while
		}//if
		
		// 결제정보
		if (pdto.getPm_price() <= 30000) fee = 2500;
		pdto.setPm_price(pdto.getPm_price()+fee);
		point = (int) Math.floor( (double) pdto.getPm_price() / 1000 );
		
		model.addAttribute("odto", odto);
		model.addAttribute("oilist", oilist);
		model.addAttribute("adto", adto);
		model.addAttribute("pdto", pdto);
		model.addAttribute("fee", fee);
		model.addAttribute("point", point);
		
		return "mypage/order.orderDetail";
	}

	// 주문취소 GET
	@RequestMapping(value={"order/cancelReq.do"}, method=RequestMethod.GET)
	public String cancelReq(String ordNo, String oddNo, Model model, Principal principal) throws Exception {
		//
		// 주문
		Order odto = this.memberDao.getOrderDetail(ordNo);
		// 주문 상품
		List<Order> oilist = this.memberDao.getOrderItemDetail(ordNo);
		// 배송지
//		Address adto = this.memberDao.getAddress(ord_code);
		// 결제정보
		Payment pdto = this.memberDao.getPayDetail(ordNo);
		
		int returnAmt = 0;
		
//		int fee = 0;
		int returnFee = 0, extraFee = 0;
		
		int order_cnt = oilist.size();
		if (order_cnt == 1) oddNo = "all";
		
//		point = 0;
		
		if (oilist != null && !oilist.isEmpty()) {
			Iterator<Order> ir = oilist.iterator();
			while (ir.hasNext()) {
				Order dto = ir.next();
				
				// item_img
				String img = dto.getItem_img();
				int idx = img.indexOf(",");
				if (idx != -1) dto.setItem_img(img.substring(0, idx));
				
				// item_price
				int rate = dto.getSale_rate();
				if (rate != 0) {
					int price = dto.getItem_price();	// 정가 -> 할인적용 (백원단위)
					price = (int) (Math.floor(price*(1- (double) rate/100)/100)*100);
					dto.setItem_price(price);
				}
				
				// 상품명=옵션명 같으면 옵션이 없는 것 (단일상품)
				if (dto.getItem_name().equals(dto.getOpt_name())) dto.setOpt_name(null);
				pdto.setPm_price(pdto.getPm_price()+dto.getItem_price());
				
				if (dto.getOdd_code().equals(oddNo)) {
					returnAmt = dto.getItem_price();
				}
				
			}//while
		}//if
		
		// 결제정보
		if (oddNo.equals("all")) {
			returnAmt = pdto.getPm_price();
			if (returnAmt <= 30000) returnFee = 2500;
		} else {
			if (returnAmt >= 30000) extraFee = 2500;
		}
		
//		if (pdto.getPm_price() <= 30000) fee = 2500;
//		returnAmt += returnFee;
//		point = (int) Math.floor( (double) pdto.getPm_price() / 1000 );
		
		model.addAttribute("odto", odto);
		model.addAttribute("oilist", oilist);
//		model.addAttribute("adto", adto);
		model.addAttribute("pdto", pdto);
		model.addAttribute("returnAmt", returnAmt);
//		model.addAttribute("fee", fee);
		model.addAttribute("returnFee", returnFee);
		model.addAttribute("extraFee", extraFee);
//		model.addAttribute("point", point);
		
		model.addAttribute("checkOdd", oddNo);
		model.addAttribute("order_cnt", order_cnt);
		
		return "mypage/order.cancelReq";
	}
	
	// 주문취소 POST
	@RequestMapping(value={"order/cancelReq.do"}, method=RequestMethod.POST)
	public String cancelReq(Cancel cancel
			, String ord_code
			, String order_cnt
			, String return_amt
			, String pd_method
			, RedirectAttributes redirectAttributes) throws Exception {
		// odd_code 쪼개고
		List<Cancel> cancellist = new ArrayList<Cancel>();
		String[] oddArr = cancel.getOdd_code().split(",");
		for (int i = 0; i < oddArr.length; i++) {
			System.out.println(oddArr[i]);
			cancel.setOdd_code(oddArr[i]);
			cancellist.add(cancel);
		}
		// 전체 취소하면 업데이트까지
		if (oddArr.length == Integer.parseInt(order_cnt)) {
			this.cancelService.insertAndUpdateCancel(cancellist, ord_code);
		} else {
			this.cancelService.insertCancel(cancellist);
		}
		
		redirectAttributes.addAttribute("return_amt",return_amt);
		redirectAttributes.addAttribute("pd_method",pd_method);
		return "redirect:mypage/order.cancelComplete.do";
	}
	
	// 취소완료 cancelComplete
	// 취소상세 cancelDetail
	// 취소 리스트 cancelList
	
	// 주문&취소 order 폴더로...
}
