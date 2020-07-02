package co.huby.prj;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;
import co.huby.prj.member.service.FileRenamePolicy;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.CareerVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.HabitVo;
import co.huby.prj.vo.SkillsVo;

@Controller
public class MemberController {

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

	@Autowired
	MemberService memberService;
	@Autowired
	EmploymentService employmentService;
	@Autowired
	CodeService codeService;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@RequestMapping("/employment.do")
	public String employment(Model model) {

		return "member/employment";
	}

	@RequestMapping("/myresume.do")
	public String myresume(Model model) {

		return "member/myresume";
	}

	@RequestMapping("/personalmemberjoin.do")
	public String PersonalMemberJoin(Model model) {

		return "no/common/personalmemberjoin";
	}

	@RequestMapping("/MemberInsertJoin.do")
	public ModelAndView MemberInsertJoin(Model model, MemberVo vo, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		MultipartFile uploadFile = vo.getUploadFile();
		String path = request.getSession().getServletContext().getRealPath("/resources/FileUpload");
		System.out.println("@@@@@@@@" + path);

		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			File file = new File(path, fileName);
			file = new FileRenamePolicy().rename(file);
			uploadFile.transferTo(file);
			vo.setMember_photo(file.getName());
		} else {
			vo.setMember_photo("");
		}

		int n = memberService.memberInsert(vo);

