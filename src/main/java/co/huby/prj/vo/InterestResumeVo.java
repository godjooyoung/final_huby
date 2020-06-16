package co.huby.prj.vo;

import java.util.Date;

public class InterestResumeVo {
	//interest_resume
	private String interest_resume_id;
	private Date interest_date;
	private String pubric_or_not;
	private String resume_id;
	private String employment_id;
	//getter setter
	public String getInterest_resume_id() {
		return interest_resume_id;
	}
	public void setInterest_resume_id(String interest_resume_id) {
		this.interest_resume_id = interest_resume_id;
	}
	public Date getInterest_date() {
		return interest_date;
	}
	public void setInterest_date(Date interest_date) {
		this.interest_date = interest_date;
	}
	public String getPubric_or_not() {
		return pubric_or_not;
	}
	public void setPubric_or_not(String pubric_or_not) {
		this.pubric_or_not = pubric_or_not;
	}
	public String getResume_id() {
		return resume_id;
	}
	public void setResume_id(String resume_id) {
		this.resume_id = resume_id;
	}
	public String getEmployment_id() {
		return employment_id;
	}
	public void setEmployment_id(String employment_id) {
		this.employment_id = employment_id;
	}
}
