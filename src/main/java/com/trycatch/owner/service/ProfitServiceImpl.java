package com.trycatch.owner.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.trycatch.owner.domain.ProfitMonthDTO;
import com.trycatch.owner.persistence.MenuDAO;
import com.trycatch.owner.persistence.ProfitDAO;

@Service
public class ProfitServiceImpl implements ProfitService {
	@Inject
	private ProfitDAO dao;
	@Inject
	private MenuDAO menuDao;
	
	@Inject
	private DataSourceTransactionManager transactionManager;
	private DefaultTransactionDefinition transaction = new DefaultTransactionDefinition();
	private TransactionStatus status;
	
	private static final Logger logger = LoggerFactory.getLogger(ProfitServiceImpl.class);
		
	@Override
	public List<ProfitMonthDTO> getMonthProfit(int store_no, int member_no) {
		logger.info("ProfitServiceImpl 시작");
		logger.info("ProfitServiceImpl 매장 번호 : " + store_no);
		logger.info("ProfitServiceImpl 회원 번호 : " + member_no);
		
		List<String> menuCategoryList = menuDao.getMenuCategoryList();
		logger.info("ProfitServiceImpl menuCategoryList size : " + menuCategoryList.size());
		Map<String, Integer> map = new HashMap<>();
		for(int i=0; i<menuCategoryList.size(); i++){
			logger.info("ProfitServiceImpl " + i + "번째 메뉴 카테고리 이름 : " + menuCategoryList.get(i));
			map.put(menuCategoryList.get(i), 0);
		}
		List<ProfitMonthDTO> profitResultList = new ArrayList<>();
		for(int month=0; month<12; month++){
			List<ProfitMonthDTO> profitList = dao.getMonthProfit(store_no, member_no, month+1);
			logger.info("ProfitServiceImpl profitList size : " + profitList.size());
			ProfitMonthDTO dto = new ProfitMonthDTO();
			dto.setMonth(month+1);
			if(!profitList.isEmpty()){
				for(int i=0; i<map.size(); i++){
					for(int j=0; j<profitList.size(); j++){
						if(menuCategoryList.get(i).equals(profitList.get(j).getMenu_category_name())){
							map.replace(menuCategoryList.get(i) ,map.get(menuCategoryList.get(i)), profitList.get(j).getTotal_price());
						}
					}
				}
				dto.setProfitMap(map);
				map.clear();
			}
			profitResultList.add(dto);
		}
		return profitResultList;
	}
}
