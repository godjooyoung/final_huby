package co.huby.prj.member.service;

import java.util.Date;

public class CompanyMemberVo {
	private String company_id;
	private String company_pw;
	private String regist_number;
	private String company_name;
	private String company_tel;
	private String company_email;
	private String ceo_name;
	private String business_type;
	private String business_category;
	private String company_addr;
	private Date company_birth;
	private String company_sales;
	private String homepage;
	private Date company_date;
	
	public CompanyMemberVo() {
		// TODO Auto-generated constructor stub
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getCompany_pw() {
		return company_pw;
	}

	public void setCompany_pw(String company_pw) {
		this.company_pw = company_pw;
	}

	public String getRegist_number() {
		return regist_number;
	}

	public void setRegist_number(String regist_number) {
		this.regist_number = regist_number;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_tel() {
		return company_tel;
	}

	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}

	public String getCompany_email() {
		return company_email;
	}

	public void setCompany_email(String company_email) {
		this.company_email = company_email;
	}

	public String getCeo_name() {
		return ceo_name;
	}

	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}

	public String getBusiness_type() {
		return business_type;
	}

	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}

	public String getBusiness_category() {
		return business_category;
	}

	public void setBusiness_category(String business_category) {
		this.business_category = business_category;
	}

	public String getCompany_addr() {
		return company_addr;
	}

	public void setCompany_addr(String company_addr) {
		this.company_addr = company_addr;
	}

	public Date getCompany_birth() {
		return company_birth;
	}

	public void setCompany_birth(Date company_birth) {
		this.company_birth = company_birth;
	}

	public String getCompany_sales() {
		return company_sales;
	}

	public void setCompany_sales(String company_sales) {
		this.company_sales = company_sales;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public Date getCompany_date() {
		return company_date;
	}

	public void setCompany_date(Date company_date) {
		this.company_date = company_date;
	}

	@Override
	public String toString() {
		return "CompanyMemberVo [company_id=" + company_id + ", company_pw=" + company_pw + ", regist_number="
				+ regist_number + ", company_name=" + company_name + ", company_tel=" + company_tel + ", company_email="
				+ company_email + ", ceo_name=" + ceo_name + ", business_type=" + business_type + ", business_category="
				+ business_category + ", company_addr=" + company_addr + ", company_birth=" + company_birth
				+ ", company_sales=" + company_sales + ", homepage=" + homepage + ", company_date=" + company_date
				+ "]";
	}
	
	
}
