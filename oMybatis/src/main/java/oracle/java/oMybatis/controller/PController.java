package oracle.java.oMybatis.controller;

import java.util.List;
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

import oracle.java.oMybatis.model.House;
import oracle.java.oMybatis.model.Member;
import oracle.java.oMybatis.model.TBoard;
import oracle.java.oMybatis.service.ProService;

@Controller
public class PController {
	
	@Autowired
	private ProService ps;
	
	@RequestMapping("board_list")
	public String list(TBoard board,String keyword,Model model) {
		System.out.println("공지사항 게시판");
		List<TBoard> board_list=ps.board_list(board);
		model.addAttribute("board_list",board_list);
		if(keyword!=null) {
			List<TBoard> board_search=ps.board_search(keyword);
			model.addAttribute("board_list",board_search);
		}
		return "pro/board_list";
	}
	
	/*@RequestMapping("test")
	public String test(Model model) {
		return "test";
	}*/
	
	@RequestMapping("content")
	public String content(HttpServletRequest request,Model model) {
		System.out.println("제목 클릭 -> 본문 보기");
		int tnum=Integer.parseInt(request.getParameter("tnum"));
		TBoard board_content = ps.board_content(tnum);
		model.addAttribute("content",board_content);
		return "pro/board_content";
	}
	
	@RequestMapping("write")
	public String write(Model model) {
		System.out.println("공지사항 작성 화면");
		return "pro/board_write";
	}
	
	/*@RequestMapping(method=RequestMethod.POST,value="write_board")
	public String write_board(TBoard board,Model model) {
		System.out.println("공지사항 올리기");
		int result=ps.insert(board);
		if(result==1)
			System.out.println("성공");
		else
			System.out.println("실패");
		return "redirect:board_list.do";
	}*/
	
	@RequestMapping(method=RequestMethod.POST,value="write_board")
	public String write_board(TBoard board,Model model,HttpServletRequest request, ModelMap mo,Member member) throws AddressException, MessagingException {
		System.out.println("공지사항 올리기 + 이메일");
		Member mem_info=ps.mail(member);
		String email=mem_info.getEmail();
		System.out.println("이메일주소: "+email);
		
		
		int result=ps.insert(board);
		if(result==1) {
			System.out.println("성공");
			String host = "smtp.naver.com"; 
			final String username = "imjinajang"; //네이버 아이디를 입력해주세요. 
			final String password = "jja44233583"; //네이버 이메일 비밀번호를 입력해주세요. 
			int port=465; //포트번호 
			// 메일 내용 
			/*String recipient = "wlsdkrjatk@naver.com"; //받는 사람의 메일주소를 입력해주세요. */
			String recipient = email; //받는 사람의 메일주소를 입력해주세요.
			String subject = "새로운 공지사항을 확인해주세요."; //메일 제목 입력해주세요. 
			//String body = username+"님으로 부터 메일을 받았습니다."; //메일 내용 입력해주세요. 
			String body = "새로운 정보가 업데이트 되었습니다. 홈페이지에 들어가서 확인해주세요. + 찾아줄게 너의집 url";
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
			else
			System.out.println("실패");
		return "redirect:board_list.do";
	}
	
	@RequestMapping("map")	//지형도 + 마커 표시
	public String main(Model model) {
		List<House> house=ps.house();
		model.addAttribute("house",house);
		return "pro/map";
	}
	
	@RequestMapping("taxi")	//장애인 콜택시 운행지역 표시
	public String taxi(Model model) {
		return "pro/taxi";
	}
	
	@RequestMapping("test")	//파이썬+자바
	public String test(Model model) {
		return "test";
	}

	@RequestMapping("mail") 
	public void mail(HttpServletRequest request, ModelMap mo,Member member) throws AddressException, MessagingException { 
		// 네이버일 경우 smtp.naver.com 을 입력합니다. 
		// Google일 경우 smtp.gmail.com 을 입력합니다. 
		Member mem_info=ps.mail(member);
		String email=mem_info.getEmail();
		System.out.println("이메일주소: "+email);
		
		
		String host = "smtp.naver.com"; 
		final String username = "imjinajang"; //네이버 아이디를 입력해주세요. 
		final String password = "jja44233583"; //네이버 이메일 비밀번호를 입력해주세요. 
		int port=465; //포트번호 
		// 메일 내용 
		/*String recipient = "wlsdkrjatk@naver.com"; //받는 사람의 메일주소를 입력해주세요. */
		String recipient = email; //받는 사람의 메일주소를 입력해주세요.
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
	
	@RequestMapping("javaEx")	//자바스크립트 연습
	public String javaEx(Model model) {
		return "javaEx";
	}
	
	@RequestMapping("translation")
	public String bus(Model model) {
		return "translation";
	}
}
