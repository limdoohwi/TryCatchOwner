package com.trycatch.owner.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.trycatch.owner.domain.MaterialCartDTO;
import com.trycatch.owner.domain.MaterialDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;
import com.trycatch.owner.persistence.MaterialCartDAO;
import com.trycatch.owner.persistence.MaterialDAO;
import com.trycatch.owner.persistence.OrderDAO;

@Service
public class MaterialServiceImpl implements MaterialService {

	@Inject
	private MaterialDAO dao;
	@Inject
	private MaterialCartDAO materialcartdao;
	@Inject
	private OrderDAO orderDao;

	@Override
	public List<MaterialDTO> showmaterial_coffee() {
		return dao.showmaterial_coffee();
	}

	@Override
	public List<MaterialDTO> showmaterial_cake() {
		return dao.showmaterial_cake();
	}
	
	@Override
	public List<MaterialCartDTO> showmaterialConfirm(int member_no) {
		MaterialCartDTO cartdto = new MaterialCartDTO();
		cartdto.setMember_no(member_no);
		return materialcartdao.getCartList(cartdto);
	}
	
	@Override
	public List<MaterialPaymentDTO> insert_materialpayment(int store_no,int member_no) {
		MaterialCartDTO cartdto = new MaterialCartDTO();
		cartdto.setMember_no(member_no);
		List<MaterialCartDTO> cartlist=materialcartdao.getCartList(cartdto);
		List<MaterialPaymentDTO> paymentlist = new ArrayList();
		for(int i=0; i < cartlist.size();i++){
			MaterialPaymentDTO dto = new MaterialPaymentDTO();
		}
		return null;
	}
	
	@Override
	public JSONObject getMaterialPaymentList(int store_no, String date, int start_page) {
		JSONObject json = new JSONObject();
		json.put("materialPaymentList", orderDao.getMaterialPaymentList(store_no, date, start_page));
		return json;
	}
	
	@Override
	public JSONObject getMaterialPaymentDetailList(int material_payment_no) throws Exception {
		JSONObject json = new JSONObject();
		json.put("materialPaymentDetailList", orderDao.getMaterialPaymentDetailList(material_payment_no));
		return json;
	}
}