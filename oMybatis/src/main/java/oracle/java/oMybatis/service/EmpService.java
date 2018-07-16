package oracle.java.oMybatis.service;

import java.util.List;
import java.util.Map;

import oracle.java.oMybatis.controller.VO.DeptVO;
import oracle.java.oMybatis.model.Crawling;
import oracle.java.oMybatis.model.Dept;
import oracle.java.oMybatis.model.Emp;
import oracle.java.oMybatis.model.EmpDept;

public interface EmpService {
	List<Emp> list(Emp emp);
	int total();
	void insertEmp();
	Emp detail(int empno);
	int update(Emp emp);
	List<Emp> listManager();
	List<Dept> select();
	int insert(Emp emp);
	int delete(int empno);
	List<EmpDept> listEmp(EmpDept empDept);
	String deptName(int deptno);
	void insertDept(DeptVO deptVO);
	void SelListDept(Map<String, Object> map);
	int inset2(Crawling crawl);
}
