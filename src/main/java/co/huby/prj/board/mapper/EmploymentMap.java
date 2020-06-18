package co.huby.prj.board.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.ResumeVo;

@MapperScan
public interface EmploymentMap {
	List<Map> getMatchedEmploymentList(ResumeVo vo);
	Map SelectMatchedEmploymentList(Map vo) throws Exception;
	List<Map> ApplyUserInfoAll(Map vo) throws Exception;
	/*
	 * void videoLikeInsertFromCompany(LikeVideoVo vo) ; List<Map>
	 * getCompany_Employments(String com_id); List<Map>
	 * getCompany_ApplyList(@Param("companyid") String
	 * companyid, @Param("listviewid")String listviewid);
	 */
}
