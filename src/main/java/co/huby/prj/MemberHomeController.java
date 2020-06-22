package co.huby.prj;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.vo.ResumeVo;

@Controller
public class MemberHomeController {

	@Autowired
	private EmploymentService employmentService;

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
	public String applyinfoall(Model model, @RequestParam Map mapvo, HttpServletRequest request) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");	
		mapvo.put("member_id", id);
		
		List<Map> lmapvo = employmentService.resumeAll(mapvo);
		List<Map> vmapvo = employmentService.videoAll(mapvo);
		List<Map> smapvo = employmentService.skillsAll(mapvo);
		List<Map> cmapvo = employmentService.careerAll(mapvo);
		
		model.addAttribute("rlist",lmapvo);
		model.addAttribute("vlist",vmapvo);
		model.addAttribute("slist",smapvo);
		model.addAttribute("clist",cmapvo);
		
		return "person/member/applyinfoall";
	}
	
	@RequestMapping(value = "/applypreview.do")
	public String applyPreview(Model model, @RequestParam Map mapvo, HttpServletRequest request) throws Exception {
		
		return "no/member/applypreview";
	}
	
}
