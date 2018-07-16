package oracle.java.oMybatis.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.oMybatis.dao.EmpDao;
import oracle.java.oMybatis.dao.MemberDao;
import oracle.java.oMybatis.model.Member;
import oracle.java.oMybatis.model.Study;
import oracle.java.oMybatis.model.StudyMem;

@Service
public class MemberServiceImp implements MemberService {

	
	@Autowired
	private MemberDao md;
	
	public List<Member> memberList(Member member){
		return md.memberList(member);
	}
	public Member search_member(String keyword) {
		return md.search_member(keyword);
	}
	public List<Study> list_contest(Study study){
		return md.list_contest(study);
	}
	public List<Study> list_job(Study study){
		return md.list_job(study);
	}
	public int join(Member member) {
		return md.join(member);
	}
	public Member loginCheck(String id,String pw) {
		return md.loginCheck(id,pw);
	}
	public int insertStudy(Study study) {
		return md.insertStudy(study);
	}
	public List<Study> study_list(String s_subject){
		return md.study_list(s_subject);
	}
	/*public List<Study> study_list2(String keyword){
		return md.study_list2(keyword);
	}*/
	public List<Study> study_list2(Map<String, Object> map){
		return md.study_list2(map);
	}
	public List<Study> place_list(String s_subject){
		return md.place_list(s_subject);
	}
	
	public int apply(Map<String, Object> map) {
		return md.apply(map);
	}
	
	

}
