package com.trycatch.owner.persistence;

import com.trycatch.owner.domain.MenuDTO;




public interface MenuDAO {
	public MenuDTO getMenu_withMenu_num(int menu_num);
}
