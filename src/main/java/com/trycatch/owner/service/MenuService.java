/*
 * 	Interface: MenuService
 *  Description: MenuDAOImpl에서 받아온 Data를 가공하기 위한 인터페이스
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.service;

import java.util.List;


public interface MenuService {
	public List<String> getMenuCategoryList();
}
