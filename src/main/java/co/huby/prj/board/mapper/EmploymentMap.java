package co.huby.prj.board.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.vo.EmploymentsVo;

@MapperScan
public interface EmploymentMap {
	List<Map> getMatchedEmploymentList(EmploymentsVo vo);
	/*
	 * void videoLikeInsertFromCompany(LikeVideoVo vo) ; List<Map>
	 * getCompany_Employments(String com_id); List<Map>
	 * getCompany_ApplyList(@Param("companyid") String
	 * companyid, @Param("listviewid")String listviewid);
	 */
}
