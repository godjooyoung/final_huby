package co.huby.prj;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.board.service.BoardService;
import co.huby.prj.common.LikeVideoVo;
import co.huby.prj.common.VideoVo;


@Controller
public class HomeController {
	//변수선언
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BoardService boardService;

	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		return "person/common/home";
	}


	@RequestMapping(value = "/companyAfterLogin.do")//매치된거 기업에게 추천
	public String home(Model model, HttpServletRequest request, VideoVo vo) throws Exception {
		List<Map> list = boardService.getMatchedListForCompany(vo);
		model.addAttribute("matched", list);
		return "company/company/companyStart";   
	}
	
	@RequestMapping(value = "/companyLikeVideo.do")//기업이 영상좋아요 버튼 누를경우 디비에 인설트
	public String likeVideo(Model model, HttpServletRequest request, LikeVideoVo vo) throws Exception {
		String vid = request.getParameter("vid");
		vo.setVideo_id(vid);
		boardService.videoLikeInsertFromCompany(vo);
		return "redirect:companyAfterLogin.do";
	}
	
	

}
