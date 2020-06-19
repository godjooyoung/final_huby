package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.ResumeVo;

public interface EmploymentService {
	List<Map> getMatchedEmploymentList(ResumeVo vo) throws Exception;
	Map SelectMatchedEmploymentList(Map vo) throws Exception;
	List<Map> resumeAll(Map vo) throws Exception;
	List<Map> videoAll(Map vo) throws Exception;
	List<Map> skillsAll(Map vo) throws Exception;
	List<Map> careerAll(Map vo) throws Exception;
}
