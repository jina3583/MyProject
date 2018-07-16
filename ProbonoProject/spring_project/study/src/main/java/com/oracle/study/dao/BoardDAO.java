package com.oracle.study.dao;

import java.util.List;

import com.oracle.study.model.TBoard;


public interface BoardDAO {
	List<TBoard> board_list();
	int insert(TBoard board);
	TBoard read(int tnum);
}
