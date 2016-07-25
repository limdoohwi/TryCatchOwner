package com.trycatch.owner.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.trycatch.owner.domain.StoreDTO;

@Repository
public class StoreDAOImpl implements StoreDAO {
	private static final Logger logger = LoggerFactory.getLogger(StoreDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.trycatch.owner.mappers.storeMapper";
	
	@Override
	public StoreDTO getStore_store_no(int store_no) {
		try {
			return sqlSession.selectOne("getStore_store_no", store_no);
		} catch (Exception err) {
			return null;
		}
	}
	
	@Override
	public List<StoreDTO> getStoreList(StoreDTO dto) {
		try {
			return sqlSession.selectList(NAMESPACE + ".getStoreList", dto);
		} catch (Exception err) {
			// TODO: handle exception
		}
		return null;
	}
	
	@Override
	public List<StoreDTO> getStoreList() {
		try {
			return sqlSession.selectList(NAMESPACE + ".getStoreList");
		} 
		catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public boolean insertStore(StoreDTO dto) {
		try {
			sqlSession.insert(NAMESPACE + ".insertStore", dto);
			return true;
		} catch (Exception err) {
			return false;
		}
	}
	
	@Override
	public boolean updateStore(StoreDTO dto) {
		try {
			sqlSession.update(NAMESPACE + ".updateStore", dto);
			return true;
		} catch (Exception err) {
			return false;
		}
	}
	
	 @Override
	public boolean deleteStore(int store_no) {
		try {
			sqlSession.delete(NAMESPACE + ".deleteStore", store_no);
			return true;
		} catch (Exception err) {
			return false;
		}
	}
	 
	 @Override
	public boolean insertMeetingRoomStore(StoreDTO dto) {
		try {
			sqlSession.insert(NAMESPACE + ".insertMeetingRoomStore", dto);
			return true;
		} catch (Exception err) {
			return false;
		}
	}
	 
	 @Override
	public int getStore_meeting_room(int store_no) {
		try {
			return sqlSession.selectOne(NAMESPACE + ".getStore_meeting_room", store_no);
		} catch (Exception err) {
			return 1;
		}
	}
	 
	 @Override
	public boolean deleteMeetingRoomStore(int store_no) {
		try {
			sqlSession.delete(NAMESPACE + ".deleteMeetingRoomStore", store_no);
			return true;
		} catch (Exception err) {
			return false;
		}
	}

	@Override
	public StoreDTO GPSsetStore(int store_no) {
		try {
			return sqlSession.selectOne(NAMESPACE + ".getStore_store_no", store_no);
		} catch (Exception err) {
			return null;
		}
	}
	
	@Override
	public List<StoreDTO> getStoreList_member_no(int member_no) {
		try {
			return sqlSession.selectList(NAMESPACE + ".getStoreList_member_no", member_no);
		} catch (Exception err) {
			return null;
		}
	}
}
