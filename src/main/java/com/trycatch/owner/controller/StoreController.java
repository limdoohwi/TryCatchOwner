package com.trycatch.owner.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.service.StoreService;

import net.sf.json.JSONObject;

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
	
	@RequestMapping("/store/search")
	public @ResponseBody Object getStoreList(String store_name) throws Exception{
		StoreDTO dto = new StoreDTO();
		dto.setSearch_store_value(store_name);
		JSONObject store_list = new JSONObject();
		store_list.put("storeList",service.getStoreList(dto));
		return store_list;
	}
}
