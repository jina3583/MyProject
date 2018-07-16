package oracle.java.oMybatis.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import oracle.java.oMybatis.controller.VO.SampleVO;
import oracle.java.oMybatis.model.Dept;
import oracle.java.oMybatis.service.EmpService;


// rest컨트롤러 : responseBody 를 포함해서 안 써줘도 됨
@RestController			
@RequestMapping("/sample")
public class EmpRestController {
	@Autowired
	private EmpService es;
	
	@RequestMapping("/sendVO2")
	public SampleVO sendVO2(int deptno) {
		System.out.println("@restController deptno-> "+deptno);
		SampleVO vo = new SampleVO();
		vo.setFirstName("길동");
		vo.setLastName("홍");
		vo.setMno(123);
		return vo;
	}
	
	@RequestMapping("/sendVO3")
	public List<Dept> sendVO3(){
		System.out.println("sendVO3 start");
		List<Dept> deptList= es.select();
		return deptList;
	}
	
}
