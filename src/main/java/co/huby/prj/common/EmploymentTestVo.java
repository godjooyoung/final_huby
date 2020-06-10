package co.huby.prj.common;

import java.util.Date;

public class EmploymentTestVo {
	//employment_test
	private String test_id;
	private String test_title;
	private Date test_start;
	private Date test_end;
	private int test_count;
	private int pass_grade;
	private String employment_id;
	//getter setter
	public String getTest_id() {
		return test_id;
	}
	public void setTest_id(String test_id) {
		this.test_id = test_id;
	}
	public String getTest_title() {
		return test_title;
	}
	public void setTest_title(String test_title) {
		this.test_title = test_title;
	}
	public Date getTest_start() {
		return test_start;
	}
	public void setTest_start(Date test_start) {
		this.test_start = test_start;
	}
	public Date getTest_end() {
		return test_end;
	}
	public void setTest_end(Date test_end) {
		this.test_end = test_end;
	}
	public int getTest_count() {
		return test_count;
	}
	public void setTest_count(int test_count) {
		this.test_count = test_count;
	}
	public int getPass_grade() {
		return pass_grade;
	}
	public void setPass_grade(int pass_grade) {
		this.pass_grade = pass_grade;
	}
	public String getEmployment_id() {
		return employment_id;
	}
	public void setEmployment_id(String employment_id) {
		this.employment_id = employment_id;
	}
}
