package co.huby.prj.resume;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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
import co.huby.prj.vo.HabitVo;
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
	
	@InitBinder
	public void allowEmptyDateBinding(WebDataBinder binder) {
		/*
		 * // Custom String Editor. tell spring to set empty values as null instead of
		 * empty string. binder.registerCustomEditor( String.class, new
		 * StringTrimmerEditor( true ));
		 */

		// Custom Date Editor

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		simpleDateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, false));
	}
	
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
	public String resumeinsertpage(Model model, HttpServletRequest request, ResumeVo vo) throws Exception {
		List<CodeVo> codeList = codeService.SelectAll();
		model.addAttribute("codeList", codeList);
		
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
	
	@ResponseBody
	@RequestMapping("ajaxCareerUpdatePage.do")
	public CareerVo ajaxCareerUpdatePage(Model model, CareerVo cvo) throws Exception {
		CareerVo checkCvo = memberService.careerSelect(cvo); 
		return checkCvo;
	}
	
	@ResponseBody
	@RequestMapping("ajaxCareerUpdate.do")
	public int ajaxCareerUpdate(Model model, CareerVo cvo) throws Exception{
		int n = memberService.careerUpdate(cvo);
		return n;
	}
	
	@RequestMapping("checkSKillDelete.do")
	public String checkSKillDelete(Model model, HttpServletRequest request, SkillsVo svo) throws Exception {
		
		String[] skillArray = request.getParameterValues("skill_id");
		
		for(int i=0; i<skillArray.length; i++) {
			SkillsVo arraySvo = new SkillsVo();
			arraySvo.setSkill_id(skillArray[i]);
			memberService.skillDelete(arraySvo);
		}
		return "redirect:resumemanagement.do";
	}
	
	@RequestMapping("checkCareerDelete.do")
	public String checkCareerDelete(Model model, HttpServletRequest request, CareerVo cvo) throws Exception {
		
		String[] careerArray = request.getParameterValues("career_id");
		
		for(int i=0; i<careerArray.length; i++) {
			CareerVo arrayCvo = new CareerVo();
			arrayCvo.setCareer_id(careerArray[i]);
			memberService.careerDelete(arrayCvo);
		}
		return "redirect:resumemanagement.do";
	}
	
	@RequestMapping("checkResumeDelete.do")
	public String checkResumeDelete(Model model, HttpServletRequest request, ResumeVo rvo) throws Exception {
		
		String[] resumeArray = request.getParameterValues("resume_id");
		
		for(int i=0; i<resumeArray.length; i++) {
			ResumeVo arrayRvo = new ResumeVo();
			arrayRvo.setResume_id(resumeArray[i]);
			resumeService.resumeDelete(arrayRvo);
		}
		return "redirect:resumemanagement.do";
	}
	
	@ResponseBody
	@RequestMapping("habitChartData.do")
	public List<HabitVo> habitChartData(Model model, HttpServletRequest request, HabitVo hvo, MemberVo mvo) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);
		List<HabitVo> result = resumeService.selecthabit(mvo);
		
		return result;
	}
	
	@RequestMapping("habitDelete.do")
	public String habitDelete(Model model, HttpServletRequest request, HabitVo hvo) throws Exception {
		
		String[] habitArray = request.getParameterValues("habit_id");
		
		for(int i=0; i<habitArray.length; i++) {
			HabitVo arrayHvo = new HabitVo();
			arrayHvo.setHabit_id(habitArray[i]);
			memberService.habitDelete(arrayHvo);
		}
		return "redirect:habitManagement.do";
	}
}
