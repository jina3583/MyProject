package oracle.java.oMybatis.dao;

import java.util.List;
import java.util.Map;

import oracle.java.oMybatis.model.Member;
import oracle.java.oMybatis.model.Study;
import oracle.java.oMybatis.model.StudyMem;

public interface MemberDao {
	List<Member> memberList(Member member);
	Member search_member(String keyword);
	List<Study> list_contest(Study study);
	List<Study> list_job(Study study);
	int join(Member member);
	Member loginCheck(String id,String pw);
	int insertStudy(Study study);
	List<Study> study_list(String s_subject);
	int apply(Map<String, Object> map);
	//List<Study> study_list2(String keyword);
	List<Study> study_list2(Map<String, Object> map);
	List<Study> place_list(String s_subject);

}
