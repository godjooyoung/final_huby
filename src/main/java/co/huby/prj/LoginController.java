package co.huby.prj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.member.service.CompanyMemberService;
import co.huby.prj.member.service.CompanyMemberVo;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;

@Controller
public class LoginController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	CompanyMemberService companyMemberService;
	
	@RequestMapping("/login.do")
	public String login(Model model) {
		return "no/common/login";
	}
	
	@RequestMapping("/memberjoin.do")
	public String memberjoin(Model model) {
		return "no/common/memberjoin";
	}
	
	@RequestMapping("/companymemberjoin.do")
	public String CompanyMemberJoin(Model model) {
		return "no/common/companymemberjoin";
	}

	@RequestMapping("/PersonalLoginCheck.do")
	public ModelAndView PersonalLoginCheck(Model model, HttpServletRequest request, MemberVo vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		MemberVo vo2 = memberService.selectone(vo);
		
		if(vo2 != null) {
			if(vo2.getMember_pw().equals(vo.getMember_pw())) {
			mav.setViewName("person/common/home");
			request.getSession().setAttribute("personalVo", vo2);
			request.getSession().setAttribute("personalloginid", vo2.getMember_id());
			
			}
		}else {
			String num = "1"; 
			request.setAttribute("num", num);
			mav.setViewName("no/common/login");
		}
		return mav;
	}
	
	
	@RequestMapping("/CompanyLoginCheck.do")
	public ModelAndView CompanyLoginCheck(Model model, HttpServletRequest request, CompanyMemberVo vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		CompanyMemberVo vo2 = companyMemberService.selectone(vo); 
		
		if(vo2 != null) {
			if(vo2.getCompany_pw().equals(vo.getCompany_pw())) {
			mav.setViewName("company/company/companyStart");
			request.getSession().setAttribute("companyVo", vo2);
			request.getSession().setAttribute("companyloginid", vo2.getCompany_id());
			}
		}else {
			String num = "1"; 
			request.setAttribute("num", num);
			mav.setViewName("no/common/login");
		}
		
		return mav;
	}
	
	/*@RequestMapping("/idCheck.do")
	public String idCheck(Model model, HttpServletRequest request) {
		String id = 
		
		return "no/common/personalmemberjoin";
	}*/	
}
