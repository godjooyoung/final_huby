package co.huby.prj.alarm.service;

import java.sql.Timestamp;

public class AlarmVo {
	//alarm
	//alarm_current 알람수신여부입니다.
	private String alarm_id;
	private String alarm_current;
	private String member_id;
	private String company_id;
	private String alarm_message;
	private Timestamp alarm_time;
	private String company_name;
	private String member_name;
	private String employment_id;
	
	
	
	public String getEmployment_id() {
		return employment_id;
	}
	public void setEmployment_id(String employment_id) {
		this.employment_id = employment_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	//
	public String getAlarm_id() {
		return alarm_id;
	}
	public void setAlarm_id(String alarm_id) {
		this.alarm_id = alarm_id;
	}
	public String getAlarm_current() {
		return alarm_current;
	}
	public void setAlarm_current(String alarm_current) {
		this.alarm_current = alarm_current;
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
	public String getAlarm_message() {
		return alarm_message;
	}
	public void setAlarm_message(String alarm_message) {
		this.alarm_message = alarm_message;
	}
	public Timestamp getAlarm_time() {
		return alarm_time;
	}
	public void setAlarm_time(Timestamp alarm_time) {
		this.alarm_time = alarm_time;
	}
	}
