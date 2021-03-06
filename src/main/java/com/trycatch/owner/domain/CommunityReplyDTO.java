/*
 * 	Class: CommunityDTO
 *  Description: CommunityReply table에 관련된 값을 가지는 DTO
 *  Created: 2016­07-22
 *	Author: 박완석
 */
package com.trycatch.owner.domain;

import java.util.Date;

public class CommunityReplyDTO {

		private int community_reply_no;
		private String community_reply_writer;
		private String community_reply_comment;
		private String community_reply_date;
		private int community_no;
		
		public int getCommunity_reply_no() {
			return community_reply_no;
		}
		public void setCommunity_reply_no(int community_reply_no) {
			this.community_reply_no = community_reply_no;
		}
		public String getCommunity_reply_writer() {
			return community_reply_writer;
		}
		public void setCommunity_reply_writer(String community_reply_writer) {
			this.community_reply_writer = community_reply_writer;
		}
		public String getCommunity_reply_comment() {
			return community_reply_comment;
		}
		public void setCommunity_reply_comment(String community_reply_comment) {
			this.community_reply_comment = community_reply_comment;
		}
		public String getCommunity_reply_date() {
			return community_reply_date;
		}
		public void setCommunity_reply_date(String community_reply_date) {
			this.community_reply_date = community_reply_date;
		}
		public int getCommunity_no() {
			return community_no;
		}
		public void setCommunity_no(int community_no) {
			this.community_no = community_no;
		}
		
}
