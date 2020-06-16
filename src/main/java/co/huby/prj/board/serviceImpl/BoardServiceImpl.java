package co.huby.prj.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.board.mapper.BoardMap;
import co.huby.prj.board.service.BoardService;
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

}
