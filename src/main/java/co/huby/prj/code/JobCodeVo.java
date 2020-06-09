package co.huby.prj.code;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
@Data
public class JobCodeVo {

	String svcType;
	String svcCode;
	String contentType;
	String gubun;
	String category;
	public String getSvcType() {
		return svcType;
	}
	public void setSvcType(String svcType) {
		this.svcType = svcType;
	}
	public String getSvcCode() {
		return svcCode;
	}
	public void setSvcCode(String svcCode) {
		this.svcCode = svcCode;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	
	
}
