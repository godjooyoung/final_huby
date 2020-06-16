package co.huby.prj;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.VideoVo;

@Controller
public class MemberHomeController {

	@Autowired
	private EmploymentService employmentService;

	@RequestMapping(value = "/employmentMatch.do")
	public String memberHome(Model model, HttpServletRequest request, EmploymentsVo vo) throws Exception {
		List<Map> list = employmentService.getMatchedEmploymentList(vo);
		model.addAttribute("empMatch", list);
		return "person/common/memberHome";
	}

}
