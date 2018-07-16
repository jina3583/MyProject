package oracle.java.oMybatis.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.oMybatis.controller.VO.DeptVO;
import oracle.java.oMybatis.dao.DeptDao;
import oracle.java.oMybatis.dao.EmpDao;
import oracle.java.oMybatis.model.Crawling;
import oracle.java.oMybatis.model.Dept;
import oracle.java.oMybatis.model.Emp;
import oracle.java.oMybatis.model.EmpDept;

@Service
public class EmpServiceImp1 implements EmpService {

	// Autowired 는 EmpDao ed = new EmpDao(); 와 같음
	@Autowired
	private EmpDao ed;
	
	@Autowired
	private DeptDao dd;
	
	//ed-> EmpDaoImpl
	public List<Emp> list(Emp emp) {
		return ed.list(emp);
	}
	public int total() {
		return ed.total();
	}
	//ed->EmpDaoImpl
	public void insertEmp() {
		ed.insertEmp();
	}
	public Emp detail(int empno) {
		return ed.detail(empno);
	}
	public int update(Emp emp) {
		return ed.update(emp);
	}
	public List<Emp> listManager(){
		return ed.listManager();
	}
	
	public List<Dept> select(){
		return dd.select();
	}
	public int insert(Emp emp) {
		return ed.insert(emp);
	}
	
	public int delete(int empno) {
		return ed.delete(empno);
	}
	
	public List<EmpDept> listEmp(EmpDept empDept){
		return ed.listEmp(empDept);
	}
	
	public String deptName(int deptno) {
		return ed.deptName(deptno);
	}
	
	public void insertDept(DeptVO deptVO) {		//프로시저는 return 이 없음, OUT 이 그 역할을 해줌
		dd.insertDept(deptVO);
	}
	public void SelListDept(Map<String, Object> map) {
		dd.SelListDept(map);
	}
	public int inset2(Crawling crawl) {
		return ed.inset2(crawl);
	}
}
