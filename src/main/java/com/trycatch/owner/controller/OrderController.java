package com.trycatch.owner.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trycatch.owner.domain.MemberDTO;
import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.service.OrderService;

@Controller
public class OrderController {
	@Inject
	private OrderService orderService;
	
	/**
	 * @author ������
	 * ajax �� ������ ����� �̿��� Ŭ���̾�Ʈ�� �ֹ��� ������ DB���� ȣ��
	 * @category Ajax
	 * @param store_no
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/client_order_list/order")
	public @ResponseBody Object setStorePOST(HttpServletRequest req, int start_Page, String search_order_info) throws Exception{
		MemberDTO memberDto = (MemberDTO)req.getSession().getAttribute("member_dto");
		StoreDTO storeDto = (StoreDTO)req.getSession().getAttribute("store_dto");
		JSONObject jsonRoot = new JSONObject();
		boolean asce = false;
		if(req.getParameter("asce") != null){
			asce = true;
		}
		jsonRoot.put("orderList", orderService.getOrder_Information(memberDto.getMember_no(), storeDto.getStore_no(), start_Page, asce, search_order_info));
		return jsonRoot;
	}
}
