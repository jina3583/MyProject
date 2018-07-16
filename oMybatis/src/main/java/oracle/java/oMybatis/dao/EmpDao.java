package oracle.java.oMybatis.dao;

import java.util.List;

import oracle.java.oMybatis.model.Crawling;
import oracle.java.oMybatis.model.Dept;
import oracle.java.oMybatis.model.Emp;
import oracle.java.oMybatis.model.EmpDept;

public interface EmpDao {
	List<Emp> list(Emp emp);
	int total();
	void insertEmp();
	Emp detail(int empno);
	int update(Emp emp);
	List<Emp> listManager();
	int insert(Emp emp);
	int delete(int empno);
	List<EmpDept> listEmp(EmpDept empDept);
	String deptName(int deptno);
	int inset2(Crawling crawl);
}