		if (n == 1) {
			mav.setViewName("no/common/login");
		} else {
			mav.setViewName("no/common/personalmemberjoinFail");
		}
		return mav;
	}

	@RequestMapping("/employmentList.do")
	public String employmentList(Model model, EmploymentsVo vo) throws Exception {
		List<Map> list = employmentService.employmentList(vo);
		List<CodeVo> typeVo = codeService.SelectAll();
		model.addAttribute("elist", list);
		model.addAttribute("typeVo", typeVo);
		return "person/member/empList";
	}

	@ResponseBody
	@RequestMapping(value = "/empDetaleList.do")
	public List<Map> empDetaleList(Model model, HttpServletRequest request, EmploymentsVo vo) throws Exception {
		String empid = request.getParameter("empno");
		vo.setEmployment_id(empid);
		List<Map> list = employmentService.empDetailList(vo);
		return list;
	}
	
	@RequestMapping(value = "/myInfoUpdatePage.do")
	public String myInfoUpdatePage(Model model, MemberVo mvo, HttpServletRequest request) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);
		MemberVo checkVo = memberService.selectone(mvo);
		model.addAttribute("mlist",checkVo);
		return "person/member/myInfoUpdatePage";
	}
	
	@RequestMapping(value = "/myInfoUpdate.do")
	public String myInfoUpdate(Model model, MemberVo mvo, HttpServletRequest request) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);
		
		MultipartFile uploadFile = mvo.getUploadFile();
		String path = request.getSession().getServletContext().getRealPath("/resources/FileUpload");
		System.out.println("@@@@@@@@" + path);

		if (uploadFile != null && uploadFile.getSize()>0) {
			String fileName = uploadFile.getOriginalFilename();
			File file = new File(path, fileName);
			file = new FileRenamePolicy().rename(file);
			uploadFile.transferTo(file);
			mvo.setMember_photo(file.getName());
		} else {
			mvo.setMember_photo(mvo.getMember_photo());
		}
		
		int n = memberService.memberUpdate(mvo);
		
		return "redirect:myInfoUpdatePage.do";
	}
	
	@RequestMapping(value = "/skillInsertPage.do")
	public String skillInsertPage(Model model) throws Exception {
		return "person/member/skillInsertPage";
	}
	
	@RequestMapping(value = "/skillInsert.do")
	public String skillInsert(Model model, HttpServletRequest request, SkillsVo svo) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		svo.setMember_id(id);
		
		int n = memberService.skillInsert(svo);
		
		return "redirect:resumemanagement.do";
	}
	
	@RequestMapping(value = "/skillDelete.do")
	public String skillDelete(Model model, HttpServletRequest request, SkillsVo svo) throws Exception {
		
		int n = memberService.skillDelete(svo);
		
		return "redirect:resumemanagement.do";
	}
	
	@RequestMapping(value = "/skillUpdatePage.do")
	public String skillUpdatePage(Model model, HttpServletRequest request, SkillsVo svo) throws Exception {
		
		SkillsVo checkVo = memberService.skillSelect(svo);
		model.addAttribute("svo",checkVo);
		
		return "person/member/skillUpdatePage";
	}
	
	@RequestMapping(value = "/skillUpdate.do")
	public String skillUpdate(Model model, HttpServletRequest request, SkillsVo svo) throws Exception {
		
		int n = memberService.skillUpdate(svo);
		
		return "redirect:resumemanagement.do";
	}
	
	@RequestMapping(value = "/careerInsertPage.do")
	public String careerInsertPage(Model model) throws Exception {
		List<CodeVo> typeVo = codeService.SelectAll();
		model.addAttribute("typeVo",typeVo);
		
		return "person/member/careerInsertPage";
	}
	
	@RequestMapping(value = "/careerInsert.do")
	public String careerInsert(Model model, HttpServletRequest request, CareerVo cvo) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		cvo.setMember_id(id);
		
		
		int n = memberService.careerinsert(cvo);
		
		return "redirect:resumemanagement.do";
	}
	
	@RequestMapping(value = "/careerDelete.do")
	public String careerDelete(Model model, CareerVo cvo) throws Exception {
		
		int n = memberService.careerDelete(cvo);
		
		
		return "redirect:resumemanagement.do";
	}
	
	@RequestMapping(value = "/careerUpdatePage.do")
	public String careerUpdatePage(Model model, CareerVo cvo) throws Exception {
		CareerVo checkVo = memberService.careerSelect(cvo);
		List<CodeVo> typeVo = codeService.SelectAll();
		model.addAttribute("typeVo",typeVo);
		model.addAttribute("cvo", checkVo);
		
		
		return "person/member/careerUpdatePage";
	}
	
	@RequestMapping(value = "/careerUpdate.do")
	public String careerUpdate(Model model, CareerVo cvo) throws Exception {
		CareerVo checkVo = memberService.careerSelect(cvo);
		List<CodeVo> typeVo = codeService.SelectAll(); 
		
		
		
				
		model.addAttribute("typeVo",typeVo);
		model.addAttribute("cvo", checkVo);
		
		int n = memberService.careerUpdate(cvo);
		
		return "redirect:resumemanagement.do";
	}
	
	@RequestMapping(value = "/habitManagement.do")
	public String habitManagement(Model model, HabitVo hvo, HttpServletRequest request,MemberVo mvo) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);
		List<HabitVo> list = memberService.habitSelectAll(mvo);
		model.addAttribute("hlist", list);
		
		return "person/member/habitManagement";
	}
	
	@RequestMapping(value = "/habitUpdate.do")
	public String habitUpdate(Model model,HabitVo hvo) throws Exception {
		int n = memberService.habitUpdate(hvo);
		
		return "redirect:habitManagement.do";
	}
	
	@RequestMapping(value = "/habitInsertPage.do")
	public String habitUpdate(Model model) throws Exception {
		
		return "person/member/habitInsertPage";
	}
	
	@RequestMapping(value = "/habitInsert.do")
	public ModelAndView habitInsert(Model model, HttpServletRequest request, HabitVo hvo, MemberVo mvo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = (String) request.getSession().getAttribute("loginId");
		hvo.setMember_id(id);
		int n = memberService.habitInsert(hvo);
		
		if(n==1) {
			String memberid = (String) request.getSession().getAttribute("loginId");
			mvo.setMember_id(memberid);
			List<HabitVo> list = memberService.habitSelectAll(mvo);
			model.addAttribute("hlist", list);
			mav.setViewName("person/member/habitManagement");
		}else {
			String num = "0";
			model.addAttribute("error", num);
			mav.setViewName("person/member/habitInsertPage");
		}
		
		return mav;
	}
	
	/*@RequestMapping(value = "/habitDelete.do")
	public String habitDelete(Model model, HabitVo hvo) throws Exception {
		int n = memberService.habitDelete(hvo);
		
		return "redirect:habitManagement.do";
	}*/
	
	@RequestMapping(value = "/pwUpdate.do")
	public String pwUpdate(Model model, MemberVo mvo, HttpServletRequest request) throws Exception {
		int n = memberService.pwUpdate(mvo);
		String num = "0";
		if(n==1) {
			num = "1";
		}else {
			num = "0";
		}
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);
		MemberVo checkVo = memberService.selectone(mvo);
		model.addAttribute("mlist",checkVo);
		model.addAttribute("resultCheck",num);
		
		return "person/member/myInfoUpdatePage";
	}
	
	@ResponseBody
	@RequestMapping(value ="/realpwcheck.do")
	public String realPwCheck(Model model, MemberVo mvo, HttpServletRequest request) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);
		MemberVo pwCheckVo = memberService.selectone(mvo);
		
		String result = "";
		
		boolean pwdMatch = pwdEncoder.matches(mvo.getMember_pw(), pwCheckVo.getMember_pw());
		if(pwdMatch) {
			result = "1";
		}else {
			result = "0";
		}
		
		return result;
	}
}
