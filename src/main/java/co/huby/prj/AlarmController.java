package co.huby.prj;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.huby.prj.alarm.service.AlarmService;
import co.huby.prj.alarm.service.AlarmVo;
import co.huby.prj.chat.service.ChatService;
import co.huby.prj.vo.CompanyVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.InterviewVo;

@Controller
public class AlarmController {

	@Autowired
	AlarmService alarmService;
	@Autowired
	ChatService chatService;

	@RequestMapping("/companyalarm.do") // 기업회원 알림 내역
	public String companyalarm(Model model, HttpServletRequest request, AlarmVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		ArrayList<AlarmVo> list = alarmService.companyalarmlist(companyid);
		model.addAttribute("companyalarmlist", list);
		return "company/alarm/companyalarmlist";
	}

	@RequestMapping("/personalarm.do") // 개인회원 알림 내역
	public String personalarmlist(Model model, HttpServletRequest request, AlarmVo vo) throws Exception {
		String personid = (String) request.getSession().getAttribute("loginId");
		ArrayList<AlarmVo> list = alarmService.personalarmlist(personid);
		model.addAttribute("personalarmlist", list);
		return "person/alarm/personalarmlist";
	}

	// 알람 수락 update
	@RequestMapping("/currentY.do")
	public void currentY(AlarmVo vo, InterviewVo vo2, Model model, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		vo.setAlarm_id(request.getParameter("alarmid"));
		alarmService.currentY(vo);

		vo2.setCompany_id(request.getParameter("companyid"));
		vo2.setMember_id(request.getParameter("memberid"));
		chatService.createRoom(vo2);

		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("location.href='personalarm.do';");
		out.print("</script>");
		// return "person/alarm/personalarmlist";
	}
	// 알람 거절 update
	/*
	 * @RequestMapping("/currentN.do") public String currentN(AlarmVo vo, Model
	 * model, HttpServletResponse response, HttpServletRequest request) throws
	 * Exception { response.setCharacterEncoding("UTF-8");
	 * response.setContentType("text/html; charset=UTF-8");
	 * 
	 * vo.setAlarm_id(request.getParameter("alarmid")); alarmService.currentN(vo);
	 * 
	 * PrintWriter out = response.getWriter(); out.print("<script>");
	 * out.print("alert('거절되었습니다.');"); out.print("</script>"); return
	 * "person/alarm/personalarmlist"; }
	 */

	// 개인이 요청 거절시 delete
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

	// 면접요청 insert
	@ResponseBody
	@RequestMapping(value = "/interviewRe.do")
	public Map interviewRe(HttpServletRequest request, AlarmVo vo) {
		String companyid = (String) request.getSession().getAttribute("loginId");

		vo.setCompany_id(companyid);
		int count = alarmService.alarmInsert(vo);
		alarmService.alarmInsert(vo);
		return Collections.singletonMap("count", count);

		// return vo;

	}
	//개인이 면접제의 상세보기 버튼 클릭 시 회사 정보
	@ResponseBody
	@RequestMapping(value = "/companyselect.do")
	public List<AlarmVo> companyselect(HttpServletRequest request, CompanyVo vo) throws Exception{
		vo.setCompany_id(request.getParameter("company_id"));
		List<AlarmVo> list = alarmService.companyselect(vo);
		return list;
		
	}
	
	
	//기업이 개인에게 입사지원요청 시 공고목록 
	@ResponseBody
	@RequestMapping(value = "/comemploymentlist.do")
	public List<Map> applyRe(HttpServletRequest request) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		
		//vo2.setCompany_id(companyid);
		List<Map> list = alarmService.comemploymentlist(companyid);
		return list;
		
	}
	
	// 입사 지원 insert
	@ResponseBody
	@RequestMapping(value = "/applyRe.do")
	public Map applyRe(HttpServletRequest request, AlarmVo vo) {
		String companyid = (String) request.getSession().getAttribute("loginId");

		vo.setCompany_id(companyid);
		int count = alarmService.alarmInsert(vo);
		alarmService.alarmInsert(vo);
		return Collections.singletonMap("count", count);
	}
}