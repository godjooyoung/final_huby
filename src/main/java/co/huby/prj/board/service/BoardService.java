package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.huby.prj.vo.ApplyVo;
import co.huby.prj.vo.LikeVideoVo;
import co.huby.prj.vo.VideoVo;

public interface BoardService {
	List<Map> getMatchedListForCompany(VideoVo vo) throws Exception;
	void videoLikeInsertFromCompany(LikeVideoVo vo) throws Exception;
	List<Map> getCompany_Employments(String com_id) throws Exception;
	List<Map> getCompany_ApplyList(@Param("companyid") String companyid, @Param("listviewid") String listviewid)
			throws Exception;
	Map get_apply_member_info(ApplyVo vo) throws Exception;
	List<Map> get_career (String memberid) throws Exception;
	List<Map> get_habit (String memberid) throws Exception;
	List<Map> get_skills (String memberid) throws Exception;
	List<Map> get_exp (String memberid) throws Exception;
	List<Map> get_video (String memberid) throws Exception;

}
