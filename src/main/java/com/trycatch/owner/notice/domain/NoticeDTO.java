package com.trycatch.owner.notice.domain;

public class NoticeDTO {
	private int notice_num;
	private String notice_content;
	private int notice_pos;
	private int notice_depth;
	private String notice_date;
	private int notice_group;
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_pos() {
		return notice_pos;
	}
	public void setNotice_pos(int notice_pos) {
		this.notice_pos = notice_pos;
	}
	public int getNotice_depth() {
		return notice_depth;
	}
	public void setNotice_depth(int notice_depth) {
		this.notice_depth = notice_depth;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_group() {
		return notice_group;
	}
	public void setNotice_group(int notice_group) {
		this.notice_group = notice_group;
	}
}
