package co.huby.prj.memberVideo.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;

@Controller
public class MemberVideoController {

	@Autowired
	CodeService codeService;

	@RequestMapping("/memberVideoInsertForm.do")
	public String videoInsertForm(Model model) {
		List<CodeVo> list = codeService.selectRegionName();
		model.addAttribute("RegionName", list);

		return "person/member/memberVideoInsertForm";
	}

	@RequestMapping("/memberVideoInsert.do")
	public String fileUpload(@RequestPart MultipartFile files) throws IllegalStateException, IOException {
		String baseDir = "C:\\Users\\User\\Desktop\\upload";
		files.transferTo(new File(baseDir + "\\" + files.getOriginalFilename()));
		return "person/member/memberVideoInsertForm";
	}
}
