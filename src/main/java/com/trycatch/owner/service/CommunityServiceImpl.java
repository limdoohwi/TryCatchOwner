package com.trycatch.owner.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.trycatch.owner.domain.CommunityDTO;
import com.trycatch.owner.persistence.CommunityDAO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Inject
	private CommunityDAO dao;
	
	@Override
	public List<CommunityDTO> getCommunityList() {
		return dao.getCommunityList();
	}

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

}
