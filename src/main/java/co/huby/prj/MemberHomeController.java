package co.huby.prj;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.board.service.BoardService;
import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.ApplyVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.HabitVo;
import co.huby.prj.vo.Paging;
import co.huby.prj.vo.ResumeVo;
import co.huby.prj.vo.VideoVo;

@Controller
public class MemberHomeController {

	@Autowired
	private EmploymentService employmentService;
	@Autowired
	CodeService codeService;
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/employmentMatch.do")
	public String memberHome(Model model, HttpServletRequest request, ResumeVo vo) throws Exception {
		String memberid = (String) request.getSession().getAttribute("loginId");
		vo.setMember_id(memberid);
		List<Map> list = employmentService.getMatchedEmploymentList(vo);
		model.addAttribute("empMatch", list);
		return "person/common/memberHome";
	}
	
	@RequestMapping(value = "/empMatch.do")
	public String empMatch(Model model, HttpServletRequest request, ResumeVo vo) throws Exception {
		String memberid = (String) request.getSession().getAttribute("loginId");
		vo.setMember_id(memberid);
		List<Map> list = employmentService.getMatchedEmploymentList(vo);
		model.addAttribute("empMatch", list);
		return "person/member/empMatch";
	}

	@RequestMapping(value = "/selectresumepage.do")
	public String selectresumepage(Model model, @RequestParam Map vo) throws Exception {
		Map checkVo = employmentService.SelectMatchedEmploymentList(vo);

		model.addAttribute("empMatch", checkVo);
		return "person/member/selectresumepage";
	}

