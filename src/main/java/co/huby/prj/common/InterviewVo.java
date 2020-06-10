package co.huby.prj.common;

import java.util.Date;

public class InterviewVo {
	//interview
	//interveiw_start는 면접 시작 시간입니다.
	private String interview_id;
	private String employment_option;
	private Date pass_date;
	private Date interview_date;
	private Date work_start;
	private Date interview_start;
	private String company_id;
	private String resume_id;
	private String member_id;
	//getter setter
	public String getInterview_id() {
		return interview_id;
	}
	public void setInterview_id(String interview_id) {
		this.interview_id = interview_id;
	}
	public String getEmployment_option() {
		return employment_option;
	}
	public void setEmployment_option(String employment_option) {
		this.employment_option = employment_option;
	}
	public Date getPass_date() {
		return pass_date;
	}
	public void setPass_date(Date pass_date) {
		this.pass_date = pass_date;
	}
	public Date getInterview_date() {
		return interview_date;
	}
	public void setInterview_date(Date interview_date) {
		this.interview_date = interview_date;
	}
	public Date getWork_start() {
		return work_start;
	}
	public void setWork_start(Date work_start) {
		this.work_start = work_start;
	}
	public Date getInterview_start() {
		return interview_start;
	}
	public void setInterview_start(Date interview_start) {
		this.interview_start = interview_start;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public String getResume_id() {
		return resume_id;
	}
	public void setResume_id(String resume_id) {
		this.resume_id = resume_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
