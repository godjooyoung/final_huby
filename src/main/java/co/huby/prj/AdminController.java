package co.huby.prj;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("/index.do")
	public String index(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "no/admin/index";
	}
	
	@RequestMapping("/noticePage.do")
	public String noticePage(Model model) {
		
		return "no/admin/noticepage";
	}
	
	@RequestMapping("/qnaPage.do")
	public String qnaPage(Model model) {
		
		return "no/admin/qnapage";
	}
	
	@RequestMapping("/userManagement.do")
	public String userManagement(Model model) {
		
		return "no/admin/usermanagement";
	}
	
	@RequestMapping("/noticeManagement.do")
	public String noticeManagement(Model model) {
		
		return "no/admin/noticemanagement";
	}
	
	@RequestMapping("/vManagement.do")
	public String vManagement(Model model) {
		
		return "no/admin/vmanagement";
	}
	
	@RequestMapping("/noticeselectpage.do")
	public String noticeSelectPage(Model model) {
		
		return "no/admin/noticeselectpage";
	}
	
	@RequestMapping("qnaselectpage.do")
	public String qnaSelectPage(Model model) {
		
		return "no/admin/qnaselectpage";
	}
	
	@RequestMapping("userSelectPage.do")
	public String userSelectPage(Model model) {
		
		return "no/admin/userselectpage";
	}
	
	
}
