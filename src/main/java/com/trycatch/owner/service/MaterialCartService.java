package com.trycatch.owner.service;

import java.util.List;

import com.trycatch.owner.domain.MaterialCartDTO;

public interface MaterialCartService {
	public List<MaterialCartDTO> getCartList(MaterialCartDTO cartdto);
	public boolean checkCart(MaterialCartDTO cartdto);
	public boolean insertCart(MaterialCartDTO cartdto);
	public boolean updateCart(MaterialCartDTO cartdto);
	public boolean deleteCart(MaterialCartDTO cartdto);
	
}
