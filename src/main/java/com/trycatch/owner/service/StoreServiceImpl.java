/*
 * 	Class: StoreServiceImpl
 *  Description: StoreDAOImpl에서 받아온 Data를 가공하기 위한 Service
 *  Created: 2016­07­27
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-27 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.trycatch.owner.domain.StoreDTO;
import com.trycatch.owner.persistence.StoreDAO;

@Service
public class StoreServiceImpl implements StoreService {
	@Inject
	private StoreDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(StoreServiceImpl.class);
	
	/**
	 * @author 김준혁
	 * 매장 번호를 통해 매장 정보를 호출
	 */
	@Override
	public StoreDTO getStore_store_no(int store_no) throws Exception {
		logger.info("StoreServiceImpl : " + store_no);
		return dao.getStore_store_no(store_no);
	}
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 접속한 클라이언트의 보유 매장 리스트 호출
	 */
	@Override
	public List<StoreDTO> getStoreList_member_no(int member_no) throws Exception {
		return dao.getStoreList_member_no(member_no);
	}
}
