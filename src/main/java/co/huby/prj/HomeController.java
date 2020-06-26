package co.huby.prj;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import co.huby.prj.vo.InterviewVo;
import co.huby.prj.vo.LikeEmploymentVo;
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
	/*
	@RequestMapping(value = "/companyAfterLogin.do") // 매치된거 기업에게 추천
	public String home(Model model, HttpServletRequest request, VideoVo vo) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		vo.setCompany_id(companyid);
		List<Map> list = boardService.getMatchedListForCompany(vo);
		model.addAttribute("matched", list);
		return "company/company/companyStart";
	}*/
	
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

	@RequestMapping(value = "/companyEmploymentsApply.do") // 해당 공고에 지원한 사람의 상세내용
	public String companyApplyList(Model model, HttpServletRequest request, ApplyVo vo, EmploymentsVo vo2) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		String listviewid = request.getParameter("empIdinput");
		String emp_id = request.getParameter("empIdinput");
		System.out.println(emp_id);
		List<Map> list = boardService.getCompany_ApplyList(companyid, listviewid);
		vo2.setEmployment_id(emp_id);
		vo2 = boardService.get_one_employment_by_emp_id(vo2);
		model.addAttribute("applymenList", list);
		model.addAttribute("title", vo2);
		return "company/company/companyEmploymentApplymemList";
	}

	@RequestMapping(value = "/companyApplyMember.do") // 기업에 지원인 인간의 상세 정보
	public String applyMemInfoHome(Model model, HttpServletRequest request, ApplyVo vo) throws Exception {
		String apply_id = (String) request.getParameter("applyidInput");
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
		String companyid = (String) request.getSession().getAttribute("loginId");
		List<Map> list = boardService.get_video_list_more(companyid, count);
		model.addAttribute("firstList", list);
		return "company/company/comVideoAllView";
	}
	/*전체 비디오 보기 더보기~*/
	@ResponseBody
	@RequestMapping(value="get_video_list_more.do")
	public List<Map> video_list_more (Model model, HttpServletRequest request, VideoVo vo) throws Exception {
		int count = Integer.parseInt(request.getParameter("count"));
		String companyid = (String) request.getSession().getAttribute("loginId");
		List<Map> list = boardService.get_video_list_more(companyid, count);
		return list;
	}
	
	/*매치비디오 최신순 보기, 기업 로그인후 첫 화면*/
	@RequestMapping(value="get_matched_video_list_first.do")
	public String matched_video_list_first (Model model, HttpServletRequest request, VideoVo vo) throws Exception {
		int count = 0;
		String companyid = (String) request.getSession().getAttribute("loginId");
		List<Map> list = boardService.get_matched_video_List_more(companyid, count);
		model.addAttribute("matched", list);
		return "company/company/comVideoMatchedView";
	}
	
	/*매치 비디오 보기 더보기~*/
	@ResponseBody
	@RequestMapping(value="get_matched_video_list_more.do")
	public List<Map> matched_video_list_more (Model model, HttpServletRequest request, VideoVo vo) throws Exception {
		int count = Integer.parseInt(request.getParameter("count"));
		String companyid = (String) request.getSession().getAttribute("loginId");
		List<Map> list = boardService.get_matched_video_List_more(companyid, count);
		return list;
	}
	
	/**TEST*/
	@RequestMapping(value="go_habit_page.do")
	public String go_habit_page (Model model, HttpServletRequest request, VideoVo vo) throws Exception{ 
		
		return "person/member/habitPage";
	}
	
	// 공고에 스크랩하기 버튼 클릭할 경우 디비에 인설트된다.
	@ResponseBody
	@RequestMapping(value="insert_to_employment_like.do")
	public void insert_to_employment_like (Model model, HttpServletRequest request,LikeEmploymentVo vo) throws Exception{
		String memberid = (String) request.getSession().getAttribute("loginId");
		String eid = request.getParameter("employment_id");
		System.out.println("insert_to_employment_like를 실행합니다. 공고 아이디는?>>...." + eid);
		vo.setEmployment_id(eid);
		vo.setMember_id(memberid);
		boardService.insert_to_employment_like(vo);
	}
	
	//개인회원이 스크랩 페이지로 갈 경우 공고 스크랩 목록을 불러온다.
	@RequestMapping(value="load_employment_like_list.do")
	public String load_employment_like_list(Model model, HttpServletRequest request, LikeEmploymentVo vo) throws Exception {
		String memberid = (String) request.getSession().getAttribute("loginId");
		vo.setMember_id(memberid);
		List<Map> list = boardService.load_employment_like_list(vo);
		model.addAttribute("empLikeList", list);
		return "person/member/employmentScrapPage";
	}
	
	//개인회원 스크랩페이지에서 메모관리
	@RequestMapping(value="write_memo_for_Scrap.do")
	public String write_memo_for_Scrap(Model model, HttpServletRequest request, LikeEmploymentVo vo) throws Exception {
		String memberid = (String) request.getSession().getAttribute("loginId");
		String memo = request.getParameter("memotext");
		String sid= request.getParameter("likeid");
		vo.setEmployment_like_id(sid);
		vo.setEmployment_like_memo(memo);
		boardService.write_memo_for_Scrap(vo);
		return "redirect:load_employment_like_list.do";
	}
	
	//개인회원 스크랩창에서 스크랩 삭제
	@RequestMapping(value="delete_from_employment_like.do")
	public String delete_from_employment_like_list (Model model, HttpServletRequest request,LikeEmploymentVo vo) throws Exception{
		String sid= request.getParameter("sid");
		vo.setEmployment_like_id(sid);
		boardService.delete_from_employment_like_list(vo);
		return "redirect:load_employment_like_list.do";
	}
		
	//기업회원 공고갯수 뿌려주기
	//기업회원 지원자수 뿌려주기
	//기업회원이 현재 진행중인 인터뷰수 뿌려주기
	//기업회원이 개인회원을 채용처리
		
	@ResponseBody
	@RequestMapping(value = "/loadCompanyNow.do") // 기업의 현재 현황
	public Map loadCompanyNow(Model model, HttpServletRequest request) throws Exception {
		String companyid = (String) request.getSession().getAttribute("loginId");
		Map map3 =boardService.com_now_emp(companyid);
		Map map =boardService.com_now_apply(companyid);
		Map map2 =boardService.com_now_interview(companyid);
		
		Map nowMap = new HashMap<String, Object>();
		nowMap.put("now_e", map3);
		nowMap.put("now_a", map);
		nowMap.put("now_i", map2);
		return nowMap;
	}
	
	//개인회원 지원갯수뿌려주기
	//개인회원 진행면접갯수 뿌려주기
	//개인회원 지원제의 갯수 뿌려주기
	
	
	//뷰 정리(모바일뷰)
}