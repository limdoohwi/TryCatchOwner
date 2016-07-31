package com.trycatch.owner.domain;

public class CommunityLikeDTO {
	private int community_like_no;
	private int community_no;
	private int member_no;
	private String community_title;
	
	
	public int getCommunity_like_no() {
		return community_like_no;
	}
	public void setCommunity_like_no(int community_like_no) {
		this.community_like_no = community_like_no;
	}
	public int getCommunity_no() {
		return community_no;
	}
	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getCommunity_title() {
		return community_title;
	}
	public void setCommunity_title(String community_title) {
		this.community_title = community_title;
	}
	@Override
	public String toString() {
		return "CommunityLikeDTO [community_like_no=" + community_like_no + ", community_no=" + community_no
				+ ", member_no=" + member_no + ", community_title=" + community_title + "]";
	}
	


}
