package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.ResumeVo;

public interface EmploymentService {
	List<Map> getMatchedEmploymentList(ResumeVo vo) throws Exception;
	Map SelectMatchedEmploymentList(Map vo) throws Exception;
	List<Map> ApplyUserInfoAll(Map vo) throws Exception;
}
