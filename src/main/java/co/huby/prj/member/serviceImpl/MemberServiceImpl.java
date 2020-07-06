package co.huby.prj.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import co.huby.prj.member.mapper.MemberMap;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.CareerVo;
import co.huby.prj.vo.ExperienceVo;
import co.huby.prj.vo.HabitVo;
import co.huby.prj.vo.SkillsVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMap map;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	
	@Override
	public List<MemberVo> SelectAll() throws Exception {
		// TODO Auto-generated method stub
		return map.SelectAll();
	}

	@Override
	public MemberVo selectone(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.selectone(vo);
	}

	@Override
	public int memberInsert(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		vo.setMember_pw(pwdEncoder.encode(vo.getMember_pw()));
		
		return map.memberInsert(vo);
	}

	@Override
	public int memberUpdate(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		
		return map.memberUpdate(vo);
	}

	@Override
	public int memberDelete(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public MemberVo memberIdCheck(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.memberIdCheck(vo);
	}

	@Override
	public String selectpw(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.selectpw(vo);
	}

	@Override
	public List<SkillsVo> skillsAll(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.skillsAll(vo);
	}

	@Override
	public int skillInsert(SkillsVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.skillInsert(vo);
	}

	@Override
	public int skillDelete(SkillsVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.skillDelete(vo);
	}

	@Override
	public int skillUpdate(SkillsVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.skillUpdate(vo);
	}

	@Override
	public SkillsVo skillSelect(SkillsVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.skillSelect(vo);
	}

	@Override
	public List<CareerVo> careerAll(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.careerAll(vo);
	}

	@Override
	public int careerinsert(CareerVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.careerinsert(vo);
	}

	@Override
	public int careerDelete(CareerVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.careerDelete(vo);
	}

	@Override
	public CareerVo careerSelect(CareerVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.careerSelect(vo);
	}

	@Override
	public int careerUpdate(CareerVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.careerUpdate(vo);
	}

	@Override
	public List<HabitVo> habitSelectAll(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.habitSelectAll(vo);
	}

	@Override
	public int habitUpdate(HabitVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.habitUpdate(vo);
	}

	@Override
	public int habitInsert(HabitVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.habitInsert(vo);
	}

	@Override
	public int habitDelete(HabitVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.habitDelete(vo);
	}

	@Override
	public int pwUpdate(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		vo.setMember_pwcheck(pwdEncoder.encode(vo.getMember_pwcheck()));
		
		return map.pwUpdate(vo);
	}

	@Override
	public int selectSkillId() throws Exception {
		// TODO Auto-generated method stub
		return map.selectSkillId();
	}

	@Override
	public List<SkillsVo> skillAll(SkillsVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.skillAll(vo);
	}

	@Override
	public List<ExperienceVo> Experience(MemberVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.Experience(vo);
	}

	@Override
	public int experienceInsert(ExperienceVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.experienceInsert(vo);
	}

	@Override
	public int experienceUpdate(ExperienceVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.experienceUpdate(vo);
	}

	@Override
	public int experienceDelete(ExperienceVo vo) throws Exception {
		// TODO Auto-generated method stub
		return map.experienceDelete(vo);
	}
	
}
