package com.trycatch.owner.persistence;

import java.util.List;
import com.trycatch.owner.domain.CommunityDTO;

public interface CommunityDAO {
		public List<CommunityDTO> getCommunityList();
		public void insertCommunity(CommunityDTO dto);
		public void updateCommunity(Integer community_no);
		public void deleteCommunity(Integer community_no);
		public CommunityDTO readCommunity(Integer community_no);
}
