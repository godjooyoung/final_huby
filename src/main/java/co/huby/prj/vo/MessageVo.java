package co.huby.prj.vo;

import java.sql.Timestamp;

import com.google.gson.Gson;

public class MessageVo {

	private String message_id;
	private String message_sender;
	private String message_receiver;
	private Timestamp message_sandtime;
	private Timestamp message_readtime;
	private String company_id;
	private String member_id;
	private String interview_id;
	private String message_contents;
	private String message_type;

	public MessageVo() {
		// TODO Auto-generated constructor stub
	}

	public String getMessage_id() {
		return message_id;
	}

	public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}

	public String getMessage_sender() {
		return message_sender;
	}

	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}

	public String getMessage_receiver() {
		return message_receiver;
	}

	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}

	public Timestamp getMessage_sandtime() {
		return message_sandtime;
	}

	public void setMessage_sandtime(Timestamp message_sandtime) {
		this.message_sandtime = message_sandtime;
	}

	public Timestamp getMessage_readtime() {
		return message_readtime;
	}

	public void setMessage_readtime(Timestamp message_readtime) {
		this.message_readtime = message_readtime;
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

	public String getInterview_id() {
		return interview_id;
	}

	public void setInterview_id(String interview_id) {
		this.interview_id = interview_id;
	}

	public static MessageVo convertMessage(String source) {
		MessageVo message = new MessageVo();
		Gson gson = new Gson();
		message = gson.fromJson(source, MessageVo.class);
		return message;
	}

	@Override
	public String toString() {
		return "MessageVo [message_id=" + message_id + ", message_sender=" + message_sender + ", message_receiver="
				+ message_receiver + ", message_sandtime=" + message_sandtime + ", message_readtime=" + message_readtime
				+ ", company_id=" + company_id + ", member_id=" + member_id + ", interview_id=" + interview_id
				+ ", getMessage_id()=" + getMessage_id() + ", getMessage_sender()=" + getMessage_sender()
				+ ", getMessage_receiver()=" + getMessage_receiver() + ", getMessage_sandtime()="
				+ getMessage_sandtime() + ", getMessage_readtime()=" + getMessage_readtime() + ", getCompany_id()="
				+ getCompany_id() + ", getMember_id()=" + getMember_id() + ", getInterview_id()=" + getInterview_id()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

	public String getMessage_contents() {
		return message_contents;
	}

	public void setMessage_contents(String message_contents) {
		this.message_contents = message_contents;
	}

	public String getMessage_type() {
		return message_type;
	}

	public void setMessage_type(String message_type) {
		this.message_type = message_type;
	}

}
