package co.huby.prj.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.board.mapper.EmploymentMap;
import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.vo.ResumeVo;

@Service("employmentService")
public class EmploymentServiceImpl implements EmploymentService {

	@Autowired
	private EmploymentMap map;

	@Override
	public List<Map> getMatchedEmploymentList(ResumeVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.getMatchedEmploymentList(vo);
	}

	@Override
	public Map SelectMatchedEmploymentList(Map vo) throws Exception {
		// TODO Auto-generated method stub
		return map.SelectMatchedEmploymentList(vo);
	}

}
