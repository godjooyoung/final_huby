package co.huby.prj.common;

public class LikeCompanyVo {
	//like_company
	private String like_company_id;
	private String company_id;
	private String like_company_memo;
	private String member_id;
	//g s
	public String getLike_company_id() {
		return like_company_id;
	}
	public void setLike_company_id(String like_company_id) {
		this.like_company_id = like_company_id;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public String getLike_company_memo() {
		return like_company_memo;
	}
	public void setLike_company_memo(String like_company_memo) {
		this.like_company_memo = like_company_memo;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