	@RequestMapping(value = "/applyinfoall.do")
	public String applyinfoall(Model model, @RequestParam Map mapvo, HttpServletRequest request, MemberVo mvo)
			throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);

		List<CodeVo> codeList = codeService.SelectAll();
		List<Map> lmapvo = employmentService.resumeAll(mvo);
		List<Map> vmapvo = employmentService.videoAll(mvo);
		List<Map> smapvo = employmentService.skillsAll(mvo);
		List<Map> cmapvo = employmentService.careerAll(mvo);
		List<Map> hmapvo = employmentService.habitAll(mvo);
		

		model.addAttribute("rlist", lmapvo);
		model.addAttribute("vlist", vmapvo);
		model.addAttribute("slist", smapvo);
		model.addAttribute("clist", cmapvo);
		model.addAttribute("hlist", hmapvo);
		model.addAttribute("mapvo", mapvo);
		model.addAttribute("codelist", codeList);

		return "person/member/applyinfoall";
	}

	@RequestMapping(value = "/applypreview.do")
	public String applyPreview(Model model, @RequestParam Map mapvo, HttpServletRequest request, MemberVo mvo) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);
		
		List<Map> lmapvo = employmentService.resumeAll(mvo);
		List<Map> vmapvo = employmentService.videoAll(mvo);
		
		model.addAttribute("rlist",lmapvo);
		model.addAttribute("vlist",vmapvo);
		
		return "no/member/applypreview";
	}	
	
	@RequestMapping(value = "/applyInsert.do")
	public ModelAndView applyInsert(Model model, @RequestParam Map mapvo, HttpServletRequest request, HttpServletResponse response ,MemberVo mvo, ResumeVo rvo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = (String) request.getSession().getAttribute("loginId");
		mapvo.put("member_id", id);
		
		int n = employmentService.applyInsert(mapvo);
		if(n==10) {
			String memberid = (String) request.getSession().getAttribute("loginId");
			mvo.setMember_id(memberid);
			Paging paging = new Paging();
			paging.setPageUnit(10);
			String page = request.getParameter("page");
			int p = 1;
			if (page != null)
				p = Integer.parseInt(page);
			paging.setPage(p);
			mvo.setFirst(paging.getFirst());
			mvo.setLast(paging.getLast());
			int count = employmentService.applyCnt(mvo);
			paging.setTotalRecord(count);
			List<Map> amapvo = employmentService.applyList(mvo);
			model.addAttribute("paging",paging);
			model.addAttribute("alist", amapvo);
			String applyCheck = "10";
			model.addAttribute("applyCheck",applyCheck);
			
			mav.setViewName("person/member/applyManagement");
		}else if(n==20){
			String memberid = (String) request.getSession().getAttribute("loginId");
			rvo.setMember_id(memberid);
			List<Map> list = employmentService.getMatchedEmploymentList(rvo);
			model.addAttribute("empMatch", list);
			
			String error = "error";
			model.addAttribute("error",error);
			mav.setViewName("person/common/memberHome");
		}
		return mav;
	}
	
	@RequestMapping(value = "/applyManagement.do")
	public String applyManagement(Model model, @RequestParam Map mapvo, HttpServletRequest request, HttpServletResponse response ,MemberVo mvo) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);
		Paging paging = new Paging();
		paging.setPageUnit(10);
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);
		mvo.setFirst(paging.getFirst());
		mvo.setLast(paging.getLast());
		int count = employmentService.applyCnt(mvo);
		paging.setTotalRecord(count);
		List<Map> amapvo = employmentService.applyList(mvo);
		model.addAttribute("paging",paging);
		model.addAttribute("alist", amapvo);
		
		return "person/member/applyManagement";
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectApplyList.do")
	public EmploymentsVo selectApplyList(Model model, @RequestParam Map mapvo, HttpServletRequest request, EmploymentsVo evo) throws Exception {
		EmploymentsVo checkVo = employmentService.selectApplyList(evo);
		
		return checkVo;
	}
	
	@RequestMapping(value = "/areaEmployment.do")
	public String areaEmployment(Model model, EmploymentsVo evo) throws Exception {
		List<Map> checkMap = employmentService.employmentList(evo);
		model.addAttribute("elist", checkMap);
		
		return "person/member/areaEmployment";
	}
	
	@RequestMapping(value = "/resumePreview.do")
	public String resumePreview(Model model, HttpServletRequest request) throws Exception {
		List<CodeVo> codeList = codeService.SelectAll();
		model.addAttribute("clist", codeList);
		return "no/member/resumePreview";
	}
	
	@RequestMapping(value = "/careerPreview.do")
	public String careerPreview(Model model, HttpServletRequest request) throws Exception {
		List<CodeVo> codeList = codeService.SelectAll();
		model.addAttribute("clist", codeList);
		return "no/member/careerPreview";
	}
	
	@RequestMapping(value = "/skillPreview.do")
	public String skillPreview(Model model, HttpServletRequest request) throws Exception {
		return "no/member/skillPreview";
	}
	
	@RequestMapping(value = "/habitPreview.do")
	public String habitPreview(Model model, HttpServletRequest request) throws Exception {
		return "no/member/habitPreview";
	}
	
	@ResponseBody
	@RequestMapping(value = "/habitInsertAjax.do")
	public int habitInsertAjax(Model model, HttpServletRequest request, HabitVo hvo) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		hvo.setMember_id(id);
		int n = memberService.habitInsert(hvo);
		return n;
	}
	
	@RequestMapping(value = "/myApplyResume.do")
	public String myApplyResume(Model model, HttpServletRequest request,ApplyVo avo, MemberVo mvo) throws Exception {
		Map checkMap = boardService.get_apply_member_info(avo);
		model.addAttribute("applyman", checkMap);
		
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);

		String resumeId = (String) checkMap.get("resume_id");
		String videoId = (String) checkMap.get("video_id");
		
		ResumeVo resumeVo = memberService.selectResumeOne(resumeId);
		VideoVo videoVo = memberService.selectVideoOne(videoId);
		model.addAttribute("applyRvo",resumeVo);
		model.addAttribute("applyVvo", videoVo);
		
		List<CodeVo> codeList = codeService.SelectAll();
		//List<Map> lmapvo = employmentService.resumeAll(mvo);
		//List<Map> vmapvo = employmentService.videoAll(mvo);
		List<Map> smapvo = employmentService.skillsAll(mvo);
		List<Map> cmapvo = employmentService.careerAll(mvo);
		List<Map> hmapvo = employmentService.habitAll(mvo);
		

//		model.addAttribute("rlist", lmapvo);
//		model.addAttribute("vlist", vmapvo);
		model.addAttribute("slist", smapvo);
		model.addAttribute("clist", cmapvo);
		model.addAttribute("hlist", hmapvo);
		model.addAttribute("codelist", codeList);
		
		return "person/member/myApplyResume";
	}
}
