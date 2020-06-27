package co.huby.prj.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.board.mapper.NoticeMap;
import co.huby.prj.board.service.NoticeService;
import co.huby.prj.vo.NoticeVo;

@Service("noticeService")
public class NoticeImpl implements NoticeService {

	@Autowired
	private NoticeMap map;
	
	@Override
	public List<Map> noticeList(NoticeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.noticeList(vo);
	}

}
