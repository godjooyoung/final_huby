<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/sockjs.min.js"></script>
<title>Chat</title>
</head>
<body>
	<form id="chatForm">
		<input type="text" id="message" />
		<button>send</button>
	</form>
	<div id="chat"></div>
	<script>
		$(document).ready(function() {
			$("#chatForm").submit(function(event) {
				event.preventDefault();
				sock.send($("#message").val());
				$("#message").val('').focus();
			});
		});

		var sock = new SockJS("/chat");

		sock.onmessage = function(e) {
			$("#chat").append(e.data + "<br/>");
		}

		sock.onclose = function() {
			$("#chat").append("연결 종료");
		}
	</script>
</body>
</html>