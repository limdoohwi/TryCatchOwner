/*
 * 	Class: MaterialCartServiceImpl
 *  Description: MaterialCartService 를 상속 받는 클래스로서 MaterialCartDAO에 직접적인 연결을 담당하는 클래스
 *  Created: 2016­08­04
 *	Author: 손현민
 */
package com.trycatch.owner.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.trycatch.owner.domain.MaterialCartDTO;
import com.trycatch.owner.persistence.MaterialCartDAO;


@Service
public class MaterialCartServiceImpl implements MaterialCartService {
	@Inject
	private MaterialCartDAO cartdao;
	/**
	 * @author 손현민
	 * 카트리스트를 가져오는 함수
	 */
	@Override
	public List<MaterialCartDTO> getCartList(MaterialCartDTO cartdto) {
		return cartdao.getCartList(cartdto);
	}
	/**
	 * @author 손현민
	 * 카트에 담겨져있는지 확인하는 함수
	 */
	@Override
	public boolean checkCart(MaterialCartDTO cartdto) {
		return cartdao.checkCart(cartdto);
	}
	/**
	 * @author 손현민
	 * 카트에 재료를 추가하는 함수
	 */
	@Override
	public boolean insertCart(MaterialCartDTO cartdto) {
		return cartdao.insertCart(cartdto);
	} 
	/**
	 * @author 손현민
	 * 카트에 재료를 변경하는 함수
	 */
	@Override
	public boolean updateCart(MaterialCartDTO cartdto) {
		return cartdao.updateCart(cartdto);
	}
	/**
	 * @author 손현민
	 * 카트에 재료를 삭제하는 함수
	 */
	@Override
	public boolean deleteCart(MaterialCartDTO cartdto) {
		return cartdao.deleteCart(cartdto);
	}
	

}
