package com.trycatch.owner.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.service.StoreService;

@Controller
public class StoreController {
	@Inject
	private StoreService service;
	
	/**
	 * @author 김준혁
	 * 메인 메뉴 My Store에서 매장 리스트중 하나를 선택했을 때 선택된 매장을 Session에 저장
	 * @category Ajax
	 * @param store_no
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/set.owner_store")
	public @ResponseBody boolean setStorePOST(int store_no, HttpServletRequest req) throws Exception{
		StoreDTO dto = service.getStore_store_no(store_no);
		if(dto == null){
			return false;
		}
		if(req.getSession().getAttribute("store_dto") != null){
			req.getSession().removeAttribute("store_dto");
		}
		req.getSession().setAttribute("store_dto", dto);
		return true;
	}
	@RequestMapping("/findownerstore")
	public @ResponseBody Object findownerstorelist(int member_no) throws Exception{
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&" + member_no);
		JSONObject json = new JSONObject();
		System.out.println(service.getStoreList_member_no(member_no));
		json.put("storelist", service.getStoreList_member_no(member_no));
		return json;
	}
}
