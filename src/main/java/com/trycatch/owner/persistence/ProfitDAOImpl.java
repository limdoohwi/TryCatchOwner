package com.trycatch.owner.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.ProfitMonthDTO;
import com.trycatch.owner.domain.ProfitYearDTO;

@Repository
public class ProfitDAOImpl implements ProfitDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.trycatch.owner.mappers.profitMapper";
	private static final Logger logger = LoggerFactory.getLogger(ProfitDAOImpl.class);

	@Override
	public List<ProfitMonthDTO> getMonthProfit(int store_no, int member_no, int month) {
		Map<String, Integer> map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("member_no", member_no);
		map.put("month", month);
		try {
			return sqlSession.selectList(NAMESPACE + ".getMonthProfit", map);
		} catch (Exception err) {
			logger.info("ProfitDAOImpl 예외 발생 : " + err.getMessage());
			return null;
		}
	}
	
	@Override
	public List<ProfitYearDTO> getYearProfit(int store_no, int member_no, int year) {
		try {
			Map<String, Integer> map = new HashMap<>();
			map.put("store_no", store_no);
			map.put("member_no", member_no);
			map.put("year", year);
			return sqlSession.selectList(NAMESPACE + ".getYearProfit", map);
		} catch (Exception err) {
			return null;
		}
	}
}