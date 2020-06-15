package co.huby.prj.board.mapper;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.common.ApplyVo;
import co.huby.prj.common.LikeVideoVo;
import co.huby.prj.common.VideoVo;

@MapperScan
public interface BoardMap  {
	List<Map> getMatchedListForCompany(VideoVo vo) ;
	void videoLikeInsertFromCompany(LikeVideoVo vo) ;
	List<Map> getCompany_Employments(String com_id);
	List<Map> getCompany_ApplyList(@Param("companyid") String companyid, @Param("listviewid")String listviewid);
}
