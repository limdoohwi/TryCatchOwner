/*
 * 	Interface: MessengerDAO Interface
 *  Description: Messenger에 관련된 DB연결을 담당하는 Interface
 *  Created: 2016­07­21
 *	Author: 임두휘
 *  Mail: imdh8802@gmail.com
 * 	Copyrights 2016-07-21 by Try{}Catch
 */

package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.MessengerContentDTO;
import com.trycatch.owner.domain.MessengerDTO;

public interface MessengerDAO {
	public boolean isNew(int member_no, int send_member_no);
	public void insertMessenger(int member_no,int send_member_no);
	public boolean isConnect(int messenger_no);
	public void connect(int messenger_no);
	public void disconnect(int messenger_no);
	public int getMessengerNo(int member_no, int send_member_no);
	public List<Integer> getMessengerNoList(int member_no);
	public void insertMessege(int messenger_no, String messenger_content);
	public List<MessengerContentDTO> getContentList(int member_no, int send_member_no);
	public void updateReadCK(int member_no, int send_member_no);
	public List<MessengerContentDTO> getNotReadContentList(int member_no);
	public MessengerContentDTO getRecentContent();
}
