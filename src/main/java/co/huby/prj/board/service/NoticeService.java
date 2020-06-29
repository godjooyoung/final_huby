package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import co.huby.prj.vo.NoticeVo;
import co.huby.prj.vo.Paging;

public interface NoticeService {

	List<Map> noticeList(NoticeVo vo) throws Exception;
	int countNotice(NoticeVo vo) throws Exception;
	NoticeVo noticeSelect(NoticeVo vo) throws Exception;
}
