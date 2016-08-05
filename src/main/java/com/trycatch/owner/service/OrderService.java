/*
 * 	Interface: OrderService
 *  Description: OrderDAOImpl에서 받아온 Data를 가공하기 위한 인터페이스
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 *  1. When & Who : 2016-07-31 by 손현민
 *  2. What		  : insertMaterial_Payment() 추가
 */

package com.trycatch.owner.service;

import java.util.List;

import com.trycatch.owner.domain.MaterialOrderDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;
import com.trycatch.owner.domain.Order_AlarmDTO;
import com.trycatch.owner.domain.Order_InformationDTO;

public interface OrderService {
	public List<Order_InformationDTO> getOrder_Information(int store_no, int start_Page, boolean asce, String search_order_info);
	public boolean insertMaterial_Payment(MaterialPaymentDTO dto, MaterialOrderDTO orderDto);
	public List<Order_AlarmDTO> getOrderAlarmList(int member_no);
	public int getordertodayCount(int store_no);
}
