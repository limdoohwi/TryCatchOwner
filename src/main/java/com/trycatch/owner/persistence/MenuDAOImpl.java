/*
 * 	Class: MenuDAOImpl
 *  Description: Menu Table과의 DB작업을 하기 위한 Repository
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.persistence;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.MenuDTO;


@Repository
public class MenuDAOImpl implements MenuDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.menuMapper";
	
	/**
	 * @author 김준혁
	 * 메뉴번호를 통해 해당 메뉴 정보를 호출
	 */
	@Override
	public MenuDTO getMenu_withMenu_num(int menu_num) {
		try {
			return sqlSession.selectOne(NAMESPACE + ".getMenu_withMenu_num", menu_num);
		} catch (Exception err) {
			return null;
		}
	}
	
	/**
	 * @author 김준혁
	 * Menu_Category Table에 저장된 메뉴 카테도리 레코드 호출
	 */
	@Override
	public List<String> getMenuCategoryList() {
		return sqlSession.selectList(NAMESPACE+".getMenuCategoryList");
	}
	
	/**
	 * @author 김준혁
	 * 카테고리 이름을 통해 해당 카테고리 안에 분류 되어있는 메뉴 리스트를 호출 
	 */
	@Override
	public List<String> getMenuName_withCategory_Name(String category_name) {
		try {
			return sqlSession.selectList(NAMESPACE + ".getMenuName_withCategory_Name", category_name);
		} catch (Exception err) {
			return null;
		}
	}
}
