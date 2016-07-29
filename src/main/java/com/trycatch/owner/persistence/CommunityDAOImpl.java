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
	
	
	@Override
	public List<CommunityDTO> getCommunityList(Integer limit) {
		System.out.println("daolimit" + limit);
		return sqlSession.selectList(NAMESPACE+".communityList",limit);
	}

	@Override
	public void insertCommunity(CommunityDTO dto) {
		sqlSession.insert(NAMESPACE+".communityInsert", dto);
	}

	@Override
	public void updateCommunity(Integer community_no) {
		sqlSession.update(NAMESPACE+".communityUpdate", community_no);
	}

	@Override
	public void deleteCommunity(Integer community_no) {
		sqlSession.delete(NAMESPACE+".communityDelete", community_no);
	}

	@Override
	public CommunityDTO readCommunity(Integer community_no) {
		return sqlSession.selectOne(NAMESPACE+".communityRead",community_no);
	}

	@Override
	public List<CommunityDTO> myCommunityList(String community_name) {
		return sqlSession.selectList(NAMESPACE+".mycommunityList", community_name);
	}

	@Override
	public List<CommunityReplyDTO> replyCommunityList(Integer community_no) {
		return sqlSession.selectList(NAMESPACE+".communityReplyList",community_no);
	}

	@Override
	public List<CommunityDTO> getCommunityAll() {
		return sqlSession.selectList(NAMESPACE+".communitylistAll");
	}

	@Override
	public void insertCommunityReply(Map map) {
		sqlSession.insert(NAMESPACE+".communityreplyInsert", map);
	}

	@Override
	public Integer nextCommunity(Integer community_no) {
		return sqlSession.selectOne(NAMESPACE+".communityNext",community_no);
	}

	@Override
	public Integer prevCommunity(Integer community_no) {
		return sqlSession.selectOne(NAMESPACE+".communityPrev",community_no);
	}

	@Override
	public List<CommunityReplyDTO> myreplyCommunityList(Integer member_no) {
		return sqlSession.selectList(NAMESPACE+".mycommunityReplyList",member_no);
	}

	@Override
	public List<CommunityLikeDTO> getCommunityLikeList(Integer member_no) {
		return sqlSession.selectList(NAMESPACE+".communitylikeList",member_no);
	}

	@Override
	public boolean insertLikeCommunity(CommunityLikeDTO dto) {
		try{
			int i = sqlSession.selectOne(NAMESPACE+".communitylikecheck",dto);
			if(i==0){
				sqlSession.insert(NAMESPACE+".communityLikeInsert",dto);
				System.out.println("인서트 완료");
				return true;
				}
			else if(i>0){
				System.out.println("즐찾 삭제");
				sqlSession.delete(NAMESPACE+".communityLikeDelete",dto);
				return false;
			}
			}
		catch(Exception err){
			System.out.println("익셉션"+err);
			sqlSession.delete(NAMESPACE+".communityLikeDelete",dto);
		}
		return false;

	}

	@Override
	public List<CommunityDTO> getCommunitySearch(String community_search) {
		return sqlSession.selectList(NAMESPACE+".communitySearch",community_search);
	}

}
