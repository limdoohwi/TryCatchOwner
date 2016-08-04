/*
 *  Class: DeliveryController
 *  Description: Delivery, MaterialOrder�� ���õ� �޼��带 �����ϴ� ��Ʈ�ѷ�
 *  Created: 2016��08��01
 * 	Author: ������
 *  Mail: popozk22@nate.com
 *  Copyrights 2016-08-01 by Try{}Catch
 *
 *  Revisions:
 *   1. When & Who : 
 *   2. What    :
 *   
 *   1. When & Who : 
 *   2. What    : 
 */
package com.trycatch.owner.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trycatch.owner.domain.MaterialCartDTO;
import com.trycatch.owner.domain.MaterialOrderDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;
import com.trycatch.owner.domain.MemberDTO;
import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.service.MaterialCartService;
import com.trycatch.owner.service.MaterialService;
import com.trycatch.owner.service.OrderService;
import com.trycatch.owner.service.StoreService;

import net.sf.json.JSONObject;


@Controller
public class DeliveryController {
	@Inject
	private MaterialService service;
	@Inject
	private MaterialCartService cartservice;
	@Inject
	private OrderService orderService;
	@Inject
	private StoreService storeService;
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryController.class);

	/**
	  * @author 손현민
	  *	현재 웹서비스에 접속한 점장이 보유하고있는 매장 리스트를 호출
	  */ 
	@RequestMapping(value = "/delivery/Order_list", method = RequestMethod.GET)
	public void orderlist(Model model, HttpServletRequest req) throws Exception {
		MemberDTO member_dto = (MemberDTO)(req.getSession().getAttribute("member_dto"));
		model.addAttribute("storeList", storeService.getStoreList_member_no(member_dto.getMember_no()));
	}
	
	/**
	  * @author 손현민
	  *	웹서비스에 접속한 클라이언트가 설정한 매장번호, 입력한 현재날짜와 일치하는 재료주문리스트를 호출
	  */ 
	@RequestMapping("/delivery/payment/list")
	public @ResponseBody Object getMaterialPaymentList(int store_no, String date, int start_page) throws Exception{
		org.json.simple.JSONObject json = service.getMaterialPaymentList(store_no, date, start_page);
		return json;
	}
	
	/**
	  * @author 손현민
	  *	재료주문리스트 번호를 받아와 상세한 주문내용을 호출
	  */ 
	@RequestMapping("/delivery/payment/detail/list")
	public @ResponseBody Object getMaterialPaymentDetailList(int material_payment_no) throws Exception{
		org.json.simple.JSONObject json = service.getMaterialPaymentDetailList(material_payment_no);
		return json;
	}
	
	/**
	  * @author 손현민
	  *	웹서비스에 접속한 멤버가 재료주문을 하기전에 현재 카트에 담겨져 있는 재료리스트를 호출
	  */ 
	@RequestMapping(value = "/delivery/Order")
	public void setStorePOST(HttpServletRequest req, Model model) throws Exception{
		StoreDTO storeDto = (StoreDTO)req.getSession().getAttribute("store_dto");
		int store_no = storeDto.getStore_no();
		MemberDTO memberDto = (MemberDTO)req.getSession().getAttribute("member_dto");
		model.addAttribute("cartlist", service.showmaterialConfirm(memberDto.getMember_no()));
	}
	
	/**
	  * @author 손현민
	  *	DB에 있는 커피,케이크 재료를 호출 해서 뿌려준다.
	  */
	@RequestMapping(value="/delivery/Delivery")
	public String Delivery(Model model, HttpServletRequest req) throws Exception {	
		model.addAttribute("materialcoffee",service.showmaterial_coffee());
		model.addAttribute("materialcake",service.showmaterial_cake());
		return "/delivery/Delivery";
	}
	
	/**
	  * @author 손현민
	  *	카트에 담은 재료 리스트를 호출(장바구니 리스트)
	  */
	@RequestMapping(value="/list.cart",method=RequestMethod.POST)
	public @ResponseBody Object getCartList(HttpServletRequest req){
		MemberDTO member_dto = (MemberDTO)(req.getSession().getAttribute("member_dto"));
		MaterialCartDTO cartdto = new MaterialCartDTO();
		cartdto.setMember_no(member_dto.getMember_no());
		JSONObject obj = new JSONObject();
		List list = cartservice.getCartList(cartdto);
		obj.put("cartlist", cartservice.getCartList(cartdto));
		System.out.println(obj+"--------------------------");
		return obj;
	}
	
	/**
	  * @author 손현민
	  *	멤버 번호를 받아와 같은 재료를 주문시 CHECK 하여 FALSE일때 INSERT하고 TRUE일때는 UPDATE 호출
	  */
	@RequestMapping(value="/insert.cart", method=RequestMethod.POST)
	public @ResponseBody Object insertCart(HttpServletRequest req, int material_no, int material_cnt){
		MemberDTO member_dto = (MemberDTO)(req.getSession().getAttribute("member_dto"));
		MaterialCartDTO cartdto = new MaterialCartDTO();
		cartdto.setMember_no(member_dto.getMember_no());
		cartdto.setMaterial_no(material_no);
		cartdto.setMaterial_count(material_cnt);
		System.out.println(cartdto.toString());
		boolean check = cartservice.checkCart(cartdto);
	
		//insert 일때
		if(check == false){
			cartservice.insertCart(cartdto);
		}
		//update 일때
		else{
			cartservice.updateCart(cartdto);
		}
		System.out.println("üũ : " + check);
		
		JSONObject obj = new JSONObject();
		cartdto.setMaterial_no(0);
		obj.put("cartlist", cartservice.getCartList(cartdto)); 
		System.out.println(obj+"insert??------------------------");
		return obj;
	}   
	
	/**
	  * @author 손현민
	  *	카트목록에 있는 재료를 MINUS시 -1해서 UPDATE해주고 PLUS시 +1해서 업데이트 호출
	  */
	@RequestMapping("/update.cart")
	public @ResponseBody Object updateCart(HttpServletRequest req){
		MemberDTO member_dto = (MemberDTO)(req.getSession().getAttribute("member_dto"));
		String param = req.getParameter("param");
		int material_no = Integer.parseInt(req.getParameter("material_no"));
		MaterialCartDTO cartdto = new MaterialCartDTO();
		cartdto.setMember_no(member_dto.getMember_no());
		cartdto.setMaterial_no(material_no);
		if(param.equals("minus")){
			cartdto.setMaterial_count(-1);
			cartservice.updateCart(cartdto);
		}
		else if(param.equals("plus")){
			cartdto.setMaterial_count(0);
			cartservice.updateCart(cartdto);
		}
		else{
			int material_count =Integer.parseInt(req.getParameter("material_count"));
			cartdto.setMaterial_count(material_count);
			cartservice.updateCart(cartdto);
		}
		JSONObject obj = new JSONObject();
		cartdto.setMaterial_no(0);
		obj.put("cartlist", cartservice.getCartList(cartdto));
		return obj;
	}
	
	/**
	  * @author 손현민
	  *	카트목록에 있는 재료를 삭제할 수 있게 호출
	  */
	@RequestMapping("/delete.cart")
	public @ResponseBody Object deleteCart(HttpServletRequest req){
		MemberDTO member_dto = (MemberDTO)(req.getSession().getAttribute("member_dto"));
		int material_no = Integer.parseInt(req.getParameter("material_no"));
		MaterialCartDTO cartdto = new MaterialCartDTO();
		cartdto.setMember_no(member_dto.getMember_no());
		cartdto.setMaterial_no(material_no);
		cartservice.deleteCart(cartdto);
		
		JSONObject obj = new JSONObject();
		cartdto.setMaterial_no(0);
		obj.put("cartlist", cartservice.getCartList(cartdto));
		return obj;
	}
	
	/**
	  * @author 손현민
	  * 웹서비스에 접속한 멤버가 주문한 내역을 INSERT하여 호출
	  */
	@RequestMapping("insert/materialpayment")
	public String insertmaterialpayment(HttpServletRequest req,Model model, MaterialPaymentDTO paymentDto, MaterialOrderDTO orderDto) throws Exception{
		System.out.println("�������**************************************************************************");
		System.out.println(orderDto.getMaterial_nos().length+ "*************************************");
		System.out.println(paymentDto.getMaterial_total_price());
		MemberDTO member_dto = (MemberDTO)(req.getSession().getAttribute("member_dto"));
		paymentDto.setMember_no(member_dto.getMember_no());
		model.addAttribute("isSuccessMaterial",orderService.insertMaterial_Payment(paymentDto, orderDto));
		return "redirect:/delivery/Delivery";
	}
}
