package co.huby.prj.vo;

import java.util.Date;

public class SkillsVo {
	//skills
	private String skill_id; //스킬의 고유 아이디
	private String skill_name; //스킬명
	private int skill_level; //스킬레벨  0~100까지 사용자가 지정
	private String member_id; //개인회원아이디
	//getter setter
	public String getSkill_id() {
		return skill_id;
	}
	public void setSkill_id(String skill_id) {
		this.skill_id = skill_id;
	}
	public String getSkill_name() {
		return skill_name;
	}
	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}
	public int getSkill_level() {
		return skill_level;
	}
	public void setSkill_level(int skill_level) {
		this.skill_level = skill_level;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
