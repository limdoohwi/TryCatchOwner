package com.trycatch.owner.service;

import java.util.List;

import com.trycatch.owner.domain.MeetingRoomDTO;

public interface MeetingRoomService {
	public List<MeetingRoomDTO> getMeetingResrevationLIst_withStore_no(int store_no) throws Exception;
	public List<MeetingRoomDTO> getMeetingResrevationLIstToday_withStore_no(int store_no) throws Exception;
}
