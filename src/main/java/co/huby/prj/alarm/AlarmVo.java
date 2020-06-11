package co.huby.prj.alarm;

import java.util.Date;

public class AlarmVo {
	//alarm
	//alarm_current 알람수신여부입니다.
	private String alarm_id;
	private String alarm_current;
	private String member_id;
	private String company_id; 
	private String alarm_message;
	private Date alarm_time;
	
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
	public Date getAlarm_time() {
		return alarm_time;
	}
	public void setAlarm_time(Date alarm_time) {
		this.alarm_time = alarm_time;
	}
	}
