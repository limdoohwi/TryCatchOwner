package com.trycatch.owner.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.trycatch.owner.domain.MeetingRoomDTO;
import com.trycatch.owner.persistence.MeetingRoomDAO;
@Service
public class MeetingRoomServiceImpl implements MeetingRoomService{
	@Inject
	private MeetingRoomDAO dao;
	
	@Override
	public List<MeetingRoomDTO> getMeetingResrevationLIst_withStore_no(int store_no) throws Exception {
		List<MeetingRoomDTO> list = dao.getMeetingResrevationLIst_withStore_no(store_no);
		for(int i=0; i<list.size(); i++){
			for(int time=1; time<7; time++){
				if(list.get(i).getMeeting_reservation_time().equals("1"))
					list.get(i).setMeeting_reservation_time("10,12");
				else if(list.get(i).getMeeting_reservation_time().equals("2"))
						list.get(i).setMeeting_reservation_time("12,14");
				else if(list.get(i).getMeeting_reservation_time().equals("3"))
						list.get(i).setMeeting_reservation_time("14,16");
				else if(list.get(i).getMeeting_reservation_time().equals("4"))
						list.get(i).setMeeting_reservation_time("16,18");
				else if(list.get(i).getMeeting_reservation_time().equals("5"))
						list.get(i).setMeeting_reservation_time("18,20");
				else if(list.get(i).getMeeting_reservation_time().equals("6"))
						list.get(i).setMeeting_reservation_time("20,22");
			}
		}
		return list;
	}
	
	@Override
	public List<MeetingRoomDTO> getMeetingResrevationLIstToday_withStore_no(int store_no) throws Exception {
		List<MeetingRoomDTO> list = new ArrayList<>();
		for(int time=1; time<7; time++){
			MeetingRoomDTO dto = dao.getMeetingResrevationLIstToday_withStore_no(store_no, time);
			if(dto == null){
				dto = new MeetingRoomDTO();
				dto.setMember_name("없음");
				dto.setMeeting_reservation_time(String.valueOf(time));
			}
			if(dto.getMeeting_reservation_time().equals("1"))
				dto.setMeeting_reservation_time("10:00 ~ 12:00");
			else if(dto.getMeeting_reservation_time().equals("2"))
				dto.setMeeting_reservation_time("12:00 ~ 14:00");
			else if(dto.getMeeting_reservation_time().equals("3"))
				dto.setMeeting_reservation_time("14:00 ~ 16:00");
			else if(dto.getMeeting_reservation_time().equals("4"))
				dto.setMeeting_reservation_time("16:00 ~ 18:00");
			else if(dto.getMeeting_reservation_time().equals("5"))
				dto.setMeeting_reservation_time("18:00 ~ 20:00");
			else 
				dto.setMeeting_reservation_time("20:00 ~ 22:00");
			list.add(dto);
		}
		return list;
	}
}
