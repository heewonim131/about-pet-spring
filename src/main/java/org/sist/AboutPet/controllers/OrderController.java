package org.sist.AboutPet.controllers;

import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.sist.AboutPet.dao.Order;
import org.sist.AboutPet.dao.Shop;
import org.sist.AboutPet.vo.Address;
import org.sist.AboutPet.vo.OrderAndPayment;
import org.sist.AboutPet.vo.ShopITEM;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/Project/aboutPet/*")
public class OrderController {
	
	@Autowired
	private Order order = null;
	@Autowired
	private Shop shop = null;
	@Autowired
	private org.sist.AboutPet.service.OrderAndPayment oapService;
	
	//item_code=1&totalCnt=1&totalPrice=20460&mem_code=1
	@RequestMapping(value ={"itemOrder.do"},method = RequestMethod.GET)
	public String payment(
			@RequestParam("item_code") int item_code,
			@RequestParam("totalCnt") int totalCnt,
			@RequestParam("totalPrice") int totalPrice,
			@RequestParam("mem_code") int mem_code,
			Model model
			) {	
	
			Address address = order.memberDel(mem_code);
			ShopITEM shopITEM = shop.selectOptItem(item_code);
			String itemFee = order.selectFee(item_code);
			model.addAttribute("orderDTO", address);
			model.addAttribute("totalCnt", totalCnt);
			model.addAttribute("totalPrice", totalPrice);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
			model.addAttribute("shopDTO", shopITEM);  
			model.addAttribute("mem_num", mem_code);
			model.addAttribute("item_fee", itemFee);
		return"payment";
	}
	
	@RequestMapping(value = "itemOrder.do", method = RequestMethod.POST)
	   public String order(OrderAndPayment oap, Model model) throws Exception{
	      
		 //System.out.print(oap.toString());
		
		
		 
		  oapService.insertOrderAll(oap);
	      
	      model.addAttribute("oap", oap);
	      
	      
	      
	      return "endOrderItem";
	   }
	
	@RequestMapping("memberPoint.do")
	public String searchPoint(@RequestParam("mem_code") int mem_code
								,Model model) {
		String mem_point = null;
		
		try {
			mem_point = order.memberPoint(mem_code);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("mem_point", mem_point);
		return "selectPoint";
	}
	
	@RequestMapping(value = "changeDel.do", method = RequestMethod.GET)
	public String changeDel() throws Exception{

		
		return "emptyDel";
	}
	
	@RequestMapping(value = "undoDel.do", method = RequestMethod.GET)
	public String undoDel(HttpServletRequest request, Model model) throws Exception{
		
		int mem_code = Integer.parseInt(request.getParameter("mem_code"));
		
		Address addr = order.memberDel(mem_code);
		model.addAttribute("orderDTO", addr);	
		
		return "undoDel";
	}
	
	
	
	

}
