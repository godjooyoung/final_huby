package co.huby.prj.member.service;

import java.util.List;

import co.huby.prj.vo.CareerVo;
import co.huby.prj.vo.ExperienceVo;
import co.huby.prj.vo.HabitVo;
import co.huby.prj.vo.ResumeVo;
import co.huby.prj.vo.SkillsVo;
import co.huby.prj.vo.VideoVo;

public interface MemberService {
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
	int selectSkillId() throws Exception;
	List<SkillsVo> skillAll(SkillsVo vo) throws Exception;
	List<ExperienceVo> Experience(MemberVo vo) throws Exception;
	int experienceInsert(ExperienceVo vo) throws Exception;
	int experienceUpdate(ExperienceVo vo) throws Exception;
	int experienceDelete(ExperienceVo vo) throws Exception;
	int resumeCnt(MemberVo vo) throws Exception;
	int videoCnt(MemberVo vo) throws Exception;
	ResumeVo selectResumeOne(String str) throws Exception;
	VideoVo selectVideoOne(String str) throws Exception; 
}
