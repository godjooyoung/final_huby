package co.huby.prj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuestionController {

	@RequestMapping(value = "/qInsertCompany.do")
	public String qInsertCompany(Model model, HttpServletRequest request) throws Exception {

		return "company/qna/qInsert";

	}

	@RequestMapping(value = "/qInsertMember.do")
	public String qInsertMember(Model model, HttpServletRequest request) throws Exception {

		return "person/qna/qInsert";

	}
}
