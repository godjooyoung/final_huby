package co.huby.prj;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.huby.prj.alarm.service.AlarmService;
import co.huby.prj.alarm.service.AlarmVo;

@Controller
public class AlarmController {
	
	@Autowired
	AlarmService alarmService;

	@RequestMapping("/companyalarm.do") //기업회원 알림 내역
	public String companyalarm(Model model, HttpServletRequest request, AlarmVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		ArrayList<AlarmVo> list = alarmService.companyalarmlist(companyid);
		model.addAttribute("companyalarmlist", list);
		return "company/alarm/companyalarmlist";
	}
	
	
	@RequestMapping("/personalarm.do") //개인회원 알림 내역
	public String personalarmlist(Model model, HttpServletRequest request, AlarmVo vo) throws Exception { 
		String personid = (String) request.getSession().getAttribute("loginId");
		ArrayList<AlarmVo> list = alarmService.personalarmlist(personid);
		model.addAttribute("personalarmlist", list);
		return "person/alarm/personalarmlist";
	}
	
	//@RequestMapping(value="/currentY.do", method=RequestMethod.POST) // 알람 수락 update
	//public String currentY(@ModelAttribute AlarmVo vo) throws Exception {
	//	alarmService.currentY(vo);
	//	return "person/alarm/personalarmlist";
	//}
	
	//알람 거절
	
	//기업 알람 insert
}