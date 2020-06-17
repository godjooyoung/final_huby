package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import co.huby.prj.vo.EmploymentsVo;
import co.huby.prj.vo.ResumeVo;

public interface EmploymentService {
	List<Map> getMatchedEmploymentList(ResumeVo vo) throws Exception;

}
