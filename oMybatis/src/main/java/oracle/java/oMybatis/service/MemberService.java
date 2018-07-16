package oracle.java.oMybatis.service;

import java.util.List;
import java.util.Map;

import oracle.java.oMybatis.model.Member;
import oracle.java.oMybatis.model.Study;
import oracle.java.oMybatis.model.StudyMem;

public interface MemberService {
	List<Member> memberList(Member member);
	//List<Member> memberList(Member member,String keyword);
	Member search_member(String keyword);
	List<Study> study_list(String s_subject);
	//List<Study> study_list2(String keyword);
	List<Study> study_list2(Map<String, Object> map);
	List<Study> place_list(String s_subject);
	
	List<Study> list_contest(Study study);
	List<Study> list_job(Study study);
	int join(Member member);
	Member loginCheck(String id,String pw);
	int insertStudy(Study study);
	int apply(Map<String, Object> map);
}
