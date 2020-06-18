package co.huby.prj.vo;

import java.util.Date;

public class ExperienceVo {
	private String experience_id; // 경험고유아이디 , 교육이수, 자기계발 포함
	private Date e_start_date;
	private Date e_end_date;
	private String experience_title; //경험제목
	private String experience_place_name; //공인처, 경험장소, 지역명, 단체명 등등
	private String experience_action; //활동내용
	private String member_id; //FX
	//getter setter
	public String getExperience_id() {
		return experience_id;
	}
	public void setExperience_id(String experience_id) {
		this.experience_id = experience_id;
	}
	public Date getE_start_date() {
		return e_start_date;
	}
	public void setE_start_date(Date e_start_date) {
		this.e_start_date = e_start_date;
	}
	public Date getE_end_date() {
		return e_end_date;
	}
	public void setE_end_date(Date e_end_date) {
		this.e_end_date = e_end_date;
	}
	public String getExperience_title() {
		return experience_title;
	}
	public void setExperience_title(String experience_title) {
		this.experience_title = experience_title;
	}
	public String getExperience_place_name() {
		return experience_place_name;
	}
	public void setExperience_place_name(String experience_place_name) {
		this.experience_place_name = experience_place_name;
	}
	public String getExperience_action() {
		return experience_action;
	}
	public void setExperience_action(String experience_action) {
		this.experience_action = experience_action;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
