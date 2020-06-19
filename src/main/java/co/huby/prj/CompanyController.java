package co.huby.prj;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
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
	BoardService boardService;
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
	public ModelAndView resumeDetail(Model model, HttpServletRequest request, VideoVo videoVo, MemberVo memberVo)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = (String) request.getSession().getAttribute("loginId");
		List<Map> list1 = boardService.get_video(id);
		MemberVo list2 = memberService.selectone(memberVo);
		model.addAttribute("video", list1);
		model.addAttribute("member", list2);
		mav.setViewName("company/company/resumeDetail");
		return mav;
	}
}
