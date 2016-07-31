/*
 * 	Class: MessengerDTO
 *  Description: Messenger에 관련된 정보를 저장하는 DTO
 *  Created: 2016­07­20
 *	Author: 임두휘
 *  Mail: imdh8802@gmail.com
 * 	Copyrights 2016-07-20 by Try{}Catch
 *
 */
package com.trycatch.owner.domain;

public class MessengerDTO {
	private int messenger_no;
	private int member_no;
	private int send_member_no;
	private int connect;
	public int getMessenger_no() {
		return messenger_no;
	}
	public void setMessenger_no(int messenger_no) {
		this.messenger_no = messenger_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getSend_member_no() {
		return send_member_no;
	}
	public void setSend_member_no(int send_member_no) {
		this.send_member_no = send_member_no;
	}
	public int getConnect() {
		return connect;
	}
	public void setConnect(int connect) {
		this.connect = connect;
	}
}
