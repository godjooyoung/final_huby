package co.huby.prj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
			request.getSession().setAttribute("loginId", vo2.getMember_id());
			request.getSession().setAttribute("loginType", "U");
			
			
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
			mav.setViewName("redirect:companyAfterLogin.do");
			request.getSession().setAttribute("companyVo", vo2);
			request.getSession().setAttribute("loginId", vo2.getCompany_id());
			request.getSession().setAttribute("loginType", "C");
			}
		}else {
			String num = "1"; 
			request.setAttribute("num", num);
			mav.setViewName("no/common/login");
		}
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/idCheck.do")
	public String idCheck(Model model, HttpServletRequest request, MemberVo vo) throws Exception {
		MemberVo checkVo = memberService.memberIdCheck(vo);
		String num = "0";
		if(checkVo != null) {
			num = "1";
		}
		return num;
	}	
	
	@ResponseBody
	@RequestMapping("/CompanyidCheck.do")
	public String CompanyidCheck(Model model, HttpServletRequest request, CompanyMemberVo vo) throws Exception {
		CompanyMemberVo checkVo = companyMemberService.companyMemberIdCheck(vo);
		String num = "0";
		if(checkVo != null) {
			num = "1";
		}
		return num;
	}	
	
	@ResponseBody
	@RequestMapping("/CompanyrNumCheck.do")
	public String CompanyrNumCheck(Model model, CompanyMemberVo vo) {
		CompanyMemberVo checkVo = companyMemberService.companyrNumCheck(vo);
		String num = "0";
		if(checkVo != null) {
			num = "1";
		}
		return num;
	}
}
