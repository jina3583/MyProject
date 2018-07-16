package oracle.java.oMybatis.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.oMybatis.model.Member;
import oracle.java.oMybatis.model.Study;
import oracle.java.oMybatis.model.StudyMem;
import oracle.java.oMybatis.service.MemberService;


@Controller
public class MyController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping("joinForm")
	public String joinForm(Model model) {
		System.out.println("회원가입 화면");
		return "/jja/joinForm";
	}
	
	@RequestMapping("join")
	public String join(Member member,Model model) {
		System.out.println("회원가입 완료");
		int result=ms.join(member);
		
		if(result==1) System.out.println("회원가입 성공");
		else System.out.println("회원가입 실패");
		
		return "jja/login";
	}
	
	
	
	@RequestMapping("memberList")	// .do 로 호출
	public String memberList(Member member,Model model) {
		System.out.println("회원정보 리스트");
		List<Member> member_list=  ms.memberList(member);
		model.addAttribute("memberList",member_list);
		
		return "/jja/memberList";	
	}
	
	@RequestMapping(value="search",method=RequestMethod.GET)
	public String search(Member member,HttpServletRequest request,Model model) {
		System.out.println("회원 검색");
		String keyword = request.getParameter("keyword");
		System.out.println("검색키워드->"+keyword);
		member = ms.search_member(keyword);
		model.addAttribute("member",member);
				
		return "redirect:/jja/memberList";
	}
	
	@RequestMapping("studyList")
	public String stduyList() {
		System.out.println("스터디 리스트 화면");
		return "jja/studyList";
	}
	
	@RequestMapping("list_job")
	public String list_job(Study study,Model model) {
		System.out.println("면접스터디 리스트");
		List<Study> study_job = ms.list_job(study);
		model.addAttribute("list",study_job);
		return "jja/studyList";
	}
	
	@RequestMapping("list_license")
	public String list_license(Model model) {
		System.out.println("자격증스터디 리스트");
		return "jja/studyList";
	}
	
	@RequestMapping("list_contest")
	public String list_contest(Study study,Model model) {
		System.out.println("NCS 스터디 리스트");
		List<Study> study_contest = ms.list_contest(study);
		model.addAttribute("list",study_contest);
		return "jja/studyList";
	}
	
	@RequestMapping("community")
	public String community(HttpServletRequest request,Model model) {
		System.out.println("로그인->커뮤니티 게시판");
		String m_id=request.getParameter("m_id");
		model.addAttribute("m_id",m_id);
		return "jja/community";
	}
	
	@RequestMapping("license")
	public String study_license(String keyword,HttpServletRequest request,Model model) {
		System.out.println("스터디 메인 게시판 + 검색 가능");
		String m_id=request.getParameter("m_id");
		String s_subject=request.getParameter("s_subject");
		System.out.println("주제는->"+s_subject);
		keyword=request.getParameter("keyword");    //검색키워드
		System.out.println("검색 키워드 -> "+keyword);
		//List<Study> place_list=ms.place_list();		//스터디 장소 리스트 불러오기
		List<Study> place_list=ms.place_list(s_subject);	//스터디 주제에 맞는 스터디 장소 불러오기
		//System.out.println("place_list --> " + place_list.get(0));

		if(keyword!=null) {
			String s_subject2=request.getParameter("s_subject");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("s_subject", s_subject2);
			map.put("keyword", keyword);
			List<Study> study_list2=ms.study_list2(map);    //키워드를 포함하는 스터디 리스트 출력(검색한 스터디 보기)
			model.addAttribute("keyword",keyword);
			model.addAttribute("study_list2",study_list2);
			model.addAttribute("s_subject",s_subject2);
			model.addAttribute("place_list",place_list);
			model.addAttribute("m_id",m_id);
			return "jja/license";
		}
		if(s_subject!=null) {
			List<Study> study_list=ms.study_list(s_subject);	//스터디 리스트 출력
			model.addAttribute("study_list",study_list);
			model.addAttribute("s_subject",s_subject);
			model.addAttribute("keyword",keyword);
			model.addAttribute("place_list",place_list);
			model.addAttribute("m_id",m_id);
		}
		return "jja/license";
	}
	
