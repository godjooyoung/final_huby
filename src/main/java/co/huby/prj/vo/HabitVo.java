package co.huby.prj.vo;

import java.util.Date;

public class HabitVo {
	//habit
	private String habit_id;
	private String habit_name;
	private Date habit_start_date;
	private Date habit_log_date;
	private String member_id;
	private String cnt;
	private String checked;
	//getter setter
	
	
	
	public String getHabit_id() {
		return habit_id;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public void setHabit_id(String habit_id) {
		this.habit_id = habit_id;
	}
	public String getHabit_name() {
		return habit_name;
	}
	public void setHabit_name(String habit_name) {
		this.habit_name = habit_name;
	}
	public Date getHabit_start_date() {
		return habit_start_date;
	}
	public void setHabit_start_date(Date habit_start_date) {
		this.habit_start_date = habit_start_date;
	}
	public Date getHabit_log_date() {
		return habit_log_date;
	}
	public void setHabit_log_date(Date habit_log_date) {
		this.habit_log_date = habit_log_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
