package co.huby.prj.member.service;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberVo {
	private String member_id;
	private String member_pw;
	private String member_name;
	private Date member_birth;
	private String member_addr;
	private String member_tel;
	private String member_email;
	private String member_gender;
	private Date member_date;
	private String member_photo;
	private MultipartFile uploadFile;
	private String member_pwcheck;
	private int first;
	private int last;
	
	
	
	public MemberVo() {
		// TODO Auto-generated constructor stub
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



	public String getMember_pwcheck() {
		return member_pwcheck;
	}
	public void setMember_pwcheck(String member_pwcheck) {
		this.member_pwcheck = member_pwcheck;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public Date getMember_date() {
		return member_date;
	}
	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}

	@Override
	public String toString() {
		return "MemberVo [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", member_birth=" + member_birth + ", member_addr=" + member_addr + ", member_tel=" + member_tel
				+ ", member_email=" + member_email + ", member_gender=" + member_gender + ", member_date=" + member_date
				+ ", member_photo=" + member_photo + "]";
	}
	
	
}
