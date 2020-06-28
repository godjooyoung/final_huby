package co.huby.prj.vo;

import java.util.Date;

public class NoticeVo {
	// notice 영자가 띄우는 공지사항 입니다.
	private String notice_id;
	private String notice_title;
	private Date notice_date;
	private String notice_contents;
	private String admin_id;
	private int first;
	private int last;

	// g s
	public String getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_contents() {
		return notice_contents;
	}

	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	@Override
	public String toString() {
		return "NoticeVo [notice_id=" + notice_id + ", notice_title=" + notice_title + ", notice_date=" + notice_date
				+ ", notice_contents=" + notice_contents + ", admin_id=" + admin_id + ", first=" + first + ", last="
				+ last + ", getNotice_id()=" + getNotice_id() + ", getNotice_title()=" + getNotice_title()
				+ ", getNotice_date()=" + getNotice_date() + ", getNotice_contents()=" + getNotice_contents()
				+ ", getAdmin_id()=" + getAdmin_id() + ", getFirst()=" + getFirst() + ", getLast()=" + getLast()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

}
