package co.huby.prj;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.huby.prj.admin.service.AdminService;
import co.huby.prj.board.service.QuestionService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.CompanyVo;
import co.huby.prj.vo.NoticeVo;
import co.huby.prj.vo.Paging;
import co.huby.prj.vo.QuestionVo;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	QuestionService questionService;
	
	@RequestMapping("/index.do")
	public String index(Locale locale, Model model, MemberVo mvo) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		int result1 = adminService.allMemberCnt();
		int result2 = adminService.allCompanyMemberCnt(); 
		int result3 = adminService.allQnaCnt(); 
		int result4 = adminService.allMemberResumeCnt();
		int result5 = adminService.allCompanyEmploymentsCnt(); 
		int result6 = adminService.allViceoCnt(); 
		int result7 = adminService.allInterviewCnt(); 
		int result8 = adminService.allApplyCnt(); 
		List<Map> result9 = adminService.memberFirstHopeJob(); 
		List<Map> result10 = adminService.companyFirstHopeJob();
		List<Map> result11 = adminService.monthlyMemberCnt();
		List<Map> result12 = adminService.monthlyCompanyMemberCnt();
		
		model.addAttribute("result1",result1);	//	전체 회원 수
		model.addAttribute("result2",result2); // 전체 기업회원 수
		model.addAttribute("result3",result3); // 답변 해줘야 할 Qna 수
		model.addAttribute("result4",result4); // 전체 개인 이력서 수
		model.addAttribute("result5",result5); // 전체 회사 공고 수
		model.addAttribute("result6",result6); // 전체 개인 영상 수
		model.addAttribute("result7",result7); // 개인과 회사간의 진행중인 면접 수
		model.addAttribute("result8",result8); // 개인이 회사에 실제 지원한 이력서 개수
		model.addAttribute("result9",result9); // 개인이 가장 선호하는 1순위 직종(가지고 있는 이력서 기준) 
		model.addAttribute("result10",result10); // 회사가 공고에 가장 많이 낸 1순위 직종(올린 공고 기준)
		model.addAttribute("result11",result11); // 월별 개인 가입자 수
		model.addAttribute("result12",result12); // 월별 개인 가입자 수
		
		return "no/admin/index";
	}
	
	@RequestMapping("/noticePage.do")
	public String noticePage(Model model,NoticeVo nvo, HttpServletRequest request) {
		Paging paging = new Paging();
		paging.setPageUnit(10);
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);
		nvo.setFirst(paging.getFirst());
		nvo.setLast(paging.getLast());
		int count = adminService.noticeCnt();
		
		paging.setTotalRecord(count);
		
		List<NoticeVo> checkVo = adminService.noticeSelectAll(nvo);
		model.addAttribute("paging", paging);
		model.addAttribute("nlist",checkVo);
		return "no/admin/noticepage";
	}
	
	@RequestMapping("/qnaPage.do")
	public String qnaPage(Model model) throws Exception {
		List<QuestionVo> qvo = questionService.qnaSelectAll();
		
		model.addAttribute("qlist", qvo);
		return "no/admin/qnapage";
	}
	
	@RequestMapping("/userManagement.do")
	public String userManagement(Model model) {
		
		return "no/admin/usermanagement";
	}
	
	@RequestMapping("/noticeManagement.do")
	public String noticeManagement(Model model) {
		
		return "no/admin/noticemanagement";
	}
	
	@RequestMapping("/vManagement.do")
	public String vManagement(Model model) {
		
		return "no/admin/vmanagement";
	}
	
	@RequestMapping("/noticeselectpage.do")
	public String noticeSelectPage(Model model) {
		
		return "no/admin/noticeselectpage";
	}
	
	@RequestMapping("qnaselectpage.do")
	public String qnaSelectPage(Model model) {
		
		return "no/admin/qnaselectpage";
	}
	
	@RequestMapping("userSelectPage.do")
	public String userSelectPage(Model model) {
		
		return "no/admin/userselectpage";
	}
	
	@RequestMapping("personalmemberall.do")
	public String personalmemberall(Model model, MemberVo mvo, HttpServletRequest request) {
		Paging paging = new Paging();
		paging.setPageUnit(10);
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);
		mvo.setFirst(paging.getFirst());
		mvo.setLast(paging.getLast());
		int count = adminService.memberCnt();
		
		paging.setTotalRecord(count);
		
		List<MemberVo> checkVo = adminService.memberSelectAll(mvo);
		model.addAttribute("paging", paging);
		model.addAttribute("mlist", checkVo);
		return "no/admin/personalmemberall";
	}
	
	@RequestMapping("companymemberall.do")
	public String companymemberall(Model model, CompanyVo cvo, HttpServletRequest request) {
		Paging paging = new Paging();
		paging.setPageUnit(10);
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);
		cvo.setFirst(paging.getFirst());
		cvo.setLast(paging.getLast());
		int count = adminService.CompanyCnt();
		
		paging.setTotalRecord(count);
		
		List<CompanyVo> checkVo = adminService.companySelectAll(cvo);
		model.addAttribute("paging", paging);
		model.addAttribute("clist", checkVo);
		return "no/admin/companymemberall";
	}
	
	@RequestMapping("noticeInsertPage.do")
	public String noticeInsertPage(Model model) {
		return "no/admin/noticeInsertPage";
	}
	
	@RequestMapping("noticeInsert.do")
	public String noticeInsert(Model model, NoticeVo nvo) {
		String id = "admin";
		nvo.setAdmin_id(id);
		
		int n = adminService.noticeInsert(nvo);
		
		return "redirect:noticePage.do";
	}
	
	@RequestMapping("noticeSelectOnePage.do")
	public String noticeSelectOnePage(Model model, NoticeVo nvo) {
		NoticeVo checkVo = adminService.noticeSelectOne(nvo);
		model.addAttribute("nvo",checkVo);
		return "no/admin/noticeSelectOnePage";
	}
	
	@RequestMapping("noticeUpdate.do")
	public String noticeUpdate(Model model, NoticeVo nvo) {
		int n = adminService.noticeUpdate(nvo);
		
		return "redirect:noticePage.do";
	}
	
	@RequestMapping("noticeDelete.do")
	public String noticeDelete(Model model, NoticeVo nvo) {
		int n = adminService.noticeDelete(nvo);
		
		return "redirect:noticePage.do";
	}
	
	@RequestMapping("qnaAnswerPage.do")
	public String qnaAnswerPage(Model model, QuestionVo qvo) throws Exception {
		QuestionVo checkVo = questionService.getSelectQuestion(qvo);
		model.addAttribute("qvo", checkVo);
		
		return "no/admin/qnaAnswerPage";
	}
	
	@RequestMapping("qnaAnswerInsert.do")
	public String qnaAnswerInsert(Model model, QuestionVo qvo) throws Exception {
		int n = questionService.qUpdateAdmin(qvo);
		
		return "redirect:qnaPage.do";
	}
	
	@RequestMapping("adminLogout.do")
	public String adminLogout(Model model, HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("adminVo");
		return "no/common/login";
	}
	
	@ResponseBody
	@RequestMapping("memberHot.do")
	public List<Map> memberHot(Model model, HttpServletRequest request) throws Exception {
		List<Map> memberHot = adminService.memberFirstHopeJob();
		return memberHot;
	}
	
	@ResponseBody
	@RequestMapping("companyHot.do")
	public List<Map> companyHot(Model model, HttpServletRequest request) throws Exception {
		List<Map> companyHot = adminService.companyFirstHopeJob();
		return companyHot;
	}
	
	@ResponseBody
	@RequestMapping("monthlyMemberCnt.do")
	public List<Map> monthlyMemberCnt(Model model, HttpServletRequest request) throws Exception {
		List<Map> monthlyMemberCnt = adminService.monthlyMemberCnt();
		return monthlyMemberCnt;
	}
	
	@ResponseBody
	@RequestMapping("monthlycompanyCnt.do")
	public List<Map> monthlycompanyCnt(Model model, HttpServletRequest request) throws Exception {
		List<Map> monthlycompanyCnt = adminService.monthlyCompanyMemberCnt();
		return monthlycompanyCnt;
	}
}
