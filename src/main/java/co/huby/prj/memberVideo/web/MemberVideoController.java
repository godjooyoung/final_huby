package co.huby.prj.memberVideo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberVideoController {
	
	@RequestMapping("/memberVideoInsertForm.do")
	public String videoInsertForm() {
		return "person/member/memberVideoInsertForm";
	}

}
