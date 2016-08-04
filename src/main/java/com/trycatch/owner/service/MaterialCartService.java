/*
 * 	Interface: MaterialCartService
 *  Description: Controller와 MaterialCartDAO와의 연결을 담당하는 Service 클래스
 *  Created: 2016­08­04
 *	Author: 손현민
 */
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