/*	@RequestMapping("license")
	public String study_license(HttpServletRequest request,Model model) {
		System.out.println("스터디 메인 게시판");
		String s_subject=request.getParameter("s_subject");
		System.out.println("주제는->"+s_subject);
		
		List<Study> study_list=ms.study_list(s_subject);	//스터디 리스트 출력
		model.addAttribute("study_list",study_list);
		model.addAttribute("s_subject",s_subject);
		return "jja/license";
	}
	
	@RequestMapping("searchStudy")
	public String search(String keyword,HttpServletRequest request,Model model) {
		System.out.println("스터디 검색하기");
		keyword=request.getParameter("keyword");
		System.out.println("검색 키워드 -> "+keyword);
		List<Study> study_list2=ms.study_list2(keyword);
		model.addAttribute("study_list2",study_list2);
		return "jja/license";
	}*/
	
	
	@RequestMapping("openStudyForm")
	public String openStudyForm(HttpServletRequest request,Model model) {
		System.out.println("스터디 개설 폼");
		String s_subject=request.getParameter("s_subject");
		System.out.println("주제는 "+s_subject);
		model.addAttribute("s_subject",s_subject);
		return "jja/openStudyForm";
	}
	
	
	
	@RequestMapping("Studylogin")
	public String Studylogin(Model model) {
		System.out.println("임시 로그인 화면");
		return "jja/Studylogin";
	}
	
	
	@RequestMapping(value="openStudy",method=RequestMethod.POST)
	public String openStudy(Study study,HttpServletRequest request,Model model) {
		String s_subject=request.getParameter("s_subject");
		model.addAttribute("s_subject",s_subject);
		System.out.println("주제는 "+s_subject);
	
		String[] chkbox = request.getParameterValues("s_meetday");
		
		for( int i = 0; i < chkbox.length; i++ )
		{
			System.out.print(chkbox[i]);
		}
		
		int result = ms.insertStudy(study);
		if(result==1) System.out.println("스터디 개설 성공");
		else System.out.println("스터디 개설 실패");
		return "redirect:license.do";	
	}
	
	@RequestMapping("apply")
	public String apply(StudyMem studyMem,HttpServletRequest request,Model model) {
		System.out.println("스터디 신청 클릭");
		String s_subject=request.getParameter("s_subject");
		String m_id=request.getParameter("m_id");
		int s_num=Integer.parseInt(request.getParameter("s_num"));
		System.out.println("아이디:"+m_id);
		System.out.println("스터디번호:"+s_num);
		System.out.println("주제:"+s_subject);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("s_num", s_num);
		int result=ms.apply(map);
		if(result==1) {
			System.out.println("스터디멤버 추가+인원수 증가 성공");
		}else {
			System.out.println("추가 실패");
		}
		return "redirect:license.do";
		
	}
	
	@RequestMapping("resume")
	public String resume(Model model) {
		System.out.println("자기소개서 첨삭 게시판");
		return "jja/resume";
	}
	
	@RequestMapping("suit")
	public String suit(Model model) {
		System.out.println("정장 거래 게시판");
		return "jja/suit";
	}
	
	@RequestMapping("suit_info")
	public String suit_info(Model model) {
		System.out.println("정장 상세정보");
		return "jja/suit_info";
	}
	
	
	@RequestMapping("mapTest")
	public String map(Model model) {
		System.out.println("키워드로 장소검색하기");
		return "jja/mapTest";
	}
	
	
	@RequestMapping(value = "/mailSender") 
	public void mailSender(HttpServletRequest request, ModelMap mo) throws AddressException, MessagingException { 
		// 네이버일 경우 smtp.naver.com 을 입력합니다. 
		// Google일 경우 smtp.gmail.com 을 입력합니다. 
		String host = "smtp.naver.com"; 
		final String username = "wlsdkrjatk"; //네이버 아이디를 입력해주세요. 
		final String password = ""; //네이버 이메일 비밀번호를 입력해주세요. 
		int port=465; //포트번호 
		// 메일 내용 
		String recipient = "1010ehdud@naver.com"; //받는 사람의 메일주소를 입력해주세요. 
		String subject = "새로운 공지사항을 확인해주세요."; //메일 제목 입력해주세요. 
		//String body = username+"님으로 부터 메일을 받았습니다."; //메일 내용 입력해주세요. 
		String body = "새로운 정보가 업데이트 되었습니다. 홈페이지에 들어가서 확인해주세요. + url 추가";
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 
		// SMTP 서버 정보 설정 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		//Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
				return new javax.mail.PasswordAuthentication(un, pw); } }); 
		session.setDebug(true); //for debug 
		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
		mimeMessage.setFrom(new InternetAddress("imjinajang@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
		mimeMessage.setSubject(subject); //제목셋팅 
		mimeMessage.setText(body); //내용셋팅 
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 
		
	}
		
	

}
