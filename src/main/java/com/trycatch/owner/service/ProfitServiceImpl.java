package com.trycatch.owner.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.trycatch.owner.domain.Order_InformationDTO;
import com.trycatch.owner.domain.ProfitMonthDTO;
import com.trycatch.owner.persistence.MenuDAO;
import com.trycatch.owner.persistence.OrderDAO;
import com.trycatch.owner.persistence.ProfitDAO;

@Service
public class ProfitServiceImpl implements ProfitService {
	@Inject
	private ProfitDAO dao;
	
	@Inject
	private DataSourceTransactionManager transactionManager;
	private DefaultTransactionDefinition transaction = new DefaultTransactionDefinition();
	private TransactionStatus status;
	
	private static final Logger logger = LoggerFactory.getLogger(ProfitServiceImpl.class);
		
	@Override
	public List<ProfitMonthDTO> getMonthProfit(int store_no, int member_no) {
		List<ProfitMonthDTO> list = dao.getMonthProfit(store_no, member_no);
		List<ProfitMonthDTO> resultList = null;
		for(int i=0; i<list.size()-1; i++){
			Map map = new HashMap<>();
			map.put("category_name", list.get(i).getMenu_category_name());
			map.put("total_price", list.get(i).getTotal_price());
			if(i+1 < list.size()){
				if(list.get(i).getMonth() == list.get(i+1).getMonth()){
					map.put("category_name", list.get(i+1).getMenu_category_name());
					map.put("total_price", list.get(i+1).getTotal_price());
				}
			}
			list.get(i).setProfitMap(map);
			resultList.add(list.get(i));
		}
	}
}
