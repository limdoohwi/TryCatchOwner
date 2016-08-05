/*
 * 	Interface: MeetingRoomService
 *  Description: MeetingRoomDAOImpl에서 받아온 Data를 가공하기 위한 인터페이스
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.service;

import java.util.List;

import com.trycatch.owner.domain.MeetingRoomDTO;

public interface MeetingRoomService {
	public List<MeetingRoomDTO> getMeetingResrevationLIst_withStore_no(int store_no) throws Exception;
	public List<MeetingRoomDTO> getMeetingResrevationLIstToday_withStore_no(int store_no) throws Exception;
}
