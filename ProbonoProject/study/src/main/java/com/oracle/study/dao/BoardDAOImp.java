package com.oracle.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.study.model.TBoard;

@Repository
public class BoardDAOImp implements BoardDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<TBoard> board_list() {
		// TODO Auto-generated method stub
		return session.selectList("board_list");
	}

	@Override
	public int insert(TBoard board) {
		// TODO Auto-generated method stub
		return session.insert("board_insert", board);
	}

	@Override
	public TBoard read(int tnum) {
		// TODO Auto-generated method stub
		return session.selectOne("board_read", tnum);
	}

}
