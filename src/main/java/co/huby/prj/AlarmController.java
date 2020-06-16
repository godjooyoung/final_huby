package co.huby.prj;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.huby.prj.alarm.service.AlarmService;
import co.huby.prj.alarm.service.AlarmVo;
import co.huby.prj.member.service.MemberVo;

@Controller
public class AlarmController {
	
	@Autowired
	AlarmService alarmService;

	@RequestMapping("/companyalarm.do")
	public String companyalarm(Model model) {
		return "alarm/companyalarmlist";
	}
	
	
	@RequestMapping("/personalarm.do")
	public String personalarmlist(Model model, HttpServletRequest request) throws Exception {
		HttpSession session =request.getSession(); 
		String id = ((MemberVo)session.getAttribute("personalVo")).getMember_id();
		
		ArrayList<AlarmVo> list = alarmService.personalarmlist();
		model.addAttribute("list", list);
		return "alarm/personalarmlist";
	}
	
}