/*
 * 	Class: ProfitDAOImpl
 *  Description: Menu_Payment, Menu_Order Table를 join하여  DB작업을 하기 위한 Repository
 *  Created: 2016­07­30
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-30 by Try{}Catch
 *
 *	Revisions:
 *  1. When & Who : 2016-07-31 by 김준혁
 *  2. What		  : getDayAverageReservationDrink(), getYearMenuPercentager(),
 *  				getMonthMenuPercentager(),	isExistProfit(),
 *  				getMenuCountAndPrice() 추가
 */


package com.trycatch.owner.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.MenuProfitDTO;
import com.trycatch.owner.domain.ProfitMonthDTO;
import com.trycatch.owner.domain.ProfitYearDTO;

@Repository
public class ProfitDAOImpl implements ProfitDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.trycatch.owner.mappers.profitMapper";
	private static final Logger logger = LoggerFactory.getLogger(ProfitDAOImpl.class);

	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 월별 매출액 호출(Main.jsp)
	 */
	@Override
	public List<ProfitMonthDTO> getMonthProfit(int store_no, int member_no, int month) {
		Map<String, Integer> map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("member_no", member_no);
		map.put("month", month);
		try {
			return sqlSession.selectList(NAMESPACE + ".getMonthProfit", map);
		} catch (Exception err) {
			return null;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 연도별 매출액 호출(Main.jsp)
	 */
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
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 연도별 총 매출액 호출
	 */
	@Override
	public int getYearTotalPrice(int store_no, int year) {
		Map<String, Integer> map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("year", year);
		try {
			return sqlSession.selectOne(NAMESPACE + ".getYearTotalPrice", map);
		} catch (Exception err) {
			return 0;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 입력된 연도를 기준으로 2년전 매출액과 입력된 연도의 매출액 호출
	 */
	@Override
	public int getYearsTotalPrice(int store_no, int year) {
		Map map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("year", year);
		try {
			return sqlSession.selectOne(NAMESPACE + ".getYearsTotalPrice", map);
		} catch (Exception err) {
			return 0;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 월별 매출액 호출
	 */
	@Override
	public ProfitMonthDTO getMonthTotalPrice(int store_no, int month, int year) {
		Map<String, Integer> map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("month", month);
		map.put("year", year);
		try {
			return sqlSession.selectOne(NAMESPACE + ".getMonthTotalPrice", map);
		} catch (Exception err) {
			return null;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 연도별 음료 주문 건수 호출
	 */
	@Override
	public int getYearReservationDrink(int store_no, int year) {
		Map<String, Integer> map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("year", year);
		try {
			return sqlSession.selectOne(NAMESPACE + ".getYearReservationDrink", map);
		} catch (Exception err) {
			return 0;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 월별 음료 주문 건수 호출
	 */
	@Override
	public int getMonthReservationDrink(int store_no, int month, int year) {
		Map<String, Integer> map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("month", month);
		map.put("year", year);
		try {
			return sqlSession.selectOne(NAMESPACE + ".getMonthReservationDrink", map);
		} catch (Exception err) {
			return 0;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 일일 평균 음료 주문 건수 호출
	 */
	@Override
	public int getDayAverageReservationDrink(int store_no, int hour, int year) {
		Map<String, Integer> map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("hour", hour);
		map.put("year", year);
		try {
			return sqlSession.selectOne(NAMESPACE + ".getDayAverageReservationDrink", map);
		} catch (Exception err) {
			return 0;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 오늘 날짜에 들어온 음료 주문 내역 리스트를 호출
	 */
	@Override
	public int getDayto_Curdate_withThisYear(String thisYear) {
		try {
			return sqlSession.selectOne(NAMESPACE + ".getDayto_Curdate_withThisYear", thisYear);
		} catch (Exception err) {
			return 0;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 해당 연도 카테고리 별 판매율 호출
	 */
	@Override
	public int getYearMenuPercentager(int store_no, String category_name, int year, int month) {
		logger.info(category_name);
		Map map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("category_name", category_name);
		map.put("year", year);
		map.put("month", month);
		try {
			return sqlSession.selectOne(NAMESPACE + ".getYearMenuPercentager", map);
		} catch (Exception err) {
			return 0;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 해당 연도 월별 카테고리 별 판매율 호출
	 */
	@Override
	public int getMonthMenuPercentager(int store_no, String category_name, int month) {
		Map map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("category_name", category_name);
		map.put("month", month);
		try {
			return sqlSession.selectOne(NAMESPACE + ".getMonthMenuPercentager", map);
		} catch (Exception err) {
			return 0;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 해당 연도에 매출액이 있는지 검사
	 */
	@Override
	public boolean isExistProfit(int store_no, int year) {
		Map<String, Integer> map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("year", year);
		try {
			sqlSession.selectList(NAMESPACE + ".isExistProfit", map);
			return true;
		} catch (Exception err) {
			return false;
		}
	}
	
	/**
	 * @author 김준혁
	 * 웹서비스에 설정된 해당 매장의 해당 연도에 메뉴별 판매 개수와 판매액 호출
	 */
	@Override
	public MenuProfitDTO getMenuCountAndPrice(int store_no, int year, String menu_name, int month) {
		Map map = new HashMap<>();
		map.put("store_no", store_no);
		map.put("year", year);
		map.put("menu_name", menu_name);
		map.put("month", month);
		try {
			return sqlSession.selectOne(NAMESPACE + ".getMenuCountAndPrice", map);
		} catch (Exception err) {
			return null;
		}
	}
}