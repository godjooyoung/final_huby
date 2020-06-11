package co.huby.prj.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.board.mapper.BoardMap;
import co.huby.prj.board.service.BoardService;
import co.huby.prj.common.VideoVo;

@Service("boardService")
public abstract class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMap map; 
	
	@Override
	public List<Map> getMatchedListForCompany() throws Exception {
		return map.getMatchedListForCompany();
	}
	//아래로 추가되면 된다.

}
