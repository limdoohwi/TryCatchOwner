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

	 
	@RequestMapping(value = "/delivery/Order_list", method = RequestMethod.GET)
	public void orderlist(Model model, HttpServletRequest req) throws Exception {
		MemberDTO member_dto = (MemberDTO)(req.getSession().getAttribute("member_dto"));
		model.addAttribute("storeList", storeService.getStoreList_member_no(member_dto.getMember_no()));
	}
	
	@RequestMapping("/delivery/payment/list")
	public @ResponseBody Object getMaterialPaymentList(int store_no, String date, int start_page) throws Exception{
		org.json.simple.JSONObject json = service.getMaterialPaymentList(store_no, date, start_page);
		return json;
	}
	
	@RequestMapping("/delivery/payment/detail/list")
	public @ResponseBody Object getMaterialPaymentDetailList(int material_payment_no) throws Exception{
		org.json.simple.JSONObject json = service.getMaterialPaymentDetailList(material_payment_no);
		return json;
	}
	
	@RequestMapping(value = "/delivery/Order")
	public void setStorePOST(HttpServletRequest req, Model model) throws Exception{
		StoreDTO storeDto = (StoreDTO)req.getSession().getAttribute("store_dto");
		int store_no = storeDto.getStore_no();
		MemberDTO memberDto = (MemberDTO)req.getSession().getAttribute("member_dto");
		model.addAttribute("cartlist", service.showmaterialConfirm(memberDto.getMember_no()));
	}
	
	/**
	  * @author ������
	  *	 
	  */
	@RequestMapping(value="/delivery/Delivery")
	public String Delivery(Model model, HttpServletRequest req) throws Exception {	
		model.addAttribute("materialcoffee",service.showmaterial_coffee());
		model.addAttribute("materialcake",service.showmaterial_cake());
		return "/delivery/Delivery";
	}
	
	/**
	  * @author ������
	  *	 
	  */
	@RequestMapping(value="/list.cart",method=RequestMethod.POST)
	public @ResponseBody Object getCartList(HttpServletRequest req){
		logger.info("����Ʈ �˴ϱ�??");
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
	  * @author ������
	  *	 checkCart ����Ʈ�� ���� ����� ���� �� �� upDateCart�� �ѷ��ְ�
	  *	 ���� ����� ���� ���� ���� �� insertCart�� �ѷ��ش�.
	  */
	@RequestMapping(value="/insert.cart", method=RequestMethod.POST)
	public @ResponseBody Object insertCart(HttpServletRequest req, int material_no, int material_cnt){
		logger.info("�μ�Ʈ �˴ϱ�?");
		MemberDTO member_dto = (MemberDTO)(req.getSession().getAttribute("member_dto"));
		MaterialCartDTO cartdto = new MaterialCartDTO();
		cartdto.setMember_no(member_dto.getMember_no());
		cartdto.setMaterial_no(material_no);
		cartdto.setMaterial_count(material_cnt);
		System.out.println(cartdto.toString());
		boolean check = cartservice.checkCart(cartdto);
	
		//�μ�Ʈ�� ��
		if(check == false){
			cartservice.insertCart(cartdto);
		}
		//update�� ��
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
	  * @author ������
	  *	 
	  */
	@RequestMapping("/update.cart")
	public @ResponseBody Object updateCart(HttpServletRequest req){
		logger.info("������Ʈ �˴ϱ�?");
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
	  * @author ������
	  *	 
	  */
	@RequestMapping("/delete.cart")
	public @ResponseBody Object deleteCart(HttpServletRequest req){
		logger.info("���� �˴ϱ�?");
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
	  * @author ������
	  *	 
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
