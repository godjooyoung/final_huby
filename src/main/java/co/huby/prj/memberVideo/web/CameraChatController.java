package co.huby.prj.memberVideo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CameraChatController {

	@RequestMapping("/cameraChat.do")
	public String cameraChat() {
		return "person/chat/videoChat";
	}
}
