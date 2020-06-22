package co.huby.prj;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	// 알람 수락 update
	@RequestMapping("/currentY.do") 
	public void currentY(AlarmVo vo, Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		vo.setAlarm_id(request.getParameter("alarmid"));
		alarmService.currentY(vo);
		
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('수락되었습니다.');");
		out.print("location.href='personalarm.do';");
		out.print("</script>");
		//return "person/alarm/personalarmlist";
	}
	//알람 거절 update 
	/*@RequestMapping("/currentN.do")
	public String currentN(AlarmVo vo, Model model, HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		vo.setAlarm_id(request.getParameter("alarmid"));
		alarmService.currentN(vo);
		
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('거절되었습니다.');");
		out.print("</script>");
		return "person/alarm/personalarmlist";
	}*/
	
	//개인이 요청 거절시 delete
	@RequestMapping("/alarmdelete.do")
	public void alarmdelete(AlarmVo vo, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		vo.setAlarm_id(request.getParameter("alarmid"));
		alarmService.alarmdelete(vo);
		
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('거절되었습니다.');");
		out.print("location.href='personalarm.do';");
		out.print("</script>");
		
	}
	
	//면접요청 insert
	@ResponseBody
	@RequestMapping(value = "/interviewRe.do")
	public Map interviewRe(HttpServletRequest request, AlarmVo vo) {
		String companyid = (String) request.getSession().getAttribute("loginId");
		
		vo.setCompany_id(companyid);
		int count = alarmService.alarmInsert(vo);
		
		
		return Collections.singletonMap("count", count);
	}
}