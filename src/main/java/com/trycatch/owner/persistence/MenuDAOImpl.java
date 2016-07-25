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
	
	@Override
	public MenuDTO getMenu_withMenu_num(int menu_num) {
		try {
			return sqlSession.selectOne(NAMESPACE + ".getMenu_withMenu_num", menu_num);
		} catch (Exception err) {
			return null;
		}
	}
}
