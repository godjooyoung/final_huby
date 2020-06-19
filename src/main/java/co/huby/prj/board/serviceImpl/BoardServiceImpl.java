package co.huby.prj.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.board.mapper.BoardMap;
import co.huby.prj.board.service.BoardService;
import co.huby.prj.vo.ApplyVo;
import co.huby.prj.vo.LikeVideoVo;
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
		// TODO Auto-generated method stub

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
	public List<Map> get_video(String memberid) throws Exception {
		// TODO Auto-generated method stub
		return map.get_video(memberid);
	}

}
