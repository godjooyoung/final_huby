package co.huby.prj;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;
import co.huby.prj.member.service.FileRenamePolicy;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.EmploymentsVo;

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
		return "person/member/employmentList";
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

		if (!uploadFile.isEmpty()) {
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

}
