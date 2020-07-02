<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<div id="container" class="jumbotron"></div>
<div>
	Conversation id:<input id="convId" type="text" />
	<button onclick="window.app.createConversation()">Create</button>
	<button onclick="window.app.createBroadcastConversation()">Create
		broadcast</button>
	<button onclick="window.app.joinConversation()">Join</button>
	<button onclick="window.app.leaveConversation()">Leave</button>
	<button onclick="window.app.upperCase()">UpperCase</button>
</div>
<div>
	<ul id="log">

	</ul>
</div>
<div>
	<video id="template" width="320" height="240" autoplay controls></video>
</div>
<script src="${pageContext.request.contextPath}/resources/js/bundle.js"></script>

