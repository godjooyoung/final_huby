package co.huby.prj.board.service;

import java.util.List;

import co.huby.prj.common.VideoVo;

public interface BoardService {
	List<VideoVo> getMatchedListForCompany() throws Exception;
	//아래로 이런식으로 추가하면 됩니다. 이걸 나중에 컨트롤러에서 불러와서 씁니다.
}
