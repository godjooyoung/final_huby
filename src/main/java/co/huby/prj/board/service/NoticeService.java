package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import co.huby.prj.vo.NoticeVo;

public interface NoticeService {

	List<Map> noticeList(NoticeVo vo) throws Exception;
}
