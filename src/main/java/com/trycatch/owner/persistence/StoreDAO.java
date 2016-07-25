package com.trycatch.owner.persistence;

import java.util.List;

import com.trycatch.owner.domain.StoreDTO;

public interface StoreDAO {
	public StoreDTO getStore_store_no(int store_no);
	public List<StoreDTO> getStoreList_member_no(int member_no);
	public List<StoreDTO> getStoreList();
	public List<StoreDTO> getStoreList(StoreDTO dto);
	public boolean insertStore(StoreDTO dto);
	public boolean updateStore(StoreDTO dto);
	public boolean deleteStore(int store_no);
	public boolean insertMeetingRoomStore(StoreDTO dto);
	public int getStore_meeting_room(int store_no);
	public boolean deleteMeetingRoomStore(int store_no);
	public StoreDTO GPSsetStore(int store_no);
}
