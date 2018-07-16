package oracle.java.oMybatis.dao;

import java.util.List;

import oracle.java.oMybatis.model.House;
import oracle.java.oMybatis.model.Member;
import oracle.java.oMybatis.model.TBoard;

public interface ProDao {
	List<TBoard> board_list(TBoard board);
	List<TBoard> board_search(String keyword);
	TBoard board_content(int tnum);
	int insert(TBoard board);
	Member mail(Member member);
	List<House> house();
}
