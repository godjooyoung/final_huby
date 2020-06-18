package co.huby.prj.vo;

import java.util.Date;

public class CareerVo {
	//career
	//개인회원이 가지는 경력에 대한 상세 테이블입니다.
	private String career_id; //경력 고유 아이디
	private Date c_start_date;
	private Date c_end_date;
	private String company_name; //주영주식회사
	private String career_content; // sns 서비스 개발 
	private String job;  //직무, it관련직
	private String job_position; //직급, 팀장
	private String member_id;
	//getter setter
	public String getCareer_id() {
		return career_id;
	}
	public void setCareer_id(String career_id) {
		this.career_id = career_id;
	}
	public Date getC_start_date() {
		return c_start_date;
	}
	public void setC_start_date(Date c_start_date) {
		this.c_start_date = c_start_date;
	}
	public Date getC_end_date() {
		return c_end_date;
	}
	public void setC_end_date(Date c_end_date) {
		this.c_end_date = c_end_date;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCareer_content() {
		return career_content;
	}
	public void setCareer_content(String career_content) {
		this.career_content = career_content;
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}	
}
