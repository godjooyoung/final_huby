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

	@RequestMapping(value = "/qInsertC.do")
	public ModelAndView qInsertC(Model model, HttpServletRequest request, QuestionVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		vo.setCompany_id(companyid);
		ModelAndView mav = new ModelAndView();
		int n = qService.qInsertCompany(vo);
		
		if(n==1) { 
				mav.setViewName("redirect:qListCompany.do"); 
		}else {
				mav.setViewName("redirect:qInsertPageM.do");
				int num = 0;
				model.addAttribute("error", num); 
		}
		 return mav;
	}

	@RequestMapping(value = "/qInsertM.do")
	public ModelAndView qInsertM(Model model, HttpServletRequest request, QuestionVo vo) throws Exception {
		String memberid = (String) request.getSession().getAttribute("loginId");
		vo.setMember_id(memberid);
		ModelAndView mav = new ModelAndView();
		int n = qService.qInsertMember(vo);
		mav.setViewName("redirect:qListMember.do");
		
		return mav;
	}

	/*
	 * @RequestMapping(value = "/qInsertPageC.do") // 문의등록페이지 public ModelAndView
	 * qInsertPageC(Model model, HttpServletRequest request, QuestionVo vo) throws
	 * Exception { String companyid = (String)
	 * request.getSession().getAttribute("loginId"); vo.setCompany_id(companyid);
	 * ModelAndView mav = new ModelAndView(); int n = qService.qInsertCompany(vo);
	 * 
	 * if(n==1) { mav.setViewName("redirect:qListCompany.do"); }else {
	 * mav.setViewName("redirect:qInsertPageM.do"); int num = 0;
	 * model.addAttribute("error", num); }
	 * 
	 * return mav; }
	 */
	@RequestMapping(value = "/qInsertPageC.do") // 문의등록페이지
	public String qInsertPageC(Model model, HttpServletRequest request, QuestionVo vo) throws Exception {
		return "person/qna/qInsertPageC";
	}
	
	@RequestMapping(value = "/qInsertPageM.do") // 문의등록페이지
	public String qInsertMember(Model model, HttpServletRequest request, QuestionVo vo) throws Exception {
		return "person/qna/qInsertPage";
	}

	@RequestMapping(value = "/qListMember.do") // 문의리스트
	public String qListMember(Model model, HttpServletRequest request, QuestionVo vo) throws Exception {
		String memberid = (String) request.getSession().getAttribute("loginId");
		vo.setMember_id(memberid);
		List<Map> qListM = qService.getSelectQuestionMember(vo);
		model.addAttribute("qList", qListM);
		return "person/qna/qListMember";
	}

	@RequestMapping(value = "/qListCompany.do") // 문의리스트
	public String qListCompany(Model model, HttpServletRequest request, QuestionVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		vo.setCompany_id(companyid);
		List<Map> qListC = qService.getSelectQuestionCompany(vo);
		model.addAttribute("qList", qListC);
		return "company/qna/qListCompany";
	}
}
