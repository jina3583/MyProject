package oracle.java.oMybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.oMybatis.model.Crawling;
import oracle.java.oMybatis.model.Dept;
import oracle.java.oMybatis.model.Emp;
import oracle.java.oMybatis.model.EmpDept;

@Repository
public class EmpDaoImp1 implements EmpDao {

	@Autowired
	private SqlSession session;		//root-context.xml
	public List<Emp> list(Emp emp){
		//emp.xml ->id(listAll), parameterType(emp), return List
		return session.selectList("listAll",emp);
						//emp 파라미터를 가지고 listAll을 찾아감 (Emp.xml의 id="listAll")
	}
	
	public int total() {
		//emp.xml->id(total), return int
		return session.selectOne("total");
	}
	

	public void insertEmp() {  //  => emp.xml
		Emp emp = new Emp();
		for(int i=3001;i<=3120;i++) {
			emp.setEmpno(i);
			emp.setEname("호세"+i);
			emp.setJob("영업");
			emp.setMgr(7369);
			emp.setHiredate("2018-05-15");
			emp.setSal(3000);
			emp.setComm(500);
			emp.setDeptno(20);
			session.insert("insert",emp);
		}
	}
	
	public Emp detail(int empno) {
		return session.selectOne("detail",empno);
	}
	
	public int update(Emp emp) {
		return session.update("update",emp);
	}
	
	public List<Emp> listManager(){
		return session.selectList("selectManager");
	}
	
	public int insert(Emp emp) {
		return session.insert("insert",emp);
	}

	public int delete(int empno) {
		return session.delete("delete",empno);
	}
	
	public List<EmpDept> listEmp(EmpDept empDept){
		return session.selectList("listEmp",empDept);
	}
	
	public String deptName(int deptno) {
		return session.selectOne("deptName",deptno);
	}
	
	public int inset2(Crawling crawl) {
		return session.insert("insert2",crawl);
	}
}
