package co.huby.prj;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.huby.prj.admin.service.AdminService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.CompanyVo;
import co.huby.prj.vo.NoticeVo;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/index.do")
	public String index(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "no/admin/index";
	}
	
	@RequestMapping("/noticePage.do")
	public String noticePage(Model model) {
		List<NoticeVo> checkVo = adminService.noticeSelectAll();
		model.addAttribute("nlist",checkVo);
		return "no/admin/noticepage";
	}
	
	@RequestMapping("/qnaPage.do")
	public String qnaPage(Model model) {
		
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
	public String personalmemberall(Model model) {
		List<MemberVo> checkVo = adminService.memberSelectAll();
		model.addAttribute("mlist", checkVo);
		return "no/admin/personalmemberall";
	}
	
	@RequestMapping("companymemberall.do")
	public String companymemberall(Model model) {
		List<CompanyVo> checkVo = adminService.companySelectAll();
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
	
}
