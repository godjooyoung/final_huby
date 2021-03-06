package co.huby.prj.board.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.vo.NoticeVo;

@MapperScan
public interface NoticeMap {

	List<Map> noticeList(NoticeVo vo) throws Exception;
	NoticeVo noticeSelect(NoticeVo vo) throws Exception;
	int countNotice() throws Exception;
}
