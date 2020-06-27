package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.ResumeVo;

public interface EmploymentService {
	List<Map> getMatchedEmploymentList(ResumeVo vo) throws Exception;

	Map SelectMatchedEmploymentList(Map vo) throws Exception;

	List<Map> resumeAll(MemberVo vo) throws Exception;

	List<Map> videoAll(MemberVo vo) throws Exception;

	List<Map> skillsAll(MemberVo vo) throws Exception;

	List<Map> careerAll(MemberVo vo) throws Exception;
	
	List<Map> habitAll(MemberVo vo) throws Exception;

	List<Map> employmentList(EmploymentsVo vo) throws Exception;

	List<Map> empDetailList(EmploymentsVo vo) throws Exception;
	
	int applyInsert(Map vo) throws Exception;
	
	int applycheck(Map vo) throws Exception;
	
	List<Map> applyList(MemberVo vo) throws Exception;
	
	EmploymentsVo selectApplyList(EmploymentsVo vo) throws Exception;
	
	EmploymentsVo areaEmploymentList(EmploymentsVo vo) throws Exception;
}
