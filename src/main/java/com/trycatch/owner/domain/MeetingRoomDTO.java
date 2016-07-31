package com.trycatch.owner.domain;

public class MeetingRoomDTO {
	private String meeting_reservation_date;
	private int meeting_no;
	private String member_name;
	private String member_tel;
	private String meeting_reservation_time;

	public String getMeeting_reservation_time() {
		return meeting_reservation_time;
	}

	public void setMeeting_reservation_time(String meeting_reservation_time) {
		this.meeting_reservation_time = meeting_reservation_time;
	}

	public String getMeeting_reservation_date() {
		return meeting_reservation_date;
	}

	public void setMeeting_reservation_date(String meeting_reservation_date) {
		this.meeting_reservation_date = meeting_reservation_date;
	}

	public int getMeeting_no() {
		return meeting_no;
	}

	public void setMeeting_no(int meeting_no) {
		this.meeting_no = meeting_no;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

}
