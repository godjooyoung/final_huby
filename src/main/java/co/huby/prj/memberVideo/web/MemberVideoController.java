package co.huby.prj.memberVideo.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.tools.ant.taskdefs.Exit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;
import co.huby.prj.memberVideo.service.MemberVideoService;
import net.bramp.ffmpeg.FFmpeg;
import net.bramp.ffmpeg.FFmpegExecutor;
import net.bramp.ffmpeg.FFprobe;
import net.bramp.ffmpeg.builder.FFmpegBuilder;

@Controller
public class MemberVideoController {

	private static final String firstUploadPath = "C:\\Users\\User\\Desktop\\androidUpload\\";
	private static final String outputPath = "C:\\Users\\User\\Desktop\\finalResult\\";

	@Autowired
	CodeService codeService;

	@Autowired
	MemberVideoService memberVideoService;

	@RequestMapping("/memberVideoInsertForm.do")
	public String videoInsertForm(Model model) {
		List<CodeVo> list = codeService.selectRegionName();
		model.addAttribute("RegionName", list);

		return "person/member/memberVideoInsertForm";
	}

	@RequestMapping("/memberVideoInsert.do")
	public String fileUpload(HttpServletRequest request, @RequestPart MultipartFile uploadFile) throws Exception {
		String member_id = (String) request.getSession().getAttribute("loginId");
		HashMap<String, String> map = new HashMap<String, String>();
		UUID uuid = UUID.randomUUID();
		String newName = uuid.toString();
		String baseDir = "";
		// int uploadFileSize = (int) uploadFile.getSize();
		//
		// if (uploadFileSize <= 20000000) {
		// baseDir = outputPath;
		// } else
		baseDir = firstUploadPath;

		File file = new File(baseDir + newName + ".mp4");
		uploadFile.transferTo(file);// 안드로이드에서 파일 업로드하는 부분

		// 영상 압축부분
		FFmpeg ffmpeg = new FFmpeg("C:\\Users\\User\\Desktop\\Test\\local\\bin\\ffmpeg");
		FFprobe ffprobe = new FFprobe("C:\\Users\\User\\Desktop\\Test\\local\\bin\\ffprobe");
		FFmpegExecutor excutor = new FFmpegExecutor(ffmpeg, ffprobe);
		FFmpegBuilder builder = new FFmpegBuilder().overrideOutputFiles(true)
				.addInput(firstUploadPath + newName + ".mp4").addOutput(outputPath + newName + ".mp4")
				.addExtraArgs("-vcodec", "libx264").addExtraArgs("-b:v", "1000k").addExtraArgs("-acodec", "mp2").done();
		excutor.createJob(builder).run();

		// 썸네일 부분
		FFmpegBuilder thumbnail = new FFmpegBuilder().overrideOutputFiles(true)
				.addInput(firstUploadPath + newName + ".mp4").addOutput(outputPath + newName + ".gif")
				.addExtraArgs("-ss", "00:00:00.000").addExtraArgs("-pix_fmt", "rgb24").addExtraArgs("-r", "30")
				.addExtraArgs("-s", "360x640").addExtraArgs("-t", "00:00:7.000").done();
		excutor.createJob(thumbnail).run();
		file.delete();

		map.put("member_id", member_id);
		map.put("video_img", outputPath + newName + ".gif");
		map.put("video_location", outputPath + newName + ".mp4");

		memberVideoService.memberVideoInsert(map);
		return "person/member/memberVideoInsertForm";
	}

}
