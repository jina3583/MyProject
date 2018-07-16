package com.oracle.study.service;

import java.util.List;

import com.oracle.study.model.TBoard;


public interface BoardService {
	/**
	 * �Խ��� ��ü����Ʈ ��� ���� 
	 */
	List<TBoard> board_list();
	
	/**
	 * �Խ��� ��� ����(�ۼ��ϱ�)
	 */
	int insert(TBoard board);
	/**
	 * �Խ��� Ư�� �κ� �б�
	 */
	TBoard read(int tnum);
}
