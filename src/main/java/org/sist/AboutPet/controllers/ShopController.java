package org.sist.AboutPet.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Project/aboutPet/*")
public class ShopController {
	
	@RequestMapping(value = "shop_home.do")
	public String shop_home() {
		
		
		
		
		return "shop_home.jsp";
		
	}
	
	
	
	@RequestMapping("itemDetail.do")
	public String shopDetail() {
		
		
		
		
		return "itemDetail.jsp";
	}
	
	
	@RequestMapping("shopList.do")
	public String shoplist() {
	
		
		return "shop_list.jsp";
	}
	
	@RequestMapping("indexBestGoodsList.do")
	public String bestGoodsList() {
	
		
		return "bestGoodsList.jsp";
	}
	
	
	@RequestMapping("brandList.do")
	public String brandListPage( int brandCode) {
		
		
		return"brandList.jsp";
	}	

}
