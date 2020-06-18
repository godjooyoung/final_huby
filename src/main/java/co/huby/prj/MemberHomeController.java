package co.huby.prj;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.member.service.MemberVo;
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
	public String applyinfoall(Model model, @RequestParam Map vo, HttpServletRequest request) throws Exception {
		String id = (String) request.getSession().getAttribute("loginId");
			
		vo.put("member_id", id);
		List<Map> checkVo = employmentService.ApplyUserInfoAll(vo);		
		
		model.addAttribute("empMatch", checkVo);
		
		return "person/member/applyinfoall";
	}
}
