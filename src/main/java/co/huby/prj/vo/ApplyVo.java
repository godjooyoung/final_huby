package co.huby.prj.vo;

import java.util.Date;

public class ApplyVo {
	//apply
	//개인이 기업에 지원하는 지원이력입니다.
	private String apply_id;
	private Date apply_date;
	private String resume_id;
	private String employment_id;
	private String member_id;
	private String video_id;
	
	public String getVideo_id() {
		return video_id;
	}
	public void setVideo_id(String video_id) {
		this.video_id = video_id;
	}
	public String getApply_id() {
		return apply_id;
	}
	public void setApply_id(String apply_id) {
		this.apply_id = apply_id;
	}
	public Date getApply_date() {
		return apply_date;
	}
	public void setApply_date(Date apply_date) {
		this.apply_date = apply_date;
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
