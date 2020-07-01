package co.huby.prj.memberVideo.web;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import co.huby.prj.board.service.BoardService;
import co.huby.prj.code.service.CodeService;
import co.huby.prj.code.service.CodeVo;
import co.huby.prj.member.service.MemberService;
import co.huby.prj.memberVideo.service.MemberVideoService;
import co.huby.prj.vo.VideoVo;
import net.bramp.ffmpeg.FFmpeg;
import net.bramp.ffmpeg.FFmpegExecutor;
import net.bramp.ffmpeg.FFprobe;
import net.bramp.ffmpeg.builder.FFmpegBuilder;
import net.bramp.ffmpeg.options.VideoEncodingOptions;

@Controller
public class MemberVideoController {

	private static final String firstUploadPath = "C:\\Users\\User\\Desktop\\androidUpload\\";
	private static final String outputPath = "C:\\Users\\User\\Desktop\\finalResult\\";

	@Autowired
	CodeService codeService;

	@Autowired
	MemberVideoService memberVideoService;

	@Autowired
	BoardService boardService;

	@RequestMapping("/memberVideoInsertForm.do")
	public String videoInsertForm(Model model, HttpServletRequest request, VideoVo vo) throws Exception {
		String member_id = (String) request.getSession().getAttribute("loginId");
		List<CodeVo> list1 = codeService.SelectAll();
		List<String> video_name = memberVideoService.memberSelect(member_id);
		int video_count = memberVideoService.memberVideoCount(member_id);
		model.addAttribute("RegionName", list1);
		model.addAttribute("videoName", video_name);
		model.addAttribute("videoCount", video_count);
		return "person/member/memberVideoInsertForm";
	}

	@RequestMapping("/download.do")
	public ModelAndView downloadVideo(HttpServletRequest request, @RequestParam String name, Model model)
			throws Exception {
		File down = new File(outputPath + name);
		return new ModelAndView("download", "downloadFile", down);
	}

	@ResponseBody
	@RequestMapping("/memberVideoInsert.do")
	public Map fileUpload(HttpServletRequest request, Model model, @RequestPart MultipartFile uploadFile)
			throws Exception {
		String member_id = (String) request.getSession().getAttribute("loginId");
		String hashtag = request.getParameter("hashtag");
		String contents = request.getParameter("textarea");
		File file = new File(firstUploadPath);

		HashMap<String, String> map = new HashMap<String, String>();
		UUID uuid = UUID.randomUUID();
		String newName = uuid.toString();
		String finalGifOutputPath = newName + ".gif";
		String finalVideoOutputPath = newName + ".mp4";

		if (!file.exists()) {
			file.mkdir();
			file = new File(outputPath);
		}
		if (!file.exists()) {
			file.mkdir();
			file = new File(firstUploadPath + newName + ".mp4");
		} else {
			file = new File(firstUploadPath + newName + ".mp4");
		}
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

		map.put("video_contents", contents);
		map.put("member_id", member_id);
		map.put("video_img", finalGifOutputPath);
		map.put("hashtag", hashtag);
		map.put("video_location", finalVideoOutputPath);
		model.addAttribute("list", map);
		memberVideoService.memberVideoInsert(map);
		return map;
	}

	@RequestMapping("/memberVideoDelete.do")
	public String memberVideoDelete(@RequestParam(value = "videoId") String video_id) {
		
		VideoVo vo = memberVideoService.memberVideoId(video_id);
		memberVideoService.memberVideoDelete(video_id);
		File file2 = new File(outputPath + vo);
		file2.delete();
		File file3 = new File(outputPath + vo);
		file3.delete();

		return "person/member/memberVideoInsertForm";
	}
}
