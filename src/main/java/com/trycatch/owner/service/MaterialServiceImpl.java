/*
 * 	Class: MaterialServiceImpl
 *  Description: MaterialService 를 상속 받는 클래스로서 MaterialDAO에 직접적인 연결을 담당하는 클래스
 *  Created: 2016­08­04
 *	Author: 손현민
 */
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
	/**
	 * @author 손현민
	 * DB에 있는 커피재료 리스트로 가져오는 함수
	 */
	@Override
	public List<MaterialDTO> showmaterial_coffee() {
		return dao.showmaterial_coffee();
	}
	/**
	 * @author 손현민
	 * DB에 있는 케이크재료 리스트로 가져오는 함수
	 */
	@Override
	public List<MaterialDTO> showmaterial_cake() {
		return dao.showmaterial_cake();
	}
	/**
	 * @author 손현민
	 * 주문하기전 카트리스트를 확인하는 함수
	 */
	@Override
	public List<MaterialCartDTO> showmaterialConfirm(int member_no) {
		MaterialCartDTO cartdto = new MaterialCartDTO();
		cartdto.setMember_no(member_no);
		return materialcartdao.getCartList(cartdto);
	}
	/**
	 * @author 손현민
	 * 주문한 재료를 저장하는 함수
	 */
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
	/**
	 * @author 손현민
	 * 재료주문내역를 확인하기위해 받아오는 함수
	 */
	@Override
	public JSONObject getMaterialPaymentList(int store_no, String date, int start_page) {
		JSONObject json = new JSONObject();
		json.put("materialPaymentList", orderDao.getMaterialPaymentList(store_no, date, start_page));
		return json;
	}
	/**
	 * @author 손현민
	 * 재료주문내역의 재료들을 가져오는 함수
	 */
	@Override
	public JSONObject getMaterialPaymentDetailList(int material_payment_no) throws Exception {
		JSONObject json = new JSONObject();
		json.put("materialPaymentDetailList", orderDao.getMaterialPaymentDetailList(material_payment_no));
		return json;
	}
}