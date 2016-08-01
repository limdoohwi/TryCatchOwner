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
	@Override
	public List<MaterialCartDTO> getCartList(MaterialCartDTO cartdto) {
		System.out.println("���Դ�?");
		System.out.println(cartdao.getCartList(cartdto).isEmpty() +"*****************************");
		return cartdao.getCartList(cartdto);
	}
	@Override
	public boolean checkCart(MaterialCartDTO cartdto) {
		System.out.println("check ���Դ�?");
		return cartdao.checkCart(cartdto);
	}
	
	@Override
	public boolean insertCart(MaterialCartDTO cartdto) {
		System.out.println("Insert ���Դ�?");
		return cartdao.insertCart(cartdto);
	} 
	@Override
	public boolean updateCart(MaterialCartDTO cartdto) {
		System.out.println("update ���Դ�?");
		return cartdao.updateCart(cartdto);
	}

	@Override
	public boolean deleteCart(MaterialCartDTO cartdto) {
		return cartdao.deleteCart(cartdto);
	}
	

}
