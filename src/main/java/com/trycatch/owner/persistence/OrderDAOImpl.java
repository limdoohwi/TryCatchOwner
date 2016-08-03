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
import com.trycatch.owner.domain.Order_InformationDTO;


@Repository
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.orderMapper";
	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);
	
	@Override
	public List<Order_InformationDTO> getOrder_Information(int menu_payment_no, int member_no, int store_no, int start_Page, boolean asce, String search_order_info) {
		logger.info("OrderDaoImpl 회원 번호 : " + member_no);
		logger.info("OrderDaoImpl 매장 번호 : " + store_no);
		logger.info("OrderDaoImpl 써치 : " + search_order_info);
		try {
			int end_Order = start_Page + 5;
			RowBounds rowB = new RowBounds(start_Page, end_Order);
			String isAsc = String.valueOf(asce);
			Map map = new HashMap<>();
			map.put("member_no", member_no);
			map.put("store_no", store_no);
			map.put("isAsc", isAsc);
			map.put("search_order_info", search_order_info);
			map.put("menu_payment_no", menu_payment_no);
			return sqlSession.selectList(NAMESPACE + ".getOrder_Information", map, rowB);
		} catch (Exception err) {
			return null;
		}
	}
	
	@Override
	public List<Integer> getMenu_Payment_noList(int store_no) {
		try {
			return sqlSession.selectList(NAMESPACE + ".getMenu_Payment_noList", store_no);
		} catch (Exception err) {
			return null;
		}
	}
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
	
	@Override
	public boolean insertMaterial_Order(MaterialOrderDTO dto) {
		Map map = new HashMap();
		map.put("material_payment_no", dto.getMaterial_payment_no());
		try {
			for(int i=0; i<dto.getMaterial_nos().length; i++){
				int[] num = dto.getMaterial_nos();
				int[] count = dto.getMaterial_counts();
				System.out.println("메터리얼넘버랑 카운트 : " + num[i] + ": " + count[i]);
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
	
	@Override
	public List<MaterialPaymentDetailDTO> getMaterialPaymentDetailList(int material_payment_no) {
		try {
			return sqlSession.selectList(NAMESPACE + ".getMaterialPaymentDetailList", material_payment_no);
		} catch (Exception err) {
			return null;
		}
	}
}