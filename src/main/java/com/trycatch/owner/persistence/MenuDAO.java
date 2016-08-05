/*
 * 	Interface: MenuDAO
 *  Description: Menu Table과의 DB작업을 하기 위한 인터페이스
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.persistence;

import java.util.List;
import com.trycatch.owner.domain.MenuDTO;

public interface MenuDAO {
	public MenuDTO getMenu_withMenu_num(int menu_num);
	public List<String> getMenuCategoryList();
	public List<String> getMenuName_withCategory_Name(String category_name);
}
