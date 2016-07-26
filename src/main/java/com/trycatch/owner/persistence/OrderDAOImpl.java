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

import com.trycatch.owner.domain.Order_InformationDTO;


@Repository
public class OrderDAOImpl implements OrderDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.orderMapper";
	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);
	
	@Override
	public List<Order_InformationDTO> getOrder_Information(int member_no, int store_no, int start_Page, boolean asce, String search_order_info) {
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
			return sqlSession.selectList(NAMESPACE + ".getOrder_Information", map, rowB);
		} catch (Exception err) {
			return null;
		}
	}
}