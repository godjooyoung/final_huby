package co.huby.prj.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CompanyVo {
	//company
	//기업회원
	private String company_id;
	private String regist_number;
	private String company_name;
	private String company_pw;
	private String company_tel;
	private String company_email;
	private String ceo_name;
	private String business_type;
	private String company_addr;
	private String business_category;
	private Date company_birth;
	private String company_sales;
	private String homepage;
	private Date company_date;
	private String job_name;
	private String company_pwcheck;
	private MultipartFile cuploadfile;
	private String company_photo;
	
	//getter setter
	
	
	
	public String getCompany_id() {
		return company_id;
	}
	public String getCompany_photo() {
		return company_photo;
	}
	public void setCompany_photo(String company_photo) {
		this.company_photo = company_photo;
	}
	public MultipartFile getCuploadfile() {
		return cuploadfile;
	}
	public void setCuploadfile(MultipartFile cuploadfile) {
		this.cuploadfile = cuploadfile;
	}
	public String getCompany_pwcheck() {
		return company_pwcheck;
	}
	public void setCompany_pwcheck(String company_pwcheck) {
		this.company_pwcheck = company_pwcheck;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
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
	public String getCompany_pw() {
		return company_pw;
	}
	public void setCompany_pw(String company_pw) {
		this.company_pw = company_pw;
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
	public String getCompany_addr() {
		return company_addr;
	}
	public void setCompany_addr(String company_addr) {
		this.company_addr = company_addr;
	}
	public String getBusiness_category() {
		return business_category;
	}
	public void setBusiness_category(String business_category) {
		this.business_category = business_category;
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
}
