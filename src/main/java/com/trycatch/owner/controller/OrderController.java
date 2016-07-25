package com.trycatch.owner.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trycatch.owner.domain.Order_InformationDTO;
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
	@RequestMapping("/client_order_list.order")
	public @ResponseBody Object setStorePOST(HttpServletRequest req) throws Exception{
		StoreDTO storeDto = (StoreDTO)req.getSession().getAttribute("store_dto");
		int store_no = storeDto.getStore_no();
		JSONObject jsonRoot = new JSONObject();
		jsonRoot.put("orderList", orderService.getOrder_Information(store_no));
		return jsonRoot;
	}
}
