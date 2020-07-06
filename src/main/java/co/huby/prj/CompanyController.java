package co.huby.prj;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import co.huby.prj.board.service.BoardService;
import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;
import co.huby.prj.member.service.CompanyMemberService;
import co.huby.prj.member.service.FileRenamePolicy;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.CompanyVo;
import co.huby.prj.vo.ResumeVo;
import co.huby.prj.vo.VideoVo;

@Controller
public class CompanyController {

	@InitBinder
	public void allowEmptyDateBinding(WebDataBinder binder) {
		// Custom String Editor. tell spring to set empty values as null instead of
		// empty string.
		// binder.registerCustomEditor( String.class, new StringTrimmerEditor( true ));
		// Custom Date Editor

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		simpleDateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, true));
	}

	@Autowired
	CompanyMemberService companyMemberService;
	@Autowired
	BoardService boardService;
	@Autowired
	MemberService memberService;
	@Autowired
	CodeService codeService;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@RequestMapping("/CompanyInsertJoin.do")
	public ModelAndView CompanyInsertJFoin(Model model, CompanyVo vo, HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		
		MultipartFile uploadFile = vo.getCuploadfile();
		String path = request.getSession().getServletContext().getRealPath("/resources/FileUpload");
		System.out.println("@@@@@@@@" + path);
		
		if (uploadFile != null && uploadFile.getSize()>0) {
			String fileName = uploadFile.getOriginalFilename();
			File file = new File(path, fileName);
			file = new FileRenamePolicy().rename(file);
			uploadFile.transferTo(file);
			vo.setCompany_photo(file.getName());
		} else {
			vo.setCompany_photo("");
		}
		
		int n = companyMemberService.companyMemberInsert(vo);
		
		if (n == 1) {
			mav.setViewName("no/common/login");
		} else {
			mav.setViewName("member/personalmemberjoinFail");
		}
		return mav;
	}

	@RequestMapping("/resumeDetail.do")
	public ModelAndView resumeDetail(Model model, HttpServletRequest request, VideoVo videoVo, MemberVo memberVo,
		ResumeVo resumeVo, CodeVo codeVo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String videoid = (String) request.getParameter("video_id");
		String memberId = (String) request.getParameter("member_id");
		String code_name = (String) request.getParameter("hashcode");
		memberVo.setMember_id(memberId);
		resumeVo.setMember_id(memberId);
		codeVo.setCode_name(code_name);
		VideoVo video = boardService.get_video(videoid);
		MemberVo member = memberService.selectone(memberVo);
		ResumeVo resume = boardService.get_resume(resumeVo);
		codeVo = codeService.get_codeAll(codeVo);
		
		model.addAttribute("video", video);
		model.addAttribute("member", member);
		model.addAttribute("resume", resume);
		model.addAttribute("code", codeVo);
		mav.setViewName("company/company/resumeDetail");
		return mav;
	}

	@RequestMapping("/employments.do")
	public ModelAndView employments(Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("company/common/test");
		return mav;
	}
	
	@RequestMapping("/companyInfoUpdatePage.do")
	public String companyInfoUpdatePage(Model model, HttpServletRequest request, CompanyVo cvo) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		cvo.setCompany_id(id);
		CompanyVo checkVo = companyMemberService.companySelectOne(cvo);
		model.addAttribute("cvo",checkVo);
		List<CodeVo> typeVo = codeService.SelectAll();
		model.addAttribute("typeVo",typeVo);
		
		return "company/company/companyInfoUpdatePage";
	}
	
	@RequestMapping("/companyInfoUpdate.do")
	public String companyInfoUpdate(Model model, HttpServletRequest request, CompanyVo cvo) throws IllegalStateException, IOException {
		String id = (String) request.getSession().getAttribute("loginId");
		cvo.setCompany_id(id);
		
		MultipartFile uploadFile = cvo.getCuploadfile();
		String path = request.getSession().getServletContext().getRealPath("/resources/FileUpload");
		System.out.println("@@@@@@@@" + path);
		System.out.println("@@@@@@@@@@@@@@@@@"+uploadFile.getSize());
		if (uploadFile != null && uploadFile.getSize()>0) {
			String fileName = uploadFile.getOriginalFilename();
			File file = new File(path, fileName);
			file = new FileRenamePolicy().rename(file);
			uploadFile.transferTo(file);
			cvo.setCompany_photo(file.getName());
		} else {
			cvo.setCompany_photo("");
		}
		
		
		int n = companyMemberService.companyMemberUpdate(cvo);
		
		return "redirect:companyInfoUpdatePage.do";
	}
	
	@ResponseBody
	@RequestMapping("/companyPwUpdateCheck.do")
	public String companyPwUpdateCheck(Model model, HttpServletRequest request, CompanyVo cvo) {
		String companyId = (String) request.getSession().getAttribute("loginId");
		cvo.setCompany_id(companyId);
		CompanyVo checkCvo = companyMemberService.selectone(cvo);
		
		String error = "";
		
		boolean pwdMatch = pwdEncoder.matches(cvo.getCompany_pw(), checkCvo.getCompany_pw());
		if(pwdMatch) {
			error = "10";
		}else {
			error = "20"; 
		}
		
		return error;
	}
	@RequestMapping(value = "/companyPwUpdate.do")
	public String companyPwUpdate(Model model, HttpServletRequest request, CompanyVo cvo) {
		int n = companyMemberService.companyPwUpdate(cvo);
		return "redirect:companyInfoUpdatePage.do";
	}
	
}
