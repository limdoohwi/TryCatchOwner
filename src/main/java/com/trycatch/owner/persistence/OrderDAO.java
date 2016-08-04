/*
 * 	Class: OrderDAO
 *  Description: Menu_Payment(음료 예약 주문 결제 내역 테이블), Material_Payment(재료 주문 결제 내역 테이블)과의 DB작업을 하기 위한 인터페이스
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 *  1. When & Who : 2016-07-31 by 손현민
 *  2. What		  : insertMaterial_Payment(), insertMaterial_Order(),
 *  				getMaterialPaymentList(),	getMaterialPaymentDetailList() 추가
 */

package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.MaterialOrderDTO;
import com.trycatch.owner.domain.MaterialPaymentDTO;
import com.trycatch.owner.domain.MaterialPaymentDetailDTO;
import com.trycatch.owner.domain.Menu_OrderDTO;
import com.trycatch.owner.domain.Order_AlarmDTO;
import com.trycatch.owner.domain.Order_InformationDTO;

public interface OrderDAO {
	public List<Order_InformationDTO> getOrder_Information(int store_no, int start_Page, boolean asce, String search_order_info);
	public boolean insertMaterial_Payment(MaterialPaymentDTO dto);
	public boolean insertMaterial_Order(MaterialOrderDTO dto);
	public List<MaterialPaymentDTO> getMaterialPaymentList(int store_no, String date, int start_page);
	public List<MaterialPaymentDetailDTO> getMaterialPaymentDetailList(int material_payment_no);
	public List<Menu_OrderDTO> getMenuOrder_withMenu_Payment_no(int menu_payment_no);
	public List<Order_AlarmDTO> getOrderAlarmList(int member_no);
}
