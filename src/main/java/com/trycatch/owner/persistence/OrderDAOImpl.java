/*
 * 	Class: OrderDAO
 *  Description: Menu_Payment(음료 예약 주문 결제 내역 테이블), Material_Payment(재료 주문 결제 내역 테이블)과의 DB작업을 하기 위한 Repository
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 *  1. When & Who : 2016-07-31 by 손현민
 *  2. What		  : insertMaterial_Payment(), insertMaterial_Order(),
 *  				getMaterialPaymentList(),	getMaterialPaymentDetailList() 추가
 */

package com.trycatch.owner.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.MaterialOrderDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;
import com.trycatch.owner.domain.MaterialPaymentDetailDTO;
import com.trycatch.owner.domain.Menu_OrderDTO;
import com.trycatch.owner.domain.Order_AlarmDTO;
import com.trycatch.owner.domain.Order_InformationDTO;


@Repository
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.orderMapper";
	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);
	
	/**
	 * @author 김준혁
	 * 현재 웹서비스에 설정된 매장의 음료 주문 결제가 끝난 data 리스트를 호출
	 */
	@Override
	public List<Order_InformationDTO> getOrder_Information(int store_no, int start_Page, boolean asce, String search_order_info) {
		try {
			RowBounds rowB = new RowBounds(start_Page, 5);
			String isAsc = String.valueOf(asce);
			Map<String, Object> map = new HashMap<>();
			map.put("store_no", store_no);
			map.put("isAsc", isAsc);
			map.put("search_order_info", search_order_info);
			return sqlSession.selectList(NAMESPACE + ".getOrder_Information", map, rowB);
		} catch (Exception err) {
			return null;
		}
	}
	
	/**
	 * @author 손현민
	 * 재료주문내역를 저장하는 함수
	 */
	@Override
	public boolean insertMaterial_Payment(MaterialPaymentDTO dto) {
		System.out.println(dto.getMaterial_total_price() + ",,,,," + dto.getMember_no() + ",,,," + dto.getStore_no());
		try {
			sqlSession.insert(NAMESPACE + ".insertMaterial_Payment", dto);
			return true;
		} catch (Exception err) {
			return false;
		}
	}	
	/**
	 * @author 손현민
	 * 주문한 재료를 저장하는 함수
	 */
	@Override
	public boolean insertMaterial_Order(MaterialOrderDTO dto) {
		Map map = new HashMap();
		map.put("material_payment_no", dto.getMaterial_payment_no());
		try {
			for(int i=0; i<dto.getMaterial_nos().length; i++){
				int[] num = dto.getMaterial_nos();
				int[] count = dto.getMaterial_counts();
				map.put("material_no", num[i]);
				map.put("material_count", count[i]);
				sqlSession.insert(NAMESPACE + ".insertMaterial_Order", map);
			}
			return true;
		} catch (Exception err) {
			sqlSession.rollback();
			return false;
		}
	}
	/**
	 * @author 손현민
	 * 재료주문내역를 확인하기위해 받아오는 함수
	 */
	@Override
	public List<MaterialPaymentDTO> getMaterialPaymentList(int store_no, String date, int start_page) {
		Map map = new HashMap();
		map.put("store_no", store_no);
		map.put("date", date);
		int end_page = start_page + 5;
		RowBounds row = new RowBounds(start_page, end_page);
		try {
			return sqlSession.selectList(NAMESPACE + ".getMaterialPaymentList", map, row);
		} catch (Exception err) {
			return null;
		}
	}
	/**
	 * @author 손현민
	 * 재료주문내역의 재료들을 가져오는 함수
	 */
	@Override
	public List<MaterialPaymentDetailDTO> getMaterialPaymentDetailList(int material_payment_no) {
		try {
			return sqlSession.selectList(NAMESPACE + ".getMaterialPaymentDetailList", material_payment_no);
		} catch (Exception err) {
			return null;
		}
	}
	
	/**
	 * @author 김준혁
	 * 음료 예약 주문 번호를 통해 주문한 음료 이름, 주문 개수, 옵션을  호출
	 */
	@Override
	public List<Menu_OrderDTO> getMenuOrder_withMenu_Payment_no(int menu_payment_no) {
		try {
			return sqlSession.selectList(NAMESPACE + ".getMenuOrder_withMenu_Payment_no", menu_payment_no);
		} catch (Exception err) {
			return null;
		}
	}

	@Override
	public List<Order_AlarmDTO> getOrderAlarmList(int member_no) {
		return sqlSession.selectList(NAMESPACE+".getOrderAlarmList", member_no);
	}
}