/*
 * 	Interface: MaterialCartDAO 
 *  Description: MaterialCartDAO 를 상속 받는 클래스로서 DB에 직접적인 연결을 담당하는 클래스
 *  Created: 2016­08­04
 *	Author: 손현민
 */

package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.MaterialCartDTO;

public interface MaterialCartDAO {
	public List<MaterialCartDTO> getCartList(MaterialCartDTO cartdto);
	public boolean checkCart(MaterialCartDTO cartdto);
	public boolean insertCart(MaterialCartDTO cartdto);
	public boolean updateCart(MaterialCartDTO cartdto);
	public boolean deleteCart(MaterialCartDTO cartdto);
}
