package oracle.java.oMybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.oMybatis.controller.VO.DeptVO;
import oracle.java.oMybatis.model.Dept;

@Repository
public class DeptDaoImp implements DeptDao {

	@Autowired
	private SqlSession session;
	
	public List<Dept> select(){
		return session.selectList("selectDept");
	}
	
	public void insertDept(DeptVO deptVO) {
		session.selectOne("ProcDept",deptVO);		// deptVO 를 프로시저에게 넘겨줌
	}
	
	public void SelListDept(Map<String, Object> map) {
		session.selectOne("ProcDeptList",map);
	}
}
