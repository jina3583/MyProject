package com.oracle.study.service;

import java.util.List;

import com.oracle.study.model.TBoard;


public interface BoardService {
	/**
	 * 게시판 전체리스트 출력 서비스 
	 */
	List<TBoard> board_list();
	
	/**
	 * 게시판 등록 서비스(작성하기)
	 */
	int insert(TBoard board);
	/**
	 * 게시판 특정 부분 읽기
	 */
	TBoard read(int tnum);
}
