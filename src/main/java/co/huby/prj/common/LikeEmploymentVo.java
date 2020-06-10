package co.huby.prj.common;

import java.util.Date;

public class LikeEmploymentVo {
	//like_employment
	private String employment_like_id;
	private Date employment_date;
	private String employment_like_memo;
	private String member_id;
	private String employment_id;
	//g s
	public String getEmployment_like_id() {
		return employment_like_id;
	}
	public void setEmployment_like_id(String employment_like_id) {
		this.employment_like_id = employment_like_id;
	}
	public Date getEmployment_date() {
		return employment_date;
	}
	public void setEmployment_date(Date employment_date) {
		this.employment_date = employment_date;
	}
	public String getEmployment_like_memo() {
		return employment_like_memo;
	}
	public void setEmployment_like_memo(String employment_like_memo) {
		this.employment_like_memo = employment_like_memo;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getEmployment_id() {
		return employment_id;
	}
	public void setEmployment_id(String employment_id) {
		this.employment_id = employment_id;
	}
}
