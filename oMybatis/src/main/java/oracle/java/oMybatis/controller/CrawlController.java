package oracle.java.oMybatis.controller;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import oracle.java.oMybatis.model.Crawling;
import oracle.java.oMybatis.service.EmpService;

@Controller
public class CrawlController {
	
	@Autowired
	private EmpService es;
	
	@RequestMapping(value="crawler",method=RequestMethod.GET)
	public String home(Model model) throws Exception{
		System.out.println("크롤러 시작");
		String articleURL = "http://www.imaeil.com/sub_news/sub_news_view.php?news_id=20000&yy=2015";   //신문기사 URL
		Document doc = Jsoup.connect(articleURL).get();	//document 객체 생성
							//url 연결
		
		Elements ele1 = doc.select("div#_article");	//아이디가 _article인 div 태그 선택
		//기사의 구조 중 id = article를 선택해 저장
		
		String str1 = ele1.text();					//값 저장
		Elements eTitles= doc.select(".txt2");		//클래스가 txt2인 태그 선택
		String titles= eTitles.text();
		
		//값 저장
		for(Element e:eTitles) {
			System.out.println("text:"+e.text());
			System.out.println("html:"+e.html());
		}
		Elements eAnchor=doc.select("a[href]");
		String Anchor=eAnchor.text();
		for(Element a:eAnchor) {
			System.out.println("Link:"+a.attr("abs:href"));
		}
		Crawling tbl_Crawl = new Crawling();
		tbl_Crawl.setUrl(articleURL);
		tbl_Crawl.setTitle("신문");
		tbl_Crawl.setContent(str1);
		
		int result= es.inset2(tbl_Crawl);
		if(result>0) 	model.addAttribute("msg","입력 성공");
		else 			model.addAttribute("msg","입력 실패");
		
		model.addAttribute("string",str1);
		return "crawler";
		
		
	}
}
