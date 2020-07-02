package co.huby.prj;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.apache.tiles.request.attribute.Addable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.ResumeVo;

@Controller
public class MemberHomeController {

	@Autowired
	private EmploymentService employmentService;
	@Autowired
	CodeService codeService;

	@RequestMapping(value = "/employmentMatch.do")
	public String memberHome(Model model, HttpServletRequest request, ResumeVo vo) throws Exception {
		String memberid = (String) request.getSession().getAttribute("loginId");
		vo.setMember_id(memberid);
		List<Map> list = employmentService.getMatchedEmploymentList(vo);
		model.addAttribute("empMatch", list);
		return "person/common/memberHome";
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
		
		return "person/member/applypreview";
	}	
	
	@RequestMapping(value = "/applyInsert.do")
	public ModelAndView applyInsert(Model model, @RequestParam Map mapvo, HttpServletRequest request, HttpServletResponse response ,MemberVo mvo) throws Exception {
		ModelAndView mav = new ModelAndView();
		String id = (String) request.getSession().getAttribute("loginId");
		mapvo.put("member_id", id);
		
		int n = employmentService.applyInsert(mapvo);
		if(n==10) {
			String id2 = (String) request.getSession().getAttribute("loginId");
			mvo.setMember_id(id2);
			List<Map> amapvo = employmentService.applyList(mvo);
			model.addAttribute("alist", amapvo);
			mav.setViewName("person/member/applyManagement");
		}else {
			mav.setViewName("redirect:applyinfoall.do");
		}
		return mav;
	}
	
	@RequestMapping(value = "/applyManagement.do")
	public String applyManagement(Model model, @RequestParam Map mapvo, HttpServletRequest request, HttpServletResponse response ,MemberVo mvo) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
		mvo.setMember_id(id);
		List<Map> amapvo = employmentService.applyList(mvo);
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
	public String careerPreview(Model model, HttpServletRequest request, CodeVo cvo) throws Exception {
		List<CodeVo> codeList = codeService.SelectAll();
		model.addAttribute("clist", codeList);
		return "no/member/careerPreview";
	}
	
	@RequestMapping(value = "/skillPreview.do")
	public String skillPreview(Model model, HttpServletRequest request, CodeVo cvo) throws Exception {
		return "no/member/skillPreview";
	}
}
