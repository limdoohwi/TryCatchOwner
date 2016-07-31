package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.MeetingRoomDTO;

public interface MeetingRoomDAO {
	public List<MeetingRoomDTO> getMeetingResrevationLIst_withStore_no(int store_no);
	public MeetingRoomDTO getMeetingResrevationLIstToday_withStore_no(int store_no, int time);
}
