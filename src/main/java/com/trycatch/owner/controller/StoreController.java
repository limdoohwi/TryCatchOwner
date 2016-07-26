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
	 * @author ������
	 * ���� �޴� My Store���� ���� ����Ʈ�� �ϳ��� �������� �� ���õ� ������ Session�� ����
	 * @category Ajax
	 * @param store_no
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/set/owner_store")
	public @ResponseBody boolean setStorePOST(int store_no, HttpServletRequest req) throws Exception{
		logger.info("���õ� ���� ��ȣ(setStorePost) : " + store_no);
		StoreDTO dto = service.getStore_store_no(store_no);
		logger.info("setOwnerStor : " + dto.equals(null));
		if(dto == null){
			return false;
		}
		if(req.getSession().getAttribute("store_dto") != null){
			req.getSession().removeAttribute("store_dto");
		}
		req.getSession().setAttribute("store_dto", dto);
		logger.info("���� ���ǿ� ����..");
		return true;
	}
}