package com.oracle.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.study.dao.BoardDAO;
import com.oracle.study.model.TBoard;

@Service
public class BoardServiceImp implements BoardService {
	@Autowired
	private BoardDAO bd;
	
	@Override
	public List<TBoard> board_list() {
		// TODO Auto-generated method stub
		return bd.board_list();
	}

	public int insert(TBoard board) {
		return bd.insert(board);
	}

	@Override
	public TBoard read(int tnum) {
		// TODO Auto-generated method stub
		return bd.read(tnum);
	}
	
}
