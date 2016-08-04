/*
 * 	Class: StoreDAO
 *  Description: Store Table과 DB작업을 하기 위한 인터페이스
 *  Created: 2016­07­27
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-27 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.StoreDTO;

public interface StoreDAO {
	public List<StoreDTO> getStoreList_member_no(int member_no);
	public int getStore_meeting_room(int store_no);
	public StoreDTO getStore_store_no(int store_no);
}
