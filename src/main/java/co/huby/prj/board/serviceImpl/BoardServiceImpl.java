package co.huby.prj.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.board.mapper.BoardMap;
import co.huby.prj.board.service.BoardService;
import co.huby.prj.vo.ApplyVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.LikeEmploymentVo;
import co.huby.prj.vo.LikeVideoVo;
import co.huby.prj.vo.ResumeVo;
import co.huby.prj.vo.VideoVo;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMap map;

	@Override
	public List<Map> getMatchedListForCompany(VideoVo vo) throws Exception {
		return map.getMatchedListForCompany(vo);
	}
	// 아래로 추가되면 된다.

	@Override
	public void videoLikeInsertFromCompany(LikeVideoVo vo) throws Exception {
		map.videoLikeInsertFromCompany(vo);
	}

	@Override
	public List<Map> getCompany_Employments(String com_id) throws Exception {
		return map.getCompany_Employments(com_id);
	}

	@Override
	public List<Map> getCompany_ApplyList(@Param("companyid") String companyid, @Param("listviewid") String listviewid)
			throws Exception {

		return map.getCompany_ApplyList(companyid, listviewid);

	}

	@Override
	public Map get_apply_member_info(ApplyVo vo) throws Exception {
		return map.get_apply_member_info(vo);
	}

	@Override
	public List<Map> get_career(String memberid) throws Exception {
		// 지원자정보에서 커리어 가져오기
		return map.get_career(memberid);
	}

	@Override
	public List<Map> get_habit(String memberid) throws Exception {
		// 지원자정보에서 습관 가져오기
		return map.get_habit(memberid);
	}

	@Override
	public List<Map> get_skills(String memberid) throws Exception {
		// 지원자정보에서 기술 가져오기
		return map.get_skills(memberid);
	}

	@Override
	public List<Map> get_exp(String memberid) throws Exception {
		// 지원자정보에서 경험 가져오기
		return map.get_exp(memberid);
	}

	@Override
	public VideoVo get_video(String memberid) throws Exception {
		// TODO Auto-generated method stub
		return map.get_video(memberid);
	}

	@Override
	public ResumeVo get_resume(ResumeVo resume) throws Exception {
		// TODO Auto-generated method stub
		return map.get_resume(resume);
	}

	@Override
	public void videoLikeDeleteFromCompany(LikeVideoVo vo) throws Exception {
		map.videoLikeDeleteFromCompany(vo);
		
	}
	@Override
	public List<Map> comlikevideo(LikeVideoVo vo) throws Exception {
		// 기업이 좋아한 영상 목록
		return map.comlikevideo(vo);
	}

	@Override
	public void comWriteEmploy(EmploymentsVo vo) throws Exception {
		// TODO Auto-generated method stub
		map.comWriteEmploy(vo);
		
	}

	@Override
	public List<Map> empListForCom(EmploymentsVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.empListForCom(vo);
	}

	@Override
	public EmploymentsVo get_empDetailsForCom(EmploymentsVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.get_empDetailsForCom(vo);
	}
	@Override
	public void modify_employment(EmploymentsVo vo) throws Exception {
		map.modify_employment(vo);
		
	}

	@Override
	public void delete_employment(EmploymentsVo vo) throws Exception {
		map.delete_employment(vo);
		
	}

	@Override
	public void delete_like_video(LikeVideoVo vo) throws Exception {
		map.delete_like_video(vo);
		
	}
	@Override
	public List<Map> get_list_video_all(VideoVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.get_list_video_all(vo);
	}

	

	@Override
	public List<Map> get_matched_video_List_more(String companyid, int count) {
		// TODO Auto-generated method stub
		return map.get_matched_video_List_more(companyid, count);
	}

	@Override
	public void insert_to_employment_like(LikeEmploymentVo vo) throws Exception {
		// 공고에 스크랩하기 버튼 클릭할 경우 디비에 인설트된다.
		map.insert_to_employment_like(vo);
	}

	@Override
	public List<Map> load_employment_like_list(LikeEmploymentVo vo) throws Exception {
		//개인회원이 스크랩 관리 페이지로 가면 내가 스크랩한 공고 목록이 나타난다.
		return map.load_employment_like_list(vo);
	}

	@Override
	public void write_memo_for_Scrap(LikeEmploymentVo vo) throws Exception {
		map.write_memo_for_Scrap(vo);
		
	}

	@Override
	public void delete_from_employment_like_list(LikeEmploymentVo vo) throws Exception {
		map.delete_from_employment_like_list(vo);
		
	}

	@Override
	public EmploymentsVo get_one_employment_by_emp_id(EmploymentsVo vo2) {
		// TODO Auto-generated method stub
		return map.get_one_employment_by_emp_id(vo2);
	}
	@Override
	public List<Map> get_video_list_more(String companyid, int count) {
		// TODO Auto-generated method stub
		return map.get_video_list_more(companyid, count);
	}

	@Override
	public Map com_now_emp(String companyid) throws Exception {
		// TODO Auto-generated method stub
		return map.com_now_emp(companyid);
	}

	@Override
	public Map com_now_apply(String companyid) throws Exception {
		// TODO Auto-generated method stub
		return map.com_now_apply(companyid);
	}

	@Override
	public Map com_now_interview(String companyid) throws Exception {
		// TODO Auto-generated method stub
		return map.com_now_interview(companyid);
	}

	




}
