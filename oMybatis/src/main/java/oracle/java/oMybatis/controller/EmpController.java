package oracle.java.oMybatis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import oracle.java.oMybatis.controller.VO.DeptVO;
import oracle.java.oMybatis.model.Dept;
import oracle.java.oMybatis.model.Emp;
import oracle.java.oMybatis.model.EmpDept;
import oracle.java.oMybatis.service.EmpService;
import oracle.java.oMybatis.service.Paging;

	// 컨트롤러 -> EmpService -> EmpServiceImp1 -> EmpDao -> EmpDaoImp1 -> Emp.xml
@Controller
public class EmpController {
	@Autowired
	private EmpService es;
	
	@RequestMapping(value="list")
	public String list(Emp emp, String currentPage, Model model) {
		int total=es.total();
		System.out.println("total=> "+total);
		System.out.println("currentPage=> "+currentPage);
		Paging pg = new Paging(total, currentPage);
		emp.setStart(pg.getStart());
		emp.setEnd(pg.getEnd());
		List<Emp> list= es.list(emp);
		System.out.println(list.get(0));
		model.addAttribute("list",list);
		model.addAttribute("pg",pg);
		return "list";
	}
	
	//Emp 입력
	@RequestMapping(value="insertEmp")
	public String insertEmp(Model model) {
		es.insertEmp();	//서비스 호출 -> dao 
		return "redirect:list.do";
	}
	
	@RequestMapping(value="detail")
	public String detail(int empno,Model model) {
		Emp emp=es.detail(empno);
		model.addAttribute("emp",emp);
		return "detail";
	}
	
	@RequestMapping(value="updateForm")
	public String updateForm(int empno,Model model) {
		Emp emp= es.detail(empno);
		model.addAttribute("emp",emp);
		return "updateForm";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(Emp emp, Model model) {
		es.update(emp);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="writeForm")
	public String writeForm(Model model) {
		List<Emp> list=es.listManager();		//관리자 사번 가져오는 것
		List<Dept> deptList = es.select();		//부서이름 가져오는 것
		model.addAttribute("list",list);
		model.addAttribute("deptList",deptList);
		return "writeForm";
	}
	
	@RequestMapping(value="write",method=RequestMethod.POST)
	public String write(Emp emp,Model model) {
		int result=es.insert(emp);
		if(result>0)	return "redirect:list.do";
		else {
			model.addAttribute("msg","입력 실패");
			return "forward:writeForm.do";		//redirect로 보내면 msg 안뜸
												//forward로 해야 model에 있는 data를 가지고 다님
		}
	}
	
	@RequestMapping(value="confirm")
	public String confirm(int empno,Model model) {
		Emp emp= es.detail(empno);
		model.addAttribute("empno",empno);
		if(emp!=null) {
			model.addAttribute("msg","중복된 사번입니다");
			return "forward:writeForm.do";
		} else {
			model.addAttribute("msg","사용 가능한 사번입니다");
			return "forward:writeForm.do";
		}
	}
	
	@RequestMapping(value="delete")
	public String delete(int empno,Model model) {
		es.delete(empno);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="listEmp")
	public String listEmp(EmpDept empDept,Model model) {
		List<EmpDept> listEmp = es.listEmp(empDept);
		model.addAttribute("listEmp",listEmp);
		return "listEmp";
	}
	
	@RequestMapping(value="listEmpAjax2")
	public String listEmpAjax(Model model) {
		EmpDept empDept = null;
		System.out.println("ajax list test start");
		List<EmpDept> listEmp = es.listEmp(empDept);
		model.addAttribute("result","kkk");
		model.addAttribute("listEmp",listEmp);
		return "listEmpAjax2";
	}
	
	
	@RequestMapping(value="getDeptName",produces="application/text;charset=UTF-8")
	@ResponseBody
	//컨트롤러에서 Ajax 쓸 때 BODY 로 돌려주겠다.
	public String getDeptName(int deptno,Model model) {
		System.out.println("deptno->"+deptno);
		return es.deptName(deptno);
	}
	
	
	@RequestMapping(value="writeDeptIn",method=RequestMethod.GET)
	public String writeDeptIn(Locale locale,Model model) {
		System.out.println("writeDeptIn start");
		return "writeDept3";
	}
	
	//프로시저 DTO 방식
	@RequestMapping(value="writeDept",method=RequestMethod.POST)
	public String writeDept(DeptVO deptVO,Model model) {
		es.insertDept(deptVO);	//프로시저 호출
		if(deptVO==null) {
			System.out.println("deptVO NULL");
		}else {
			System.out.println("RdeptVO.getOdeptno()->"+deptVO.getOdeptno());
			System.out.println("RdeptVO.getOdname()->"+deptVO.getOdname());
			System.out.println("RdeptVO.getOloc()->"+deptVO.getLoc());
			model.addAttribute("msg","정상 입력되었습니다");
			model.addAttribute("dept",deptVO);
		}
		return "writeDept3";
	}
	
	//프로시저 MAP 방식
	@RequestMapping(value="writeDeptCursor", method=RequestMethod.GET)
	public String writeDeptCursor(Locale locale,Model model) {
		System.out.println("writeDeptCursor start");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("sDeptno",10);	
		map.put("eDeptno", 80);
		
		es.SelListDept(map);
		List<Dept> deptList= (List<Dept>) map.get("dept");		//Dept.xml에서 dept를 받아와 deptList에 넣어줌
		
		//코드 돌아가는지 확인
		System.out.println("deptList.dname[0].getDname()->"+deptList.get(0).getDname());
		System.out.println("deptList.dname[0].getLoc()->"+deptList.get(0).getLoc());
		System.out.println("deptList Size->"+deptList.size());
		model.addAttribute("deptList",deptList);
		return "writeDeptCursor";
	
	}
	
}
