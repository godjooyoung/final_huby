package co.huby.prj.member.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.CareerVo;
import co.huby.prj.vo.HabitVo;
import co.huby.prj.vo.SkillsVo;

@MapperScan
public interface MemberMap{
	List<MemberVo> SelectAll() throws Exception;
	MemberVo selectone(MemberVo vo) throws Exception;
	int memberInsert(MemberVo vo) throws Exception;
	int memberUpdate(MemberVo vo) throws Exception;
	int memberDelete(MemberVo vo) throws Exception;
	MemberVo memberIdCheck(MemberVo vo) throws Exception;
	String selectpw(MemberVo vo) throws Exception;
	List<SkillsVo> skillsAll(MemberVo vo) throws Exception;
	int skillInsert(SkillsVo vo) throws Exception;
	int skillDelete(SkillsVo vo) throws Exception;
	int skillUpdate(SkillsVo vo) throws Exception;
	SkillsVo skillSelect(SkillsVo vo) throws Exception;
	List<CareerVo> careerAll(MemberVo vo) throws Exception;
	int careerinsert(CareerVo vo) throws Exception;
	int careerDelete(CareerVo vo) throws Exception;
	CareerVo careerSelect(CareerVo vo) throws Exception;
	int careerUpdate(CareerVo vo) throws Exception;
	List<HabitVo> habitSelectAll(MemberVo vo) throws Exception;
	int habitUpdate(HabitVo vo) throws Exception;
	int habitInsert(HabitVo vo) throws Exception;
	int habitDelete(HabitVo vo) throws Exception;
	int pwUpdate(MemberVo vo) throws Exception;
}
