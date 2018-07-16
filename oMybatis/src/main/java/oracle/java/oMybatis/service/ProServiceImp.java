package oracle.java.oMybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.oMybatis.dao.ProDao;
import oracle.java.oMybatis.model.House;
import oracle.java.oMybatis.model.Member;
import oracle.java.oMybatis.model.TBoard;

@Service
public class ProServiceImp implements ProService {

	@Autowired
	private ProDao pd;
	
	public List<TBoard> board_list(TBoard board){
		return pd.board_list(board);
	}
	public 	List<TBoard> board_search(String keyword){
		return pd.board_search(keyword);
	}
	public TBoard board_content(int tnum) {
		return pd.board_content(tnum);
	}
	public int insert(TBoard board) {
		return pd.insert(board);
	}
	public Member mail(Member member) {
		return pd.mail(member);
	}
	public List<House> house(){
		return pd.house();
	}
	
	
}
