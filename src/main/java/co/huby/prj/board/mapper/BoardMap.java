package co.huby.prj.board.mapper;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.common.LikeVideoVo;
import co.huby.prj.common.VideoVo;

@MapperScan
public interface BoardMap  {
	List<Map> getMatchedListForCompany(VideoVo vo) ;
	void videoLikeInsertFromCompany(LikeVideoVo vo) ;
}
