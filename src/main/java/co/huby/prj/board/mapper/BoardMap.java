package co.huby.prj.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.vo.ApplyVo;
import co.huby.prj.vo.LikeVideoVo;
import co.huby.prj.vo.VideoVo;

@MapperScan
public interface BoardMap {
	List<Map> getMatchedListForCompany(VideoVo vo);
	void videoLikeInsertFromCompany(LikeVideoVo vo);
	List<Map> getCompany_Employments(String com_id);
	List<Map> getCompany_ApplyList(@Param("companyid") String companyid, @Param("listviewid") String listviewid);
	Map get_apply_member_info(ApplyVo vo);
}
