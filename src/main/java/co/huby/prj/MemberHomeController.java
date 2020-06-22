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
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.EmploymentsVo;
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
		if(n==1) {
			mav.setViewName("redirect:applyManagement.do");
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
	
	/*@RequestMapping(value = "/selectApplyList.do")
	public String selectApplyList(Model model, @RequestParam Map mapvo, HttpServletRequest request, EmploymentsVo evo) throws Exception {
		List<Map> checkMap = employmentService.empDetailList(evo);
		String num = "0";
		if(checkMap != null) {
			num = "1";
		}else {
			num = "0";
		}
		
		return num;
	}*/
	

}
