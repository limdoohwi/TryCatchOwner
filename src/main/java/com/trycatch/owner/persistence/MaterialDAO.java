/*
 * 	Interfate: MaterialDAO 
 *  Description: Material에 관련된 DB연결을 담당하는 Interface
 *  Created: 2016­08­04
 *	Author: 손현민
 */

package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.MaterialDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;

public interface MaterialDAO {
	public List<MaterialDTO> showmaterial_coffee();
	public List<MaterialDTO> showmaterial_cake();
	public MaterialPaymentDTO getNowMaterialPayment();
}
