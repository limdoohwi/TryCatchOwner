package com.trycatch.owner.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

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
	public List<Order_InformationDTO> getOrder_Information(int member_no, int store_no, int start_Page, boolean asce, String search_order_info) {
		transaction.setName("owner_order_transaction");
		transaction.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		status = transactionManager.getTransaction(transaction);
		try {
			List<Integer> numberList = dao.getMenu_Payment_noList(store_no);
			List<Order_InformationDTO> list = null;
			List<Order_InformationDTO> resultList = new ArrayList();

			int menu_payment_no = 0;
			for(int i=0; i<numberList.size(); i++){
				menu_payment_no = numberList.get(i);
				list = dao.getOrder_Information(menu_payment_no, member_no, store_no, start_Page, asce, search_order_info);
				for(int j=0; ; j++){
					if(j==0){
						list.get(j).setMenu_total_list(list.get(j).getMenu_name() + "/" + list.get(j).getMenu_count() +"¿‹/" + list.get(j).getMenu_option() +",");
					}
					if(j+1 >= list.size()){
						j = 0;
						resultList.add(list.get(j));
						break;
					}
					list.get(0).setMenu_total_list(list.get(0).getMenu_total_list() + list.get(j+1).getMenu_name() + "/" + list.get(j+1).getMenu_count() +"¿‹/" + list.get(j+1).getMenu_option() +",");
				}
			}
			transactionManager.commit(status);
			return resultList;
		} catch (Exception err) {
			err.printStackTrace();
			transactionManager.rollback(status);
			return null;
		}
	}
}
