package co.huby.prj;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login.do")
	public String login(Model model) {
		return "no/common/login";
	}
	
	@RequestMapping("/memberjoin.do")
	public String memberjoin(Model model) {
		return "no/common/memberjoin";
	}

}
