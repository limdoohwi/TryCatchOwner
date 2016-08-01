package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.MaterialDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;

public interface MaterialDAO {
	public List<MaterialDTO> showmaterial_coffee();
	public List<MaterialDTO> showmaterial_cake();
	public MaterialPaymentDTO getNowMaterialPayment();
}
