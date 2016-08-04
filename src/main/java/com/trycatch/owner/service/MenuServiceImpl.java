/*
 * 	Class: MenuServiceImpl
 *  Description: MenuDAOImpl에서 받아온 Data를 가공하기 위한 Service
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 */


package com.trycatch.owner.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.trycatch.owner.persistence.MenuDAO;
@Service
public class MenuServiceImpl implements MenuService {
	@Inject
	private MenuDAO dao;
	
	/**
	 * @author 김준혁
	 * Menu_Category Table에 저장된 메뉴 카테고리 리스트를 호출
	 */
	@Override
	public List<String> getMenuCategoryList() {
		return dao.getMenuCategoryList();
	}
}
