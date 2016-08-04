/*
 * 	Class: StoreService
 *  Description: StoreDAOImpl에서 받아온 Data를 가공하기 위한 인터페이스
 *  Created: 2016­07­27
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-27 by Try{}Catch
 *
 *	Revisions:
 */


package com.trycatch.owner.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import com.trycatch.owner.domain.StoreDTO;

public interface StoreService {
	public StoreDTO getStore_store_no(int store_no) throws Exception;
	public List<StoreDTO> getStoreList_member_no(int member_no) throws Exception;
}
