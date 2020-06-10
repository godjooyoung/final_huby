package co.huby.prj.common;

import java.util.Date;

public class SkillsVo {
	//skills
	private String skill_id;
	private String award_name;
	private String sicense_name;
	private String skill_name;
	private String award_agency;
	private String skill_level;
	private Date acquisition;
	private String award_contents;
	private Date award_date;
	private String member_id;
	//g s
	public String getSkill_id() {
		return skill_id;
	}
	public void setSkill_id(String skill_id) {
		this.skill_id = skill_id;
	}
	public String getAward_name() {
		return award_name;
	}
	public void setAward_name(String award_name) {
		this.award_name = award_name;
	}
	public String getSicense_name() {
		return sicense_name;
	}
	public void setSicense_name(String sicense_name) {
		this.sicense_name = sicense_name;
	}
	public String getSkill_name() {
		return skill_name;
	}
	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}
	public String getAward_agency() {
		return award_agency;
	}
	public void setAward_agency(String award_agency) {
		this.award_agency = award_agency;
	}
	public String getSkill_level() {
		return skill_level;
	}
	public void setSkill_level(String skill_level) {
		this.skill_level = skill_level;
	}
	public Date getAcquisition() {
		return acquisition;
	}
	public void setAcquisition(Date acquisition) {
		this.acquisition = acquisition;
	}
	public String getAward_contents() {
		return award_contents;
	}
	public void setAward_contents(String award_contents) {
		this.award_contents = award_contents;
	}
	public Date getAward_date() {
		return award_date;
	}
	public void setAward_date(Date award_date) {
		this.award_date = award_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
