package oracle.java.oMybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.oMybatis.model.House;
import oracle.java.oMybatis.model.Member;
import oracle.java.oMybatis.model.TBoard;

@Repository
public class ProDaoImp implements ProDao {

	@Autowired
	private SqlSession session;
	
	public List<TBoard> board_list(TBoard board){
		return session.selectList("board_list",board);
	}
	public 	List<TBoard> board_search(String keyword){
		return session.selectList("board_search",keyword);
	}
	public TBoard board_content(int tnum) {
		return session.selectOne("board_content",tnum);
	}
	public int insert(TBoard board) {
		return session.insert("board_insert",board);
	}
	public Member mail(Member member) {
		return session.selectOne("mem_email",member);
	}
	public List<House> house(){
		return session.selectList("house");
	}

}
