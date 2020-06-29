package co.huby.prj.resume;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.resume.service.ResumeService;
import co.huby.prj.vo.CareerVo;
import co.huby.prj.vo.ResumeVo;
import co.huby.prj.vo.SkillsVo;

@Controller
public class ResumeController {
	@Autowired
	ResumeService resumeService;
	@Autowired
	MemberService memberService;
	@Autowired
	EmploymentService employmentService;
	@Autowired
	CodeService codeService;
	
	@RequestMapping("/resumemanagement.do")
	public String resumemanagement(Model model, HttpServletRequest request, MemberVo vo) throws Exception {
		// 이력서 관리
		String id = (String) request.getSession().getAttribute("loginId");
		vo.setMember_id(id);
		List<ResumeVo> checkRvo = resumeService.SelectAll(vo);
		List<Map> svo = employmentService.skillsAll(vo);
		List<CareerVo> cvo = memberService.careerAll(vo);
		List<CodeVo> codeList = codeService.SelectAll();
		
		model.addAttribute("rlist" ,checkRvo);
		model.addAttribute("slist", svo);
		model.addAttribute("clist", cvo);
		model.addAttribute("codeList", codeList);
		
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
	
	@RequestMapping("resumeCheckDelete.do")
	public String resumeCheckDelete(Model model, HttpServletRequest request, ResumeVo vo) throws Exception {
		String[] resumeArray = request.getParameterValues("resumeDelete");
		
		for(int i=0; i<resumeArray.length; i++) {
			ResumeVo rvo = new ResumeVo();
			rvo.setResume_id(resumeArray[i]);
			resumeService.resumeDelete(rvo);
		}
		
		
		return "redirect:resumemanagement.do";
	}
	
	@ResponseBody
	@RequestMapping("resumeUpdateAjax.do")
	public ResumeVo resumeUpdateAjax(Model model, HttpServletRequest request, ResumeVo rvo) throws Exception {
		ResumeVo checkRvo = resumeService.selectone(rvo);
		return checkRvo;
	}
	
	@ResponseBody
	@RequestMapping("resumeUpdateAjaxGo.do")
	public int resumeUpdateAjaxGo(Model model, HttpServletRequest request, ResumeVo rvo) throws Exception {
		int n = resumeService.resumeUpdate(rvo);
		return n;
	}
	
	@ResponseBody
	@RequestMapping("ajaxSkillUpdatePage.do")
	public SkillsVo ajaxSkillUpdatePage(Model model, HttpServletRequest request, SkillsVo svo) throws Exception {
		SkillsVo checkSvo = memberService.skillSelect(svo);
		return checkSvo;
	}
	
	@ResponseBody
	@RequestMapping("ajaxSkillUpdate.do")
	public int ajaxSkillUpdate(Model model, HttpServletRequest request, SkillsVo svo) throws Exception {
		int n = memberService.skillUpdate(svo);
		return n;
	}
	
	@ResponseBody
	@RequestMapping("ajaxSkillInsert.do")
	public Map ajaxSkillInsert(Model model, HttpServletRequest request, SkillsVo svo) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		svo.setMember_id(id);
		Map map = new HashMap<String, Object>();
		int n = memberService.skillInsert(svo);
		
		int skillId = memberService.selectSkillId();
		
		map.put("skillId",skillId);
		map.put("result", n);
		return map;
	}
}
