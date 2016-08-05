/*
 * 	Interface: CommunityDAO 
 *  Description: CommunityDAO 를 상속 받는 클래스로서 DB에 직접적인 연결을 담당하는 클래스
 *  Created: 2016­07-31
 *	Author: 박완석
 */
package com.trycatch.owner.persistence;

import java.util.List;
import java.util.Map;

import com.trycatch.owner.domain.CommunityDTO;
import com.trycatch.owner.domain.CommunityLikeDTO;
import com.trycatch.owner.domain.CommunityReplyDTO;

public interface CommunityDAO {
	public List<CommunityDTO> getCommunityList(Integer limit);
	public List<CommunityDTO> getCommunityAll();
	public void insertCommunity(CommunityDTO dto);
	public void updateCommunity(Integer community_no);
	public void deleteCommunity(Integer community_no);
	public CommunityDTO readCommunity(Integer community_no);
	public List<CommunityDTO> myCommunityList(String community_name);
	public List<CommunityReplyDTO> replyCommunityList(Integer community_no);
	public boolean insertCommunityReply(Map map);
	public Integer nextCommunity(Integer community_no);
	public Integer prevCommunity(Integer community_no);
	public List<CommunityReplyDTO> myreplyCommunityList(Integer member_no);
	public List<CommunityLikeDTO> getCommunityLikeList(Integer member_no);
	public boolean insertLikeCommunity(CommunityLikeDTO dto);
	public List<CommunityDTO> getCommunitySearch(String community_search);
	public int get_Community_Count_New();
}
