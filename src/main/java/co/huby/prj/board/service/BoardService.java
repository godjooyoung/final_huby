package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.huby.prj.vo.ApplyVo;
import co.huby.prj.vo.LikeVideoVo;
import co.huby.prj.vo.VideoVo;

public interface BoardService {
	List<Map> getMatchedListForCompany(VideoVo vo) throws Exception;

	// 아래로 이런식으로 추가하면 됩니다. 이걸 나중에 컨트롤러에서 불러와서 씁니다.
	void videoLikeInsertFromCompany(LikeVideoVo vo) throws Exception;

	List<Map> getCompany_Employments(String com_id) throws Exception;

	List<Map> getCompany_ApplyList(@Param("companyid") String companyid, @Param("listviewid") String listviewid)
			throws Exception;
	Map get_apply_member_info(ApplyVo vo) throws Exception;

}
