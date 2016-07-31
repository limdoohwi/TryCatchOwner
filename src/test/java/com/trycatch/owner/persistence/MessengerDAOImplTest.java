package com.trycatch.owner.persistence;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Ignore;
import org.junit.Test;

import com.trycatch.owner.domain.MessengerContentDTO;

public class MessengerDAOImplTest {
	@Inject
	MessengerDAO dao;
	
	@Ignore@Test
	public void testIsNew() {
		fail("Not yet implemented");
	}

	@Ignore@Test
	public void testInsertMessenger() {
		fail("Not yet implemented");
	}

	@Ignore@Test
	public void testConnect() {
		fail("Not yet implemented");
	}

	@Ignore@Test
	public void testDisconnect() {
		fail("Not yet implemented");
	}

	@Ignore@Test
	public void testGetMessengerNo() {
		fail("Not yet implemented");
	}

	@Ignore@Test
	public void testGetMessengerNoList() {
		fail("Not yet implemented");
	}

	@Ignore@Test
	public void testInsertMessege() {
		fail("Not yet implemented");
	}

	@Ignore@Test
	public void testGetContentList() {
		fail("Not yet implemented");
	}

	@Ignore@Test
	public void testIsConnect() {
		fail("Not yet implemented");
	}

	@Ignore@Test
	public void testUpdateReadCK() {
		fail("Not yet implemented");
	}

	@Ignore@Test
	public void testGetNotReadContentList() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetRecentContent() {
		MessengerContentDTO dto = dao.getRecentContent();
		System.out.println(dto.toString());
	}

}
