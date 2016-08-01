package com.trycatch.owner.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.trycatch.owner.domain.CommunityDTO;
import com.trycatch.owner.domain.CommunityLikeDTO;
import com.trycatch.owner.domain.CommunityReplyDTO;
import com.trycatch.owner.persistence.CommunityDAO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Inject
	private CommunityDAO dao;
	

	@Override
	public void insertCommunity(CommunityDTO dto) {
		dao.insertCommunity(dto);
	}

	@Override
	public void updateCommunity(Integer community_no) {
		dao.updateCommunity(community_no);
	}

	@Override
	public void deleteCommunity(Integer community_no) {
		dao.deleteCommunity(community_no);
	}

	@Override
	public CommunityDTO readCommunity(Integer community_no) {
		return dao.readCommunity(community_no);
	}

	@Override
	public List<CommunityDTO> myCommunityList(String community_name) {
		return dao.myCommunityList(community_name);
	}

	@Override
	public List<CommunityReplyDTO> replyCommunityList(Integer community_no) {
		return dao.replyCommunityList(community_no);
	}

	@Override
	public List<CommunityDTO> getCommunityList(Integer limit) {
		return dao.getCommunityList(limit);
	}

	@Override
	public List<CommunityDTO> getCommunityAll() {
		return dao.getCommunityAll();
	} 

	@Override
	public void insertCommunityReply(Map map) {
		dao.insertCommunityReply(map);
	}

	@Override
	public Integer nextCommunity(Integer community_no) {
		return dao.nextCommunity(community_no);
	}

	@Override
	public Integer prevCommunity(Integer community_no) {
		return dao.prevCommunity(community_no);
	}

	@Override
	public List<CommunityReplyDTO> myreplyCommunityList(Integer member_no) {
		return dao.myreplyCommunityList(member_no);
	}

	@Override
	public boolean insertLikeCommunity(CommunityLikeDTO dto) {
		try{dao.insertLikeCommunity(dto); return true;}catch(Exception err){return false;}
	}

	@Override
	public List<CommunityLikeDTO> getCommunityLikeList(Integer member_no) {
		return dao.getCommunityLikeList(member_no);
	}

	@Override
	public List<CommunityDTO> getCommunitySearch(String community_search) {
		return dao.getCommunitySearch(community_search);
	}

}
