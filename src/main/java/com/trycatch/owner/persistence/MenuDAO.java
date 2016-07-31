package com.trycatch.owner.persistence;

import java.util.List;
import com.trycatch.owner.domain.MenuDTO;




public interface MenuDAO {
	public MenuDTO getMenu_withMenu_num(int menu_num);
	public List<String> getMenuCategoryList();
	public List<String> getMenuName_withCategory_Name(String category_name);
}
