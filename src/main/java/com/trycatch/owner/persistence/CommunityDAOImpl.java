package com.trycatch.owner.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.CommunityDTO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	@Inject
	private SqlSession sqlSession;
				
	private static final String NAMESPACE = "com.trycatch.owner.mappers.communityMapper";
	private static final Logger logger = LoggerFactory.getLogger(CommunityDAOImpl.class);
	
	
	@Override
	public List<CommunityDTO> getCommunityList() {
		return sqlSession.selectList(NAMESPACE+".communityList");
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

}
