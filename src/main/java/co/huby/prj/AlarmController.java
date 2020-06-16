package co.huby.prj;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.huby.prj.alarm.service.AlarmService;
import co.huby.prj.alarm.service.AlarmVo;
import co.huby.prj.alarm.service.UserVo;

@Controller
public class AlarmController {
	
	@Autowired
	AlarmService alarmService;

	@RequestMapping("/companyalarm.do")
	public String companyalarm(Model model, HttpServletRequest request) throws Exception {
		String company_id = (String) request.getSession().getAttribute("companyVo");
		UserVo vo = new UserVo();
		vo.setId(company_id);
		return "company/alarm/companyalarmlist";
	}
	
	
	@RequestMapping("/personalarm.do")
	public String personalarmlist(Model model, HttpServletRequest request, UserVo vo) throws Exception { 
		String personid = (String) request.getSession().getAttribute("loginId");
		
		ArrayList<AlarmVo> list = alarmService.personalarmlist(personid);
		model.addAttribute("personalarmlist", list);
		return "person/alarm/personalarmlist";
	}
	
}