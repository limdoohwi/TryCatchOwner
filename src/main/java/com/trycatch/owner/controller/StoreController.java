package com.trycatch.owner.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.service.StoreService;

@Controller
public class StoreController {
	@Inject
	private StoreService service;
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	/**
	 * @author 김준혁
	 * 메인 메뉴 My Store에서 매장 리스트중 하나를 선택했을 때 선택된 매장을 Session에 저장
	 * @category Ajax
	 * @param store_no
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/set/owner_store")
	public @ResponseBody boolean setStorePOST(int store_no, HttpServletRequest req) throws Exception{
		logger.info("선택된 매장 번호(setStorePost) : " + store_no);
		StoreDTO dto = service.getStore_store_no(store_no);
		logger.info("setOwnerStor : " + dto.equals(null));
		if(dto == null){
			return false;
		}
		if(req.getSession().getAttribute("store_dto") != null){
			req.getSession().removeAttribute("store_dto");
		}
		req.getSession().setAttribute("store_dto", dto);
		logger.info("매장 세션에 저장..");
		return true;
	}
}
