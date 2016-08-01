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

import com.trycatch.owner.domain.MaterialCartDTO;
import com.trycatch.owner.domain.MaterialOrderDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;
import com.trycatch.owner.domain.MenuDTO;
import com.trycatch.owner.domain.Order_InformationDTO;
import com.trycatch.owner.persistence.MaterialCartDAO;
import com.trycatch.owner.persistence.MaterialDAO;
import com.trycatch.owner.persistence.MenuDAO;
import com.trycatch.owner.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {
	@Inject
	private OrderDAO dao;
	@Inject
	private MenuDAO menuDao;
	@Inject
	private MaterialDAO materialDao;
	@Inject
	private MaterialCartDAO cartDao;
	
	@Inject
	private DataSourceTransactionManager transactionManager;
	private DefaultTransactionDefinition transaction = new DefaultTransactionDefinition();
	private TransactionStatus status;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);
		
	@Override
	public List<Order_InformationDTO> getOrder_Information(int member_no) {
		transaction.setName("owner_order_transaction");
		transaction.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		status = transactionManager.getTransaction(transaction);
		String[] menu_name;
		MenuDTO menuDto = null;
		try {
			List<Order_InformationDTO> list = dao.getOrder_Information(member_no);
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
			}
			transactionManager.commit(status);
			return list;
		} catch (Exception err) {
			err.printStackTrace();
			transactionManager.rollback(status);
			return null;
		}
	}
	
	@Override
	public boolean insertMaterial_Payment(MaterialPaymentDTO dto, MaterialOrderDTO orderDto) {
		try{
			System.out.println(dao.insertMaterial_Payment(dto) + "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
			MaterialPaymentDTO materialDto = materialDao.getNowMaterialPayment();
			System.out.println("페이먼트 넘버좀 가져와봐 : " + materialDto.getMaterial_payment_no());
			MaterialCartDTO cart = new MaterialCartDTO();
			cart.setMember_no(dto.getMember_no());
			cartDao.deleteCart(cart);
			orderDto.setMaterial_payment_no(materialDto.getMaterial_payment_no());
			System.out.println("시발 : " + dao.insertMaterial_Order(orderDto));
			return true;
		}catch(Exception err){
			return false;
		}
	}
}
