package oracle.java.oMybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.oMybatis.model.Member;
import oracle.java.oMybatis.model.Study;
import oracle.java.oMybatis.model.StudyMem;

@Repository
public class MemberDaoImp implements MemberDao {

	@Autowired
	private SqlSession session;
	
	public List<Member> memberList(Member member){
		return session.selectList("memberList",member);
	}
	public Member search_member(String keyword) {
		return session.selectOne("search_member",keyword);
	}
	public List<Study> list_contest(Study study){
		return session.selectList("list_contest",study);
	}
	public List<Study> list_job(Study study){
		return session.selectList("list_job",study);
	}
	public int join(Member member) {
		return session.insert("join",member);
	}
	public Member loginCheck(String id,String pw) {
		return session.selectOne("login_check",id);
	}
	public int insertStudy(Study study) {
		return session.insert("insert_study",study);
	}
	public List<Study> study_list(String s_subject){
		return session.selectList("study_list",s_subject);
	}
	/*public List<Study> study_list2(String keyword){
		return session.selectList("study_list2",keyword);
	}*/
	public 	List<Study> study_list2(Map<String, Object> map){
		return session.selectList("study_list2",map);
	}
	public List<Study> place_list(String s_subject){
		return session.selectList("place_list",s_subject);
	}

	public int apply(Map<String, Object> map) {
		return session.insert("apply",map);
	}
}
 