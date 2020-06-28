package co.huby.prj;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.huby.prj.board.service.NoticeService;
import co.huby.prj.vo.NoticeVo;
import co.huby.prj.vo.Paging;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/noticeListCompany.do") // 기업회원 공지사항 리스트
	public String noticeListCompany(NoticeVo vo, Model model, HttpServletRequest request) throws Exception {
		Paging paging = new Paging();
		paging.setPageUnit(10);
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		List<Map> list = noticeService.noticeList(vo);
		int count = noticeService.countNotice(vo);
		paging.setTotalRecord(count);
		model.addAttribute("noticeList", list);
		model.addAttribute("page", paging);
		return "company/notice/noticeList";

	}

//	@RequestMapping(value = "/noticeListMember.do") // 개인회원 공지사항 리스트
//	public String noticeListMember(NoticeVo vo, Model model, HttpServletRequest request) throws Exception {
//		List<Map> list = noticeService.noticeList(vo);
//		model.addAttribute("noticeList", list);
//		return "person/notice/noticeList";
//	}

}
