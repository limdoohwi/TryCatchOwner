/*
 * 	Class: CommunityDAOImpl
 *  Description: 커뮤니티 DB에 직접적인 기능 DAO
 *  Created: 2016­07­31
 *	Author: 박완석
 *  Mail: kknd9009@naver.com
 * 	Copyrights 2016-07-31 by Try{}Catch
 *
 * 	Revisions:
 * 		1. When & Who : 2016-07-31 by 박완석
 * 		2. What		  : 커뮤니티 DB처리를 도와주는 DAO 
 */
package com.trycatch.owner.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.CommunityDTO;
import com.trycatch.owner.domain.CommunityLikeDTO;
import com.trycatch.owner.domain.CommunityReplyDTO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	@Inject
	private SqlSession sqlSession;
				
	private static final String NAMESPACE = "com.trycatch.owner.mappers.communityMapper";
	private static final Logger logger = LoggerFactory.getLogger(CommunityDAOImpl.class);
	
	/**
	 * 
	 * @author 박완석
	 * 커뮤니티 리스트 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityDTO> getCommunityList(Integer limit) {
		return sqlSession.selectList(NAMESPACE+".communityList",limit);
	}
	
	/**
	 * 
	 * @author 박완석
	 * 커뮤니티 업로드 하는 함수
	 * 
	 */
	@Override
	public void insertCommunity(CommunityDTO dto) {
		sqlSession.insert(NAMESPACE+".communityInsert", dto);
	}

		
	/**
	 * 
	 * @author 박완석
	 * 커뮤니티 리스트 불러오는 함수
	 * 
	 */
	@Override
	public void updateCommunity(Map map) {
		sqlSession.update(NAMESPACE+".communityUpdate", map);
	}
	
	/**
	 * 
	 * @author 박완석
	 * 커뮤니티 삭제 함수
	 * 
	 */
	@Override
	public void deleteCommunity(Integer community_no) {
		sqlSession.delete(NAMESPACE+".communityDelete", community_no);
	}

	/**
	 * 
	 * @author 박완석
	 * 인자값으로 식별하여 해당 게시글 불러오기
	 * 
	 */
	@Override
	public CommunityDTO readCommunity(Integer community_no) {
		return sqlSession.selectOne(NAMESPACE+".communityRead",community_no);
	}

	
	/**
	 * 
	 * @author 박완석
	 * 내가 업로드한 게시글 리스트 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityDTO> myCommunityList(String community_name) {
		return sqlSession.selectList(NAMESPACE+".mycommunityList", community_name);
	}

	/**
	 * 
	 * @author 박완석
	 * 인자값으로 식별한 게시글에 대한 댓글 리스트 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityReplyDTO> replyCommunityList(Integer community_no) {
		return sqlSession.selectList(NAMESPACE+".communityReplyList",community_no);
	}

	/**
	 * 
	 * @author 박완석
	 * 커뮤니티 전체 글 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityDTO> getCommunityAll() {
		return sqlSession.selectList(NAMESPACE+".communitylistAll");
	}

	/**
	 * 
	 * @author 박완석
	 * 해당 게시글에 댓글 등록 함수
	 * 
	 */
	@Override
	public boolean insertCommunityReply(Map map) {
		try{
			sqlSession.insert(NAMESPACE+".communityreplyInsert", map);
			return true;
		}
		catch(Exception err){
			logger.error(err + " : " + NAMESPACE);
			return false;
		}
	}

	/**
	 * 
	 * @author 박완석
	 * 커뮤니티 페이징 함수
	 * 
	 */
	@Override
	public Integer nextCommunity(Integer community_no) {
		return sqlSession.selectOne(NAMESPACE+".communityNext",community_no);
	}

	/**
	 * 
	 * @author 박완석
	 * 커뮤니티 페이징 함수
	 * 
	 */
	@Override
	public Integer prevCommunity(Integer community_no) {
		return sqlSession.selectOne(NAMESPACE+".communityPrev",community_no);
	}

	/**
	 * 
	 * @author 박완석
	 * 내가 쓴 댓글 리스트 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityReplyDTO> myreplyCommunityList(Integer member_no) {
		return sqlSession.selectList(NAMESPACE+".mycommunityReplyList",member_no);
	}

	/**
	 * 
	 * @author 박완석
	 * 즐겨찾기 리스트 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityLikeDTO> getCommunityLikeList(Integer member_no) {
		return sqlSession.selectList(NAMESPACE+".communitylikeList",member_no);
	}

	/**
	 * 
	 * @author 박완석
	 * 즐겨찾기 등록 함수
	 * 
	 */
	@Override
	public boolean insertLikeCommunity(CommunityLikeDTO dto) {
		try{
			int i = sqlSession.selectOne(NAMESPACE+".communitylikecheck",dto);
			if(i==0){
				System.out.println("�μ�Ʈ");
				sqlSession.insert(NAMESPACE+".communityLikeInsert",dto);
				return true;
				}
			else if(i>0){
				sqlSession.delete(NAMESPACE+".communityLikeDelete",dto);
				return false;
			}
			}
		catch(Exception err){
			sqlSession.delete(NAMESPACE+".communityLikeDelete",dto);
		}
		return false;

	}

	/**
	 * 
	 * @author 박완석
	 * 커뮤니티 인자값으로 검색한 데이터 불러오는 함수
	 * 
	 */
	@Override
	public List<CommunityDTO> getCommunitySearch(String community_search) {
		return sqlSession.selectList(NAMESPACE+".communitySearch",community_search);
	}

}
