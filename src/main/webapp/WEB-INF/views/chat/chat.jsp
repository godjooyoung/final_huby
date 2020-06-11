<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="data"></div>
<input id="message"><button type="button" id="sendBtn">보내기</button>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
	devljh = {};
	devljh.webSocket = {
		init : function(oParam) {
			this._url = oParam.url || "";
			this._initSocket();
			this._initEvent();
		},
		_initSocket : function() {
			this._socket = new SockJS(this._url);
			// 소켓 연결
			this._socket.onmessage = function(evt) {
				// evt 파라미터는 웹소켓을 보내준 데이터 
				$("#data").append(evt.data + "<br/>");
			};
			this._socket.onclose = function(evt) {
				$("#data").append("연결 끊김");
			}
		},
		_initEvent : function() {
			$("#sendBtn").on("click", (function() {
				var msg = $("#message").val();
				this._socket.send(msg);
			}).bind(this));
		}
	};
	$(document).ready(function() {
		devljh.webSocket.init({ url: '/prj/chat.do' }); 
	});
</script>
</body>
</html>