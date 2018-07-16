package com.oracle.study;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;

import com.oracle.study.dao.BoardDAO;
import com.oracle.study.model.TBoard;

public class BoardDaoTest {
	
	Logger logger = Logger.getLogger(BoardDaoTest.class);
	
	@Inject
	private BoardDAO dao;

//	@Test
	public void boardListTest() {
		 List<TBoard> list = dao.board_list();
		 
	}
	
//	@Test
	public void inserTest() {
		
	}
	
//	@Test
	public void readTest() {
		
	}
	
}
