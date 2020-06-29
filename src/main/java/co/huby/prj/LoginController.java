package co.huby.prj;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;
import co.huby.prj.member.service.CompanyMemberService;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.CompanyVo;

@Controller
public class LoginController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	CompanyMemberService companyMemberService;
	@Autowired
	CodeService codeService;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping("/login.do")
	public String login(Model model) {
		return "no/common/login";
	}
	
	@RequestMapping("/memberjoin.do")
	public String memberjoin(Model model) {
		return "no/common/memberjoin";
	}
	
	@RequestMapping("/companymemberjoin.do")
	public String CompanyMemberJoin(Model model) throws Exception {
		List<CodeVo> typeVo = codeService.SelectAll();
		model.addAttribute("typeVo",typeVo);
		
		return "no/common/companymemberjoin";
	}

	@RequestMapping("/PersonalLoginCheck.do")
	public ModelAndView PersonalLoginCheck(Model model, HttpServletRequest request, MemberVo vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVo vo2 = memberService.selectone(vo);
		
		
		if(vo2 != null){
		boolean pwdMatch = pwdEncoder.matches(vo.getMember_pw(), vo2.getMember_pw());
		if(pwdMatch) {
			mav.setViewName("redirect:employmentMatch.do");
			request.getSession().setAttribute("personalVo", vo2);
			request.getSession().setAttribute("loginId", vo2.getMember_id());
			request.getSession().setAttribute("loginType", "U");
		}else {
			String num = "1"; 
			request.setAttribute("num", num);
			mav.setViewName("no/common/login");
		}
		}else {
			String num = "1"; 
			request.setAttribute("num", num);
			mav.setViewName("no/common/login");
		}
		return mav;
	}
	
	
	@RequestMapping("/CompanyLoginCheck.do")
	public ModelAndView CompanyLoginCheck(Model model, HttpServletRequest request, CompanyVo vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		CompanyVo vo2 = companyMemberService.selectone(vo); 
		
		if(vo2 != null){
		boolean pwdMatch = pwdEncoder.matches(vo.getCompany_pw(), vo2.getCompany_pw());
		if(pwdMatch) {
			mav.setViewName("redirect:get_matched_video_list_first.do");
			request.getSession().setAttribute("companyVo", vo2);
			request.getSession().setAttribute("loginId", vo2.getCompany_id());
			request.getSession().setAttribute("loginType", "C");
		}
		else {
			String num = "1"; 
			request.setAttribute("num", num);
			mav.setViewName("no/common/login");
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
	public String CompanyidCheck(Model model, HttpServletRequest request, CompanyVo vo) throws Exception {
		CompanyVo checkVo = companyMemberService.companyMemberIdCheck(vo);
		String num = "0";
		
		if(checkVo != null) {
			num = "1";
		}
		return num;
	}
	
	@ResponseBody
	@RequestMapping("/CompanyrNumCheck.do")
	public String CompanyrNumCheck(Model model, CompanyVo vo) {
		CompanyVo checkVo = companyMemberService.companyrNumCheck(vo);
		String num = "0";
		if(checkVo != null) {
			num = "1";
		}
		return num;
	}
	
	@RequestMapping("/logout.do")
	public String logout(Model model, HttpServletRequest request) {
		
		request.getSession().removeAttribute("personalVo");
		request.getSession().removeAttribute("loginId");
		request.getSession().removeAttribute("loginType");
		
		return "no/common/login";
	}
	
	@RequestMapping("/unionJoinForm.do")
	public String unionJoinForm(Model model, HttpServletRequest request) throws Exception {
		List<CodeVo> typeVo = codeService.SelectAll();
		model.addAttribute("typeVo",typeVo);
		return "no/common/unionJoinForm";
	}
}
