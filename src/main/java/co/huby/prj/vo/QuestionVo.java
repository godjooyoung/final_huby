package co.huby.prj.vo;

import java.util.Date;

public class QuestionVo {
	private String q_id;
	private String q_title;
	private String q_contents;
	private String member_id;
	private String company_id;
	private Date q_date;
	//g s
	public String getQ_id() {
		return q_id;
	}
	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_contents() {
		return q_contents;
	}
	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
}
