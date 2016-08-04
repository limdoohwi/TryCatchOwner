/*
 * 	Class: CommunityServiceImpl
 *  Description: DAO에 접근하는 Service 클래스
 *  Created: 2016­07­31
 *	Author: 박완석
 *  Mail: kknd9009@naver.com
 * 	Copyrights 2016-07-31 by Try{}Catch
 *
 * 	Revisions:
 * 		1. When & Who : 2016-07-31 by 박완석
 * 		2. What		  : DAO에 접근하는 Service 기능 
 */
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
	

	
	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 커뮤니티 업로드 함수
	 * 
	 */
	@Override
	public void insertCommunity(CommunityDTO dto) {
		dao.insertCommunity(dto);
	}
	
	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 커뮤니티 수정 함수
	 * 
	 */
	@Override
	public void updateCommunity(Map map) {
		dao.updateCommunity(map);
	}

	
	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 커뮤니티 삭제 함수
	 * 
	 */
	@Override
	public void deleteCommunity(Integer community_no) {
		dao.deleteCommunity(community_no);
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 커뮤니티 해당글 읽기 함수
	 * 
	 */	
	@Override
	public CommunityDTO readCommunity(Integer community_no) {
		return dao.readCommunity(community_no);
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 내가쓴 글 리스트 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityDTO> myCommunityList(String community_name) {
		return dao.myCommunityList(community_name);
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 해당하는 게시글의 댓글을 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityReplyDTO> replyCommunityList(Integer community_no) {
		return dao.replyCommunityList(community_no);
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 게시글 리스트 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityDTO> getCommunityList(Integer limit) {
		return dao.getCommunityList(limit);
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 게시글 전체 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityDTO> getCommunityAll() {
		return dao.getCommunityAll();
	} 

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 해당 게시글에 댓글등록 함수
	 */
	@Override
	public boolean insertCommunityReply(Map map) {		
		return dao.insertCommunityReply(map);
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 게시글 다음5개 리스트 불러오는 함수
	 * 
	 */
	@Override
	public Integer nextCommunity(Integer community_no) {
		return dao.nextCommunity(community_no);
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 게시글 이전5개 리스트 불러오는 함수
	 * 
	 */
	@Override
	public Integer prevCommunity(Integer community_no) {
		return dao.prevCommunity(community_no);
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 게시글 이전5개 리스트 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityReplyDTO> myreplyCommunityList(Integer member_no) {
		return dao.myreplyCommunityList(member_no);
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 즐겨찾기 등록 함수
	 * 
	 */
	@Override
	public boolean insertLikeCommunity(CommunityLikeDTO dto) {
		try{dao.insertLikeCommunity(dto); return true;}catch(Exception err){return false;}
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 사용자의 즐겨찾기 리스트 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityLikeDTO> getCommunityLikeList(Integer member_no) {
		return dao.getCommunityLikeList(member_no);
	}

	/**
	 * 
	 * @author 박완석
	 * dao에 접근하여 검색리스트를 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityDTO> getCommunitySearch(String community_search) {
		return dao.getCommunitySearch(community_search);
	}

}
