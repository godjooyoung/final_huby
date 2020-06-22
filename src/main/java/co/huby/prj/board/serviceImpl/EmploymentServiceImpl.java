package co.huby.prj.board.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.huby.prj.board.mapper.EmploymentMap;
import co.huby.prj.board.service.EmploymentService;
import co.huby.prj.member.service.MemberVo;

import co.huby.prj.vo.EmploymentsVo;
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

	@Override
	public List<Map> resumeAll(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.resumeAll(vo);
	}

	@Override
	public List<Map> videoAll(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.videoAll(vo);
	}

	@Override
	public List<Map> skillsAll(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.skillsAll(vo);
	}

	@Override
	public List<Map> careerAll(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.careerAll(vo);
	}

	@Override
	public List<Map> employmentList(EmploymentsVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.employmentList(vo);
	}

	@Override
	public List<Map> empDetailList(EmploymentsVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.empDetailList(vo);
	}

	@Override
	public List<Map> habitAll(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.habitAll(vo);
	}

	@Override
	public int applyInsert(Map vo) throws Exception {
		int n = map.applycheck(vo);
		if(n==0) {
			return map.applyInsert(vo);
		}else {
			return 0;
		}
	}

	@Override
	public int applycheck(Map vo) throws Exception {
		return map.applycheck(vo);
	}
}