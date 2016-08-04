/*
 * 	Class: MeetingRoomDAO
 *  Description: Meeting_Reservation Table과의 DB작업을 하기 위한 인터페이스
 *  Created: 2016­07­29
 *	Author: 김준혁
 *  Mail: iamheykj@gmail.com
 * 	Copyrights 2016-07-29 by Try{}Catch
 *
 *	Revisions:
 */

package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.MeetingRoomDTO;

public interface MeetingRoomDAO {
	public List<MeetingRoomDTO> getMeetingResrevationLIst_withStore_no(int store_no);
	public MeetingRoomDTO getMeetingResrevationLIstToday_withStore_no(int store_no, int time);
}
