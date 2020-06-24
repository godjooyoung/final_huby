package co.huby.prj.chat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import co.huby.prj.chat.service.ChatService;
import co.huby.prj.member.service.MemberVo;
import co.huby.prj.vo.MessageVo;

import com.google.gson.Gson;

public class Handler extends TextWebSocketHandler {

	@Autowired
	private ChatService service;
	
	private List<WebSocketSession> connectedUsers;

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>(); //1:1채팅

	public Handler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		if (session.getAttributes().get("loginId") != null)
			users.put((String) session.getAttributes().get("loginId"), session);
		log(session.getId() + " 연결 됨!!");
		connectedUsers.add(session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료됨");
		connectedUsers.remove(session);
		users.remove(session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println(message.getPayload()); //사용자가 보낸메시지
		System.out.println(users);
		Map<String, Object> map = null;
		MessageVo messageVo = MessageVo.convertMessage(message.getPayload());

		WebSocketSession rs = users.get(messageVo.getMessage_receiver());
		if (rs != null) {
			rs.sendMessage(new TextMessage(message.getPayload()));
		}
		session.sendMessage(new TextMessage(message.getPayload()));

	}

	protected void sendAllMessage(WebSocketSession session, TextMessage message) throws Exception {

		System.out.println(message.getPayload());
		Map<String, Object> map = null;
		MessageVo messageVo = MessageVo.convertMessage(message.getPayload());

		for (WebSocketSession websocketSession : connectedUsers) {
			map = websocketSession.getAttributes();
			MemberVo login = (MemberVo) map.get("loginId");
			

			// 받는사람
			if (login.getMember_id().equals(messageVo.getMessage_sender())) {
				Gson gson = new Gson();
				String msgJson = gson.toJson(messageVo);
				websocketSession.sendMessage(new TextMessage(msgJson));
			}

		}
	}

	@Override

	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);

	}

}