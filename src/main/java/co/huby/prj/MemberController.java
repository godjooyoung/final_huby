package co.huby.prj;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/employment.do")
	public String employment(Model model) {
		
		return "member/employment";
	}
	
	@RequestMapping("/myresume.do")
	public String myresume(Model model) {
		
		return "member/myresume";
	}
	
	@RequestMapping("/myresume.do")
	public String myresume(Model model) {
		
		return "member/myresume";
	}
}
