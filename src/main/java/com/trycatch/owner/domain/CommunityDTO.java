package com.trycatch.owner.domain;

import java.util.Date;

public class CommunityDTO {
	private int community_no;
	private String community_title;
	private String community_content;
	private String community_writer;
	private Date community_regdate;
	
	public int getCommunity_no() {
		return community_no;
	}
	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}
	public String getCommunity_title() {
		return community_title;
	}
	public void setCommunity_title(String community_title) {
		this.community_title = community_title;
	}
	public String getCommunity_content() {
		return community_content;
	}
	public void setCommunity_content(String community_content) {
		this.community_content = community_content;
	}
	public String getCommunity_writer() {
		return community_writer;
	}
	public void setCommunity_writer(String community_writer) {
		this.community_writer = community_writer;
	}
	public Date getCommunity_regdate() {
		return community_regdate;
	}
	public void setCommunity_regdate(Date community_regdate) {
		this.community_regdate = community_regdate;
	}
	

}
