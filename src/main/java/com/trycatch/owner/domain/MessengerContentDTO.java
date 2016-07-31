/*
 * 	Class: MessengerContentDTO
 *  Description: Messenger_Content table에 관련된 값을 가지는 DTO
 *  Created: 2016­07­20
 *	Author: 임두휘
 *  Mail: imdh8802@gmail.com
 * 	Copyrights 2016-07-20 by Try{}Catch
 *
 */
package com.trycatch.owner.domain;

import java.sql.Timestamp;

public class MessengerContentDTO {
	private int messenger_no;
	private int member_no;
	private String member_name;
	private String messenger_content;
	private String content_regdate;
	private int content_read_ck;

	public String getContent_regdate() {
		return content_regdate;
	}
	public void setContent_regdate(String content_regdate) {
		this.content_regdate = content_regdate;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getMessenger_no() {
		return messenger_no;
	}
	public void setMessenger_no(int messenger_no) {
		this.messenger_no = messenger_no;
	}
	public String getMessenger_content() {
		return messenger_content;
	}
	public void setMessenger_content(String messenger_content) {
		this.messenger_content = messenger_content;
	}
	
	public int getContent_read_ck() {
		return content_read_ck;
	}
	public void setContent_read_ck(int content_read_ck) {
		this.content_read_ck = content_read_ck;
	}
	@Override
	public String toString() {
		return "MessengerContentDTO [messenger_no=" + messenger_no + ", member_no=" + member_no + ", member_name="
				+ member_name + ", messenger_content=" + messenger_content + ", cotent_regdate=" + content_regdate
				+ ", content_read_ck=" + content_read_ck + "]";
	}
	
	
}
