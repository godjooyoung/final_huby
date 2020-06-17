package co.huby.prj.resume;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.resume.service.ResumeService;
import co.huby.prj.vo.ResumeVo;

@Controller
public class ResumeController {
	@Autowired
	ResumeService resumeService;
	
	@RequestMapping("/resumemanagement.do")
	public String resumemanagement(Model model, HttpServletRequest request, MemberVo vo) {
		// 내 이력서 정보들 가지고 오는 쿼리 필요
		MemberVo mvo = (MemberVo) request.getSession().getAttribute("personalVo");
		
		List<ResumeVo> checkRvo = resumeService.SelectAll(mvo);
		
		model.addAttribute("rlist" ,checkRvo);
		
		return "person/resume/resumemanagement";
	}
	
	@RequestMapping("resumeinsertpage.do")
	public String resumeinsertpage(Model model, HttpServletRequest request, ResumeVo vo) {
		
		return "person/resume/resumeinsertpage";
	}
	
	@RequestMapping("resumeinsert.do")
	public ModelAndView resumeinsert(Model model, HttpServletRequest request, ResumeVo vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String mvo = (String) request.getSession().getAttribute("loginId");
		vo.setMember_id(mvo);
		
		int n = resumeService.resumeInsert(vo);
		
		if(n == 1) {
			mav.setViewName("redirect:resumemanagement.do");
		}else {
			mav.setViewName("redirect:resumemanagement.do");
		}
		return mav;
	}
	
	@RequestMapping("resumedelete.do")
	public ModelAndView resumedelete(Model model, HttpServletRequest request, ResumeVo vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int n = resumeService.resumeDelete(vo);
		
		if(n == 1) {
			mav.setViewName("redirect:resumemanagement.do");
		}else {
			mav.setViewName("redirect:resumemanagement.do");
		}
		return mav;
	}
	
	@RequestMapping("resumeupdatepage.do")
	public ModelAndView resumeupdatepage(Model model, HttpServletRequest request, ResumeVo vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		ResumeVo checkVo = resumeService.selectone(vo);
		
		model.addAttribute("rlist", checkVo);
		
		if(checkVo != null) {
			mav.setViewName("person/resume/resumeupdatepage");
		}else {
			mav.setViewName("redirect:resumemanagement.do");
		}
		return mav;
	}
	
	@RequestMapping("resumeupdate.do")
	public ModelAndView resumeupdate(Model model, HttpServletRequest request, ResumeVo vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int n = resumeService.resumeUpdate(vo);
		
		if(n == 1) {
			mav.setViewName("redirect:resumemanagement.do");
		}else {
			mav.setViewName("redirect:resumeupdate.do");
		}
		return mav;
	}
}
