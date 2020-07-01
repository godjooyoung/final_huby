package co.huby.prj.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CareerVo {
	//career
	//개인회원이 가지는 경력에 대한 상세 테이블입니다.
	private String career_id; //경력 고유 아이디
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date start_date;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date end_date;
	private String company_name; //주영주식회사
	private String career_content; // sns 서비스 개발 
	private String job;  //직무, it관련직
	private String job_position; //직급, 팀장
	private String member_id;
	private String job_name;
	//getter setter
	
	public String getCareer_id() {
		return career_id;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public void setCareer_id(String career_id) {
		this.career_id = career_id;
	}
	
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
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
