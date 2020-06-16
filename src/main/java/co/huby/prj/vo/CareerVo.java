package co.huby.prj.vo;

import java.util.Date;

public class CareerVo {
	//career
	//개인회원이 가지는 경력에 대한 상세 테이블입니다.
	//prject_duration 은 프로젝트 기간입니다.
	private String career_id;
	private String project_name;
	private String company_name;
	private Date project_duration;
	private String project_contents;
	private Date hire_date;
	private Date project_date;
	private String job;
	private String job_position;
	private String experience;
	private String career_contents;
	private String member_id;
	
	public String getCareer_id() {
		return career_id;
	}
	public void setCareer_id(String career_id) {
		this.career_id = career_id;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public Date getProject_duration() {
		return project_duration;
	}
	public void setProject_duration(Date project_duration) {
		this.project_duration = project_duration;
	}
	public String getProject_contents() {
		return project_contents;
	}
	public void setProject_contents(String project_contents) {
		this.project_contents = project_contents;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	public Date getProject_date() {
		return project_date;
	}
	public void setProject_date(Date project_date) {
		this.project_date = project_date;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getJob_position() {
		return job_position;
	}
	public void setJob_position(String job_position) {
		this.job_position = job_position;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getCareer_contents() {
		return career_contents;
	}
	public void setCareer_contents(String career_contents) {
		this.career_contents = career_contents;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
