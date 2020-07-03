package co.huby.prj.vo;

import java.util.Date;

public class EmploymentsVo {
	//employments 공고테이블입니다.
	private String employment_id;
	private String employment_title;
	private String employment_contents;
	private String hope_career;
	private String hope_graduate;
	private String hope_job_position;
	private String hope_job;
	private String hope_location;
	private String hope_work_type;
	private String employment_prefer;
	private Date employment_time;
	private String company_id;
	private String hope_salary;
	private String complete;
	private String job_name;
	
	
	
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public String getComplete() {
		return complete;
	}
	public void setComplete(String complete) {
		this.complete = complete;
	}
	//getter setter
	public String getEmployment_id() {
		return employment_id;
	}
	public String getHope_salary() {
		return hope_salary;
	}
	public void setHope_salary(String hope_salary) {
		this.hope_salary = hope_salary;
	}
	public void setEmployment_id(String employment_id) {
		this.employment_id = employment_id;
	}
	public String getEmployment_title() {
		return employment_title;
	}
	public void setEmployment_title(String employment_title) {
		this.employment_title = employment_title;
	}
	public String getEmployment_contents() {
		return employment_contents;
	}
	public void setEmployment_contents(String employment_contents) {
		this.employment_contents = employment_contents;
	}
	public String getHope_career() {
		return hope_career;
	}
	public void setHope_career(String hope_career) {
		this.hope_career = hope_career;
	}
	public String getHope_graduate() {
		return hope_graduate;
	}
	public void setHope_graduate(String hope_graduate) {
		this.hope_graduate = hope_graduate;
	}
	public String getHope_job_position() {
		return hope_job_position;
	}
	public void setHope_job_position(String hope_job_position) {
		this.hope_job_position = hope_job_position;
	}
	public String getHope_job() {
		return hope_job;
	}
	public void setHope_job(String hope_job) {
		this.hope_job = hope_job;
	}
	public String getHope_location() {
		return hope_location;
	}
	public void setHope_location(String hope_location) {
		this.hope_location = hope_location;
	}
	public String getHope_work_type() {
		return hope_work_type;
	}
	public void setHope_work_type(String hope_work_type) {
		this.hope_work_type = hope_work_type;
	}
	public String getEmployment_prefer() {
		return employment_prefer;
	}
	public void setEmployment_prefer(String employment_prefer) {
		this.employment_prefer = employment_prefer;
	}
	public Date getEmployment_time() {
		return employment_time;
	}
	public void setEmployment_time(Date employment_time) {
		this.employment_time = employment_time;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
}
