package co.huby.prj;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.board.service.BoardService;
import co.huby.prj.member.service.CompanyMemberService;
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

	@RequestMapping("/CompanyInsertJoin.do")
	public ModelAndView CompanyInsertJFoin(Model model, CompanyVo vo) {
		ModelAndView mav = new ModelAndView();
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
			ResumeVo resumeVo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String videoid = (String) request.getParameter("video_id");
		String memberId = (String) request.getParameter("member_id");
		memberVo.setMember_id(memberId);
		resumeVo.setMember_id(memberId);
		VideoVo video = boardService.get_video(videoid);
		MemberVo member = memberService.selectone(memberVo);
		ResumeVo resume = boardService.get_resume(resumeVo);
		model.addAttribute("video", video);
		model.addAttribute("member", member);
		model.addAttribute("resume", resume);
		mav.setViewName("company/company/resumeDetail");
		return mav;
	}

	@RequestMapping("/employments.do")
	public ModelAndView employments(Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("company/common/test");
		return mav;
	}
}
