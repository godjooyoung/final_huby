package co.huby.prj;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import co.huby.prj.board.service.BoardService;
import co.huby.prj.vo.ApplyVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.LikeVideoVo;
import co.huby.prj.vo.VideoVo;

@Controller
public class HomeController {
	// 변수선언
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
		return "person/common/memberHome";
	}

	@RequestMapping(value = "/companyAfterLogin.do") // 매치된거 기업에게 추천
	public String home(Model model, HttpServletRequest request, VideoVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		vo.setCompany_id(companyid);
		List<Map> list = boardService.getMatchedListForCompany(vo);
		System.out.println("---------");
		System.out.println(vo);
		System.out.println(companyid);
		System.out.println(list);
		model.addAttribute("matched", list);
		return "company/company/companyStart";
	}
	
	@ResponseBody
	@RequestMapping(value = "/companyLikeVideo.do") // 기업이 영상좋아요 버튼 누를경우 디비에 인설트
	public String likeVideo(Model model, HttpServletRequest request,LikeVideoVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		String vid = request.getParameter("video_id");
		System.out.println("비디오 아이디 넘어오나.." + vid);
		vo.setVideo_id(vid);
		vo.setCompany_id(companyid);
		boardService.videoLikeInsertFromCompany(vo);
		return "redirect:companyAfterLogin.do";
	}

	@RequestMapping(value = "/companyEmploymentsList.do") // 기업 자기자신의 공고보여주기.
	public String companyEmploymentsList(Model model, HttpServletRequest request, EmploymentsVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		List<Map> list = boardService.getCompany_Employments(companyid);
		model.addAttribute("employmentList", list);
		return "company/company/companyEmploymentsApplyList";
	}

	@ResponseBody
	@RequestMapping(value = "/companyEmploymentsApply.do") // 기업에 지원한 이력서와 이름 보여주기
	public List<Map> companyApplyList(Model model, HttpServletRequest request, ApplyVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		String listviewid = request.getParameter("listviewId");
		System.out.println("...................." + listviewid);
		List<Map> list = boardService.getCompany_ApplyList(companyid, listviewid);

		return list;
	}

	@RequestMapping(value = "/companyApplyMember.do") // 기업에 지원인 인간의 상세 정보
	public String applyMemInfoHome(Model model, HttpServletRequest request, ApplyVo vo) throws Exception {
		String apply_id = (String) request.getParameter("applyIdInput");
		vo.setApply_id(apply_id);
		Map map = boardService.get_apply_member_info(vo);
		model.addAttribute("applyman", map);
		return "company/company/applyMemberInfoView";

	}

	/** 아작스.... */
	@ResponseBody

	@RequestMapping(value = "/showCareer.do") //경력상세 보여주기
	public List<Map> showCareer (Model model, HttpServletRequest request, ApplyVo vo) throws Exception {
		String memberid = request.getParameter("memberid");
		List<Map> list = boardService.get_career(memberid);
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/showSkills.do") // 기술
	public List<Map> showExperience(Model model, HttpServletRequest request, ApplyVo vo) throws Exception {
		String memberid = request.getParameter("memberid");
		System.out.println("..." + memberid);
		List<Map> list = boardService.get_skills(memberid);
		System.out.println("여기!!!!!" + list);
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/showHabit.do") // 습관보여주기
	public List<Map> showHabit(Model model, HttpServletRequest request, ApplyVo vo) throws Exception {
		String memberid = request.getParameter("memberid");
		List<Map> list = boardService.get_habit(memberid);
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/showExp.do") //경험보여주기
	public List<Map> showExp (Model model, HttpServletRequest request, ApplyVo vo) throws Exception {
		String memberid = request.getParameter("memberid");
		List<Map> list = boardService.get_exp(memberid);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/likeVideoDelete.do") // 기업이 영상좋아요 버튼 다시누를경우 디비에서 삭제
	public String likeV_D(Model model, HttpServletRequest request,LikeVideoVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		String vid = request.getParameter("video_id");
		System.out.println("삭제를 위한 비디오 아이디" + vid);
		vo.setVideo_id(vid);
		vo.setCompany_id(companyid);
		boardService.videoLikeDeleteFromCompany(vo);
		return "redirect:companyAfterLogin.do";
	}
	/** 아작스.... */
	
	/*기업의 관심비디오 목록*/
	@RequestMapping(value = "/comLikeVideoList.do") 
	public String comLikeViedo(Model model, HttpServletRequest request, LikeVideoVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		vo.setCompany_id(companyid);
		List<Map> list = boardService.comlikevideo(vo);
		System.out.println("기업이 좋아한 영상 목록이 들어옵니다.");
		System.out.println(vo);
		System.out.println(list);
		model.addAttribute("comLike", list);
		return "company/company/companyScrapList";
	}
	
	/*기업의 공고 작성*/
	@RequestMapping(value = "/comEmpInsert.do") // 기업이 공고를 작성해서 인설트 한다이...
	public String comEmpInsert (Model model, HttpServletRequest request,EmploymentsVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		String title =request.getParameter("title");
		String career = request.getParameter("career");
		String prefer = request.getParameter("prefer");
		String position = request.getParameter("position");
		String graduate = request.getParameter("graduate");
		String job = request.getParameter("job");
		String worktype = request.getParameter("worktype");
		String contents = request.getParameter("contents");
		String salary = request.getParameter("salary");
		
		String time = request.getParameter("time");
		
		System.out.println("-----시간" + time);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		Date d = df.parse(time);
		
		String[] locations = request.getParameterValues("location"); 
		String location = "";
		String locas = "";
		
	
			for(int i=0; i<locations.length; i++){
			 location = (locations[i] + ".");
			 locas += location;
			}
		vo.setEmployment_title(title);
		vo.setCompany_id(companyid);
		vo.setEmployment_contents(contents);
		vo.setEmployment_prefer(prefer);
		vo.setEmployment_time(d);
		vo.setHope_career(career);
		vo.setHope_graduate(graduate);
		vo.setHope_job(job);
		vo.setHope_location(locas);
		vo.setHope_work_type(worktype);
		vo.setHope_job_position(position);
		vo.setHope_salary(salary);
		boardService.comWriteEmploy(vo);
		return "redirect:forcomemploymentsList.do";
	}
	
	/*기업의 공고 작서 페이지로 이동합니다.*/
	@RequestMapping(value = "/empInsertPageGo.do")
	public String empinserthome (Model model, HttpServletRequest request, VideoVo vo) throws Exception{ 
		
		return "company/company/employmentsInsert";
	}
	
	/*기업의 공고 목록으로 이동합니다.*/
	@RequestMapping(value = "/forcomemploymentsList.do")
	public String employlisthome (Model model, HttpServletRequest request, EmploymentsVo vo) throws Exception	{
		String companyid = (String) request.getSession().getAttribute("loginId");
		vo.setCompany_id(companyid);
		List<Map> list = boardService.empListForCom(vo);
		model.addAttribute("employments", list);
		return "company/company/companyEmploymentListView";
	}
	
	/*공고 목록에서 클릭하면 상세로 넘어갑니다.*/
	@RequestMapping(value = "/employmentsDetailsforCom.do")
	public String employmentDetails (Model model, HttpServletRequest request, EmploymentsVo vo) throws Exception	{
		String companyid = (String) request.getSession().getAttribute("loginId");
		String emplomentid= request.getParameter("employment_id");
		vo.setCompany_id(companyid);
		vo.setEmployment_id(emplomentid);
		vo = boardService.get_empDetailsForCom(vo);
		model.addAttribute("employmentsDetails", vo);
		System.out.println(vo);
		return "company/company/companyEmploymentDetailsView";
	}
	
	/*기업의 공고 수정 페이지로 이동합니다.*/
	@RequestMapping(value = "/empMpdifyPageGo.do")
	public String empmodify (Model model, HttpServletRequest request, EmploymentsVo vo) throws Exception{ 
		String companyid = (String) request.getSession().getAttribute("loginId");
		String emplomentid= request.getParameter("emp_id");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String prefer = request.getParameter("prefer");
		
		System.out.println("제목 : " + title);
		
		vo.setCompany_id(companyid);
		vo.setEmployment_id(emplomentid);
		vo.setEmployment_title(title);
		vo.setEmployment_contents(contents);
		vo.setEmployment_prefer(prefer);
		model.addAttribute("before", vo);
		return "company/company/employmentModify";
	}
	
	/*기업 공고 수정 처리.*/
	@RequestMapping(value = "/employupdate.do")
	public String employupdate (Model model, HttpServletRequest request, EmploymentsVo vo) throws Exception{ 
		String companyid = (String) request.getSession().getAttribute("loginId");
		String emp_id = request.getParameter("emp_id");
		String title =request.getParameter("title");
		String career = request.getParameter("career");
		String prefer = request.getParameter("prefer");
		String position = request.getParameter("position");
		String graduate = request.getParameter("graduate");
		String job = request.getParameter("job");
		String worktype = request.getParameter("worktype");
		String contents = request.getParameter("contents");
		String salary = request.getParameter("salary");
		String time = request.getParameter("time");
		System.out.println("-----시간" + time);
		//시간 변환
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		Date d = df.parse(time);
		//지역 다중선택시 배열에 담김
		String[] locations = request.getParameterValues("location"); 
		String location = "";
		String locas = "";
			for(int i=0; i<locations.length; i++){
			 location = (locations[i] + ".");
			 locas += location;
			}
		vo.setEmployment_id(emp_id);
		vo.setEmployment_title(title);
		vo.setCompany_id(companyid);
		vo.setEmployment_contents(contents);
		vo.setEmployment_prefer(prefer);
		vo.setEmployment_time(d);
		vo.setHope_career(career);
		vo.setHope_graduate(graduate);
		vo.setHope_job(job);
		vo.setHope_location(locas);
		vo.setHope_work_type(worktype);
		vo.setHope_job_position(position);
		vo.setHope_salary(salary);
		//vo에 담은 값으로 쿼리 진행
		boardService.modify_employment(vo);
		return "redirect:forcomemploymentsList.do";
	}
	
	
	/*기업 공고 삭제 처리.*/
	@RequestMapping(value = "/delete_employment.do")
	public String delete_employment (Model model, HttpServletRequest request, EmploymentsVo vo) throws Exception{
		String companyid = (String) request.getSession().getAttribute("loginId");
		String emp_id = request.getParameter("emp_id");
		vo.setEmployment_id(emp_id);
		vo.setCompany_id(companyid);
		boardService.delete_employment(vo);
		return "redirect:forcomemploymentsList.do"; 
	}
	
	/*기업 좋아한 비디오 관리탭에서 삭제 처리.*/
	@RequestMapping(value = "/delete_like_video.do")
	public String delete_like_video (Model model, HttpServletRequest request, LikeVideoVo vo)  throws Exception{
		String lvid=request.getParameter("delid");
		String companyid = (String) request.getSession().getAttribute("loginId");
		vo.setCompany_id(companyid);
		vo.setLike_video_id(lvid);
		boardService.delete_like_video(vo);
		return "redirect:comLikeVideoList.do";
		
	}
	
	/**기업 전체 비디오 목록 보여주기
	@RequestMapping(value = "/select_video_all.do")
	public String allVideoforCompany (Model model, HttpServletRequest request, VideoVo vo) throws Exception {
		List<Map> list = boardService.get_list_video_all(vo);
		model.addAttribute("allList", list);
		return "company/company/comVideoAllView";
	}*/
	
	/*전체 비디오 중에 최신순으로 정렬해서 1~6개까지 보여주기*/
	@RequestMapping(value="get_video_list_first.do")
	public String video_list_first (Model model, HttpServletRequest request, VideoVo vo) throws Exception {
		int count = 0;
		List<Map> list = boardService.get_video_list_more(count);
		model.addAttribute("firstList", list);
		return "company/company/comVideoAllView";
	}
	
	@ResponseBody
	@RequestMapping(value="get_video_list_more.do")
	public List<Map> video_list_more (Model model, HttpServletRequest request, VideoVo vo) throws Exception {
		int count = Integer.parseInt(request.getParameter("count"));
		List<Map> list = boardService.get_video_list_more(count);
		return list;
	}

}
