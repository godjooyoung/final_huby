package co.huby.prj.vo;

public class LikeVideoVo {
	private String like_video_id;
	private String video_id;
	private String member_id;
	private String company_id;
	public String getLike_video_id() {
		return like_video_id;
	}
	public void setLike_video_id(String like_video_id) {
		this.like_video_id = like_video_id;
	}
	public String getVideo_id() {
		return video_id;
	}
	public void setVideo_id(String video_id) {
		this.video_id = video_id;
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
}
