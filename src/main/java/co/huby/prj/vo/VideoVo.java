package co.huby.prj.vo;

public class VideoVo {
	//video
	private String video_id;
	private String video_contents;
	private String video_img;
	private String hashtag;
	private String company_id;
	private String member_id;
	//g s
	public String getVideo_id() {
		return video_id;
	}
	public void setVideo_id(String video_id) {
		this.video_id = video_id;
	}
	public String getVideo_contents() {
		return video_contents;
	}
	public void setVideo_contents(String video_contents) {
		this.video_contents = video_contents;
	}
	public String getVideo_img() {
		return video_img;
	}
	public void setVideo_img(String video_img) {
		this.video_img = video_img;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
