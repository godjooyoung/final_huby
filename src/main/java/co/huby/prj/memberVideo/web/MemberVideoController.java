package co.huby.prj.memberVideo.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.tools.ant.taskdefs.Exit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;
import net.bramp.ffmpeg.FFmpeg;
import net.bramp.ffmpeg.FFmpegExecutor;
import net.bramp.ffmpeg.FFprobe;
import net.bramp.ffmpeg.builder.FFmpegBuilder;

@Controller
public class MemberVideoController {

	private static final String firstUploadPath = "C:\\Users\\User\\Desktop\\androidUpload\\";
	private static final String outputPath = "C:\\Users\\User\\Desktop\\finalResult\\";
	private static UUID uuid = UUID.randomUUID();
	private static String newName = uuid.toString();

	@Autowired
	CodeService codeService;

	@RequestMapping("/memberVideoInsertForm.do")
	public String videoInsertForm(Model model) {
		List<CodeVo> list = codeService.selectRegionName();
		model.addAttribute("RegionName", list);

		return "person/member/memberVideoInsertForm";
	}

	@RequestMapping("/memberVideoInsert.do")
	public String fileUpload(@RequestPart MultipartFile uploadFile) throws IllegalStateException, IOException {
		String baseDir = "";
		// int uploadFileSize = (int) uploadFile.getSize();
		//
		// if (uploadFileSize <= 20000000) {
		// baseDir = outputPath;
		// } else
		baseDir = firstUploadPath;

		File file = new File(baseDir + newName + ".mp4");
		uploadFile.transferTo(file);// 안드로이드에서 파일 업로드하는 부분

		//영상 압축부분
		FFmpeg ffmpeg = new FFmpeg("C:\\Users\\User\\Desktop\\Test\\local\\bin\\ffmpeg");
		FFprobe ffprobe = new FFprobe("C:\\Users\\User\\Desktop\\Test\\local\\bin\\ffprobe");
		FFmpegExecutor excutor = new FFmpegExecutor(ffmpeg, ffprobe);
		FFmpegBuilder builder = new FFmpegBuilder().overrideOutputFiles(true)
				.addInput(firstUploadPath + newName + ".mp4")
				.addOutput(outputPath + newName + ".mp4")
				.addExtraArgs("-vcodec", "libx264")
				.addExtraArgs("-b:v", "1000k")
				.addExtraArgs("-acodec", "mp2")
				.done();
		excutor.createJob(builder).run();
		
		//썸네일 부분
		FFmpegBuilder thumbnail = new FFmpegBuilder().overrideOutputFiles(true)
				.addInput(firstUploadPath + newName + ".mp4")
				.addOutput(outputPath + newName + ".gif")
				.addExtraArgs("-ss", "00:00:00.000")
				.addExtraArgs("-pix_fmt", "rgb24")
				.addExtraArgs("-r", "10")
				.addExtraArgs("-s", "360x640")
				.addExtraArgs("-t", "00:00:7.000")
				.done();
		excutor.createJob(thumbnail).run();

		file.delete();
		return "person/member/memberVideoInsertForm";
	}

}
