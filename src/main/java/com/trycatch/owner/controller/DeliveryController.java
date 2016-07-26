package com.trycatch.owner.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes
public class DeliveryController {
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryController.class);

	@RequestMapping(value = "/delivery/Order_list", method = RequestMethod.GET)
	public void orderlist(Model model, HttpServletRequest req) throws Exception {
	}
	
	@RequestMapping(value="/delivery/Delivery", method=RequestMethod.GET)
		public String Delivery(Model model) throws Exception {
			
			model.addAttribute("cart", new ArrayList<com.trycatch.owner.persistence.Goods>());  // 모든 데이터를 jsp로 전송
			return "/delivery/Delivery"; 
		}

		@RequestMapping(value="/delivery/add", method = RequestMethod.POST)
		public String add(@ModelAttribute  com.trycatch.owner.persistence.Goods goods) {
			return "redirect:/";
		}
}
