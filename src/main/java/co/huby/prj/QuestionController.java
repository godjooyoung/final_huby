package co.huby.prj;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.board.service.QuestionService;
import co.huby.prj.vo.QuestionVo;

@Controller
public class QuestionController {

	@Autowired
	private QuestionService qService;

	@RequestMapping(value = "/qInsertCompany.do")
	public ModelAndView qInsertCompany(Model model, HttpServletRequest request, QuestionVo vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		qService.qInsertCompany(vo);
		mav.setViewName("redirect:qListCompany");
		return mav;

	}

	@RequestMapping(value = "/qInsertMember.do")
	public ModelAndView qInsertMember(Model model, HttpServletRequest request, QuestionVo vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		qService.qInsertMember(vo);
		mav.setViewName("redirect:qListMember");
		return mav;

	}

	@RequestMapping(value = "/qListMember.do")
	public String qListMember(Model model, HttpServletRequest request, QuestionVo vo) throws Exception {
		String memberid = (String) request.getSession().getAttribute("loginId");
		vo.setMember_id(memberid);
		List<Map> qListM = qService.getSelectQuestionMember(vo);
		model.addAttribute("qList", qListM);
		return "person/qna/qListMember";
	}

	@RequestMapping(value = "/qListCompany.do")
	public String qListCompany(Model model, HttpServletRequest request, QuestionVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		vo.setCompany_id(companyid);
		List<Map> qListC = qService.getSelectQuestionMember(vo);
		model.addAttribute("qList", qListC);
		return "company/qna/qListCompany";
	}
}
