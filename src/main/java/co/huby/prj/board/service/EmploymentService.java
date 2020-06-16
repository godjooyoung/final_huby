package co.huby.prj.board.service;

import java.util.List;
import java.util.Map;

import co.huby.prj.vo.EmploymentsVo;

public interface EmploymentService {
	List<Map> getMatchedEmploymentList(EmploymentsVo vo) throws Exception;

}
