package co.huby.prj.memberVideo.web;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberVideoController {
	
	@RequestMapping("/memberVideoInsertForm.do")
	public String videoInsertForm() {
		return "person/member/memberVideoInsertForm";
	}

	@RequestMapping("/memberVideoInsert.do")
	public String fileUpload(@RequestPart MultipartFile files) throws IllegalStateException, IOException {
		String baseDir = "C:\\Users\\User\\Desktop\\upload";
		files.transferTo(new File(baseDir + "\\" + files.getOriginalFilename()));
		return "redirect:person/member/memverVideoInsertForm";
	}
}
