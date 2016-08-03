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

import com.trycatch.owner.domain.MaterialCartDTO;
import com.trycatch.owner.domain.MaterialOrderDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;
import com.trycatch.owner.domain.Menu_OrderDTO;
import com.trycatch.owner.domain.Order_InformationDTO;
import com.trycatch.owner.persistence.MaterialCartDAO;
import com.trycatch.owner.persistence.MaterialDAO;
import com.trycatch.owner.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	@Inject
	private OrderDAO dao;
	@Inject
	private MaterialCartDAO cartDao;
	@Inject
	private MaterialDAO materialDao;
	
	@Inject
	private DataSourceTransactionManager transactionManager;
	private DefaultTransactionDefinition transaction = new DefaultTransactionDefinition();
	private TransactionStatus status;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);
		
	@Override
	public List<Order_InformationDTO> getOrder_Information(int store_no, int start_Page, boolean asce, String search_order_info) {
		transaction.setName("owner_order_transaction");
		transaction.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		status = transactionManager.getTransaction(transaction);
		try {
			List<Order_InformationDTO> orderInfoList = dao.getOrder_Information(store_no, start_Page, asce, search_order_info);
			for(int i=0; i<orderInfoList.size(); i++){
				List<Menu_OrderDTO> orderList = dao.getMenuOrder_withMenu_Payment_no(orderInfoList.get(i).getMenu_payment_no());
				String menu_total_list = "";
				for(int j=0; j<orderList.size(); j++){
					if(j==0){
						String menu_simple_list = orderList.get(j).getMenu_name() + "/" + orderList.get(j).getMenu_count() + "��/" + orderList.get(j).getMenu_option() + ".....";
						orderInfoList.get(i).setMenu_simple_list(menu_simple_list);
					}
					menu_total_list +=  orderList.get(j).getMenu_name() + "/" + orderList.get(j).getMenu_count() + "��/" + orderList.get(j).getMenu_option() + ", ";
				}
				orderInfoList.get(i).setMenu_total_list(menu_total_list);
			}
			transactionManager.commit(status);
			return orderInfoList;
		} catch (Exception err) {
			err.printStackTrace();
			transactionManager.rollback(status);
			return null;
		}
	}
	
	@Override
	public boolean insertMaterial_Payment(MaterialPaymentDTO dto, MaterialOrderDTO orderDto) {
		try{
			//System.out.println(dao.insertMaterial_Payment(dto) + "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
			MaterialPaymentDTO materialDto = materialDao.getNowMaterialPayment();
			MaterialCartDTO cart = new MaterialCartDTO();
			cart.setMember_no(dto.getMember_no());
			cartDao.deleteCart(cart);
			orderDto.setMaterial_payment_no(materialDto.getMaterial_payment_no());
			return true;
		}catch(Exception err){
			return false;
		}
	}
}
