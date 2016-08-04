/*
 * 	Class: StoreController
 *  Description: tryowner 웹서비스에 접속할 시 해당 점장의 보유 매장 리스트 호출 및 매장 변경을 담당하는 Controller
 *  Created: 2016­07­27
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-27 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	/**
	 * @author 김준혁
	 * 현재 접속한 클라이언트가 타 매장으로 변경할 시 호출되는 메서드
	 */
	@RequestMapping("/set/owner_store")
	public @ResponseBody boolean setStorePOST(int store_no, HttpServletRequest req) throws Exception{
		StoreDTO dto = service.getStore_store_no(store_no);
		logger.info("setOwnerStor : " + dto.equals(null));
		if(dto == null){
			return false;
		}
		if(req.getSession().getAttribute("store_dto") != null){
			req.getSession().removeAttribute("store_dto");
		}
		req.getSession().setAttribute("store_dto", dto);
		return true;
	}
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 접속한 클라이언트의 보유 매장 리스트를 호출
	 */
	@RequestMapping("/findownerstore")
	public @ResponseBody Object findownerstorelist(int member_no) throws Exception{
		JSONObject json = new JSONObject();
		json.put("storelist", service.getStoreList_member_no(member_no));
		return json;
	}
}
