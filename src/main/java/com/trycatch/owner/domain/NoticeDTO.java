/*
 * 	Class: NoticDTO
 *  Description: Notice table에 관련된 값을 가지는 DTO
 *  Created: 2016­07-22
 *	Author: 이준영
 */
package com.trycatch.owner.domain;

public class NoticeDTO {
	private int notice_no;
	private String notice_content;
	private int notice_parent_no;
	private String notice_regdate;
	private int member_no;
	private String member_name;
	private int reply_count;
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_parent_no() {
		return notice_parent_no;
	}
	public void setNotice_parent_no(int notice_parent_no) {
		this.notice_parent_no = notice_parent_no;
	}
	public String getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(String notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
}
