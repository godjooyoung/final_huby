package co.huby.prj;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProntPageController {

	@RequestMapping("/prontPage.do")
	public String home(Model model) {

		return "no/common/prontPage";
	}
}
