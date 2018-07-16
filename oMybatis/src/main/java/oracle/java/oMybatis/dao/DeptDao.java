package oracle.java.oMybatis.dao;

import java.util.List;
import java.util.Map;

import oracle.java.oMybatis.controller.VO.DeptVO;
import oracle.java.oMybatis.model.Dept;

public interface DeptDao {
	List<Dept> select();
	void insertDept(DeptVO deptVO);
	void SelListDept(Map<String, Object> map);
}
