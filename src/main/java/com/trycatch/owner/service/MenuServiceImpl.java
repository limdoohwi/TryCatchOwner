package com.trycatch.owner.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.trycatch.owner.persistence.MenuDAO;
@Service
public class MenuServiceImpl implements MenuService {
	@Inject
	private MenuDAO dao;
	
	@Override
	public List<String> getMenuCategoryList() {
		return dao.getMenuCategoryList();
	}
}
