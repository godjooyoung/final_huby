package co.huby.prj.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.vo.ApplyVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.LikeEmploymentVo;
import co.huby.prj.vo.LikeVideoVo;
import co.huby.prj.vo.ResumeVo;
import co.huby.prj.vo.VideoVo;

@MapperScan
public interface BoardMap {
	List<Map> getMatchedListForCompany(VideoVo vo);

	void videoLikeInsertFromCompany(LikeVideoVo vo);

	List<Map> getCompany_Employments(String com_id);

	List<Map> getCompany_ApplyList(@Param("companyid") String companyid, @Param("listviewid") String listviewid);

	Map get_apply_member_info(ApplyVo vo);

	List<Map> get_career(String memberid) throws Exception;

	List<Map> get_habit(String memberid) throws Exception;

	List<Map> get_skills(String memberid) throws Exception;

	List<Map> get_exp(String memberid) throws Exception;

	VideoVo get_video(String memberid) throws Exception;

	ResumeVo get_resume(ResumeVo resume) throws Exception;
	
	void videoLikeDeleteFromCompany(LikeVideoVo vo) throws Exception;
	
	List<Map> comlikevideo(LikeVideoVo vo) throws Exception;
	
	void comWriteEmploy(EmploymentsVo vo) throws Exception;
	
	List<Map> empListForCom (EmploymentsVo vo) throws Exception;
	
	EmploymentsVo get_empDetailsForCom(EmploymentsVo vo) throws Exception;
	
	void modify_employment(EmploymentsVo vo) throws Exception;
	
	void delete_employment(EmploymentsVo vo) throws Exception; 
	
	void delete_like_video(LikeVideoVo vo) throws Exception;
	
	List<Map> get_list_video_all (VideoVo vo) throws Exception;
		
	List<Map> get_video_list_more (@Param("companyid") String companyid, @Param("count") int count);
	 
	List<Map> get_matched_video_List_more (@Param("companyid") String companyid, @Param("count") int count);
	
	void insert_to_employment_like(LikeEmploymentVo vo) throws Exception;
	
	List<Map> load_employment_like_list(LikeEmploymentVo vo) throws Exception;
	
	void write_memo_for_Scrap(LikeEmploymentVo vo) throws Exception;
	
	void delete_from_employment_like_list(LikeEmploymentVo vo) throws Exception;
	
	EmploymentsVo get_one_employment_by_emp_id(EmploymentsVo vo2);
	
	Map com_now_emp (String companyid) throws Exception;
	
	Map com_now_apply (String companyid) throws Exception;
	
	Map com_now_interview (String companyid) throws Exception;
	
	Map mem_now_resume (String memberid) throws Exception;
	
	Map mem_now_video  (String memberid) throws Exception;
	
	Map mem_now_apply  (String memberid) throws Exception;
	
	Map mem_now_interview  (String memberid) throws Exception;
	
	void click_complete (EmploymentsVo vo) throws Exception; 
}
