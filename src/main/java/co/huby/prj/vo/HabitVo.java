package co.huby.prj.vo;

import java.util.Date;

public class HabitVo {
	//habit
	private String habit_id;
	private String habit_name;
	private Date habit_start_date;
	private int habit_count;
	private String member_id;
	//getter setter
	public String getHabit_id() {
		return habit_id;
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
	public int getHabit_count() {
		return habit_count;
	}
	public void setHabit_count(int habit_count) {
		this.habit_count = habit_count;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
