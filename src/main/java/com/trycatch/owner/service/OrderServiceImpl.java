package com.trycatch.owner.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.trycatch.owner.domain.MenuDTO;
import com.trycatch.owner.domain.Order_InformationDTO;
import com.trycatch.owner.persistence.MenuDAO;
import com.trycatch.owner.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	@Inject
	private OrderDAO dao;
	@Inject
	private MenuDAO menuDao;
	
	@Inject
	private DataSourceTransactionManager transactionManager;
	private DefaultTransactionDefinition transaction = new DefaultTransactionDefinition();
	private TransactionStatus status;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);
		
	@Override
	public List<Order_InformationDTO> getOrder_Information(int member_no, int start_Page, boolean asce, String search_order_info) {
		transaction.setName("owner_order_transaction");
		transaction.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		status = transactionManager.getTransaction(transaction);
		String[] menu_name;
		MenuDTO menuDto = null;
		try {
			List<Order_InformationDTO> list = dao.getOrder_Information(member_no, start_Page, asce, search_order_info);
			logger.info("리스트 사이즈좀 알아보자 : " + list.size());
			for(int i=0; i<list.size(); i++){
				menu_name = new String[list.get(i).getMenu_no().length];
				for(int j=0; j<list.get(i).getMenu_no().length; j++){
					int menu_num = Integer.parseInt((list.get(i).getMenu_no()[j]));
					logger.info("메뉴 번호 : " + menu_num);
					menuDto = menuDao.getMenu_withMenu_num(menu_num);
					menu_name[j] = menuDto.getMenu_name();
				}
				logger.info("메뉴 : " + menu_name.length + ", " + list.get(i).getMenu_count().length + ", " + list.get(i).getMenu_option().length);
				list.get(i).setMenu_total_list(menu_name, list.get(i).getMenu_count(), list.get(i).getMenu_option());
				list.get(i).setMenu_simple_list(list.get(i).getMenu_total_list().substring(0, 9) + "...");
			}
			transactionManager.commit(status);
			return list;
		} catch (Exception err) {
			err.printStackTrace();
			transactionManager.rollback(status);
			return null;
		}
	}
}
