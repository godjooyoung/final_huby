package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import co.huby.prj.common.VideoVo;

public interface BoardService {
	List<Map> getMatchedListForCompany() throws Exception;
	void videoLikeInsertFromCompany(VideoVo vo) throws Exception;
	//아래로 이런식으로 추가하면 됩니다. 이걸 나중에 컨트롤러에서 불러와서 씁니다.
}
