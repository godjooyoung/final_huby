<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.huby.prj.Applistner"%>
<br>
<c:set var="connId" value="<%=Applistner.getUserList()%>" />
<style class="cp-pen-styles">
body {
	display: contents;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	font-family: "proxima-nova", "Source Sans Pro", sans-serif;
	font-size: 1em;
	letter-spacing: 0.1px;
	color: #134a8e;
	text-rendering: optimizeLegibility;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.004);
	-webkit-font-smoothing: antialiased;
}

#frame {
	width: 100%;
	min-width: 360px;
	max-width: 2000px;
	height: 92vh;
	min-height: 300px;
	max-height: 720px;
	background: #E6EAEA;
}

@media screen and (max-width: 360px) {
	#frame {
		width: 100%;
		height: 100vh;
	}
}

#frame #sidepanel {
	float: left;
	min-width: 280px;
	max-width: 400px;
	width: 40%;
	height: 100%;
	background: #134a8e;
	color: #f5f5f5;
	overflow: hidden;
	position: relative;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel {
		width: 58px;
		min-width: 58px;
	}
}

#frame #sidepanel #profile {
	width: 80%;
	margin: 25px auto;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile {
		width: 100%;
		margin: 0 auto;
		padding: 5px 0 0 0;
		background: #32465a;
	}
}

#frame #sidepanel #profile.expanded .wrap {
	height: 210px;
	line-height: initial;
}

#frame #sidepanel #profile.expanded .wrap p {
	margin-top: 20px;
}

#frame #sidepanel #profile.expanded .wrap i.expand-button {
	-moz-transform: scaleY(-1);
	-o-transform: scaleY(-1);
	-webkit-transform: scaleY(-1);
	transform: scaleY(-1);
	filter: FlipH;
	-ms-filter: "FlipH";
}

#frame #sidepanel #profile .wrap {
	height: 60px;
	line-height: 60px;
	overflow: hidden;
	-moz-transition: 0.3s height ease;
	-o-transition: 0.3s height ease;
	-webkit-transition: 0.3s height ease;
	transition: 0.3s height ease;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap {
		height: 55px;
	}
}

#frame #sidepanel #profile .wrap img {
	width: 50px;
	border-radius: 50%;
	padding: 3px;
	border: 2px solid #e74c3c;
	height: auto;
	float: left;
	cursor: pointer;
	-moz-transition: 0.3s border ease;
	-o-transition: 0.3s border ease;
	-webkit-transition: 0.3s border ease;
	transition: 0.3s border ease;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap img {
		width: 40px;
		margin-left: 4px;
	}
}

#frame #sidepanel #profile .wrap img.online {
	border: 2px solid #2ecc71;
}

#frame #sidepanel #profile .wrap img.away {
	border: 2px solid #f1c40f;
}

#frame #sidepanel #profile .wrap img.busy {
	border: 2px solid #e74c3c;
}

#frame #sidepanel #profile .wrap img.offline {
	border: 2px solid #95a5a6;
}

#frame #sidepanel #profile .wrap p {
	float: left;
	margin-left: 15px;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap p {
		display: none;
	}
}

#frame #sidepanel #profile .wrap i.expand-button {
	float: right;
	margin-top: 23px;
	font-size: 0.8em;
	cursor: pointer;
	color: #435f7a;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap i.expand-button {
		display: none;
	}
}

#frame #sidepanel #profile .wrap #status-options {
	position: absolute;
	opacity: 0;
	visibility: hidden;
	width: 150px;
	margin: 70px 0 0 0;
	border-radius: 6px;
	z-index: 99;
	line-height: initial;
	background: #435f7a;
	-moz-transition: 0.3s all ease;
	-o-transition: 0.3s all ease;
	-webkit-transition: 0.3s all ease;
	transition: 0.3s all ease;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap #status-options {
		width: 58px;
		margin-top: 57px;
	}
}

#frame #sidepanel #profile .wrap #status-options.active {
	opacity: 1;
	visibility: visible;
	margin: 75px 0 0 0;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap #status-options.active {
		margin-top: 62px;
	}
}

#frame #sidepanel #profile .wrap #status-options:before {
	content: '';
	position: absolute;
	width: 0;
	height: 0;
	border-left: 6px solid transparent;
	border-right: 6px solid transparent;
	border-bottom: 8px solid #435f7a;
	margin: -8px 0 0 24px;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap #status-options:before {
		margin-left: 23px;
	}
}

#frame #sidepanel #profile .wrap #status-options ul {
	overflow: hidden;
	border-radius: 6px;
}

#frame #sidepanel #profile .wrap #status-options ul li {
	padding: 15px 0 30px 18px;
	display: block;
	cursor: pointer;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap #status-options ul li {
		padding: 15px 0 35px 22px;
	}
}

#frame #sidepanel #profile .wrap #status-options ul li:hover {
	background: #496886;
}

#frame #sidepanel #profile .wrap #status-options ul li span.status-circle
	{
	position: absolute;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	margin: 5px 0 0 0;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap #status-options ul li span.status-circle
		{
		width: 14px;
		height: 14px;
	}
}

#frame #sidepanel #profile .wrap #status-options ul li span.status-circle:before
	{
	content: '';
	position: absolute;
	width: 14px;
	height: 14px;
	margin: -3px 0 0 -3px;
	background: transparent;
	border-radius: 50%;
	z-index: 0;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap #status-options ul li span.status-circle:before
		{
		height: 18px;
		width: 18px;
	}
}

#frame #sidepanel #profile .wrap #status-options ul li p {
	padding-left: 12px;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #profile .wrap #status-options ul li p {
		display: none;
	}
}

#frame #sidepanel #profile .wrap #status-options ul li#status-online span.status-circle
	{
	background: #2ecc71;
}

#frame #sidepanel #profile .wrap #status-options ul li#status-online.active span.status-circle:before
	{
	border: 1px solid #2ecc71;
}

#frame #sidepanel #profile .wrap #status-options ul li#status-away span.status-circle
	{
	background: #f1c40f;
}

#frame #sidepanel #profile .wrap #status-options ul li#status-away.active span.status-circle:before
	{
	border: 1px solid #f1c40f;
}

#frame #sidepanel #profile .wrap #status-options ul li#status-busy span.status-circle
	{
	background: #e74c3c;
}

#frame #sidepanel #profile .wrap #status-options ul li#status-busy.active span.status-circle:before
	{
	border: 1px solid #e74c3c;
}

#frame #sidepanel #profile .wrap #status-options ul li#status-offline span.status-circle
	{
	background: #95a5a6;
}

#frame #sidepanel #profile .wrap #status-options ul li#status-offline.active span.status-circle:before
	{
	border: 1px solid #95a5a6;
}

#frame #sidepanel #profile .wrap #expanded {
	padding: 100px 0 0 0;
	display: block;
	line-height: initial !important;
}

#frame #sidepanel #profile .wrap #expanded label {
	float: left;
	clear: both;
	margin: 0 8px 5px 0;
	padding: 5px 0;
}

#frame #sidepanel #profile .wrap #expanded input {
	border: none;
	margin-bottom: 6px;
	background: #32465a;
	border-radius: 3px;
	color: #f5f5f5;
	padding: 7px;
	width: calc(100% - 43px);
}

#frame #sidepanel #profile .wrap #expanded input:focus {
	outline: none;
	background: #435f7a;
}

#frame #sidepanel #search {
	border-top: 1px solid #32465a;
	border-bottom: 1px solid #32465a;
	font-weight: 300;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #search {
		display: none;
	}
}

#frame #sidepanel #search label {
	position: absolute;
	margin: 10px 0 0 20px;
}

#frame #sidepanel #search input {
	font-family: "proxima-nova", "Source Sans Pro", sans-serif;
	padding: 10px 0 10px 46px;
	width: calc(100% - 0px);
	border: none;
	background: #32465a;
	color: #f5f5f5;
}

#frame #sidepanel #search input:focus {
	outline: none;
	background: #435f7a;
}

#frame #sidepanel #search input::-webkit-input-placeholder {
	color: #f5f5f5;
}

#frame #sidepanel #search input::-moz-placeholder {
	color: #f5f5f5;
}

#frame #sidepanel #search input:-ms-input-placeholder {
	color: #f5f5f5;
}

#frame #sidepanel #search input:-moz-placeholder {
	color: #f5f5f5;
}

#frame #sidepanel #contacts {
	height: calc(100% - 177px);
	overflow-y: scroll;
	overflow-x: hidden;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #contacts {
		height: calc(100% - 149px);
		overflow-y: scroll;
		overflow-x: hidden;
	}
	#frame #sidepanel #contacts::-webkit-scrollbar {
		display: none;
	}
}

#frame #sidepanel #contacts.expanded {
	height: calc(100% - 334px);
}

#frame #sidepanel #contacts::-webkit-scrollbar {
	width: 8px;
	background: #134a8e;
}

#frame #sidepanel #contacts::-webkit-scrollbar-thumb {
	background-color: #243140;
}

#frame #sidepanel #contacts ul li.contact {
	position: relative;
	padding: 15px 0 15px 10px;
	font-size: 0.9em;
	cursor: pointer;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #contacts ul li.contact {
		padding: 6px 0 46px 8px;
	}
}

#frame #sidepanel #contacts ul li.contact:hover {
	background: #32465a;
}

#frame #sidepanel #contacts ul li.contact.active {
	background: #32465a;
	border-right: 5px solid #435f7a;
}

#frame #sidepanel #contacts ul li.contact.active span.contact-status {
	border: 2px solid #32465a !important;
}

#frame #sidepanel #contacts ul li.contact .wrap {
	width: 88%;
	margin: 0 auto;
	position: relative;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #contacts ul li.contact .wrap {
		width: 100%;
	}
}

#frame #sidepanel #contacts ul li.contact .wrap span {
	position: absolute;
	left: 0;
	margin: -2px 0 0 -2px;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	border: 2px solid #134a8e;
	background: #95a5a6;
}

#frame #sidepanel #contacts ul li.contact .wrap span.online {
	background: #2ecc71;
}

#frame #sidepanel #contacts ul li.contact .wrap span.away {
	background: #f1c40f;
}

#frame #sidepanel #contacts ul li.contact .wrap span.busy {
	background: #e74c3c;
}

#frame #sidepanel #contacts ul li.contact .wrap img {
	width: 40px;
	border-radius: 50%;
	float: left;
	margin-right: 10px;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #contacts ul li.contact .wrap img {
		margin-right: 0px;
	}
}

#frame #sidepanel #contacts ul li.contact .wrap .meta {
	padding: 5px 0 0 0;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #contacts ul li.contact .wrap .meta {
		display: none;
	}
}

#frame #sidepanel #contacts ul li.contact .wrap .meta .name {
	font-weight: 600;
}

#frame #sidepanel #contacts ul li.contact .wrap .meta .preview {
	margin: 5px 0 0 0;
	padding: 0 0 1px;
	font-weight: 400;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	-moz-transition: 1s all ease;
	-o-transition: 1s all ease;
	-webkit-transition: 1s all ease;
	transition: 1s all ease;
}

#frame #sidepanel #contacts ul li.contact .wrap .meta .preview span {
	position: initial;
	border-radius: initial;
	background: none;
	border: none;
	padding: 0 2px 0 0;
	margin: 0 0 0 1px;
	opacity: .5;
}

#frame #sidepanel #bottom-bar {
	position: absolute;
	width: 100%;
	bottom: 0;
}

#frame #sidepanel #bottom-bar button {
	float: left;
	border: none;
	width: 50%;
	padding: 10px 0;
	background: #32465a;
	color: #f5f5f5;
	cursor: pointer;
	font-size: 0.85em;
	font-family: "proxima-nova", "Source Sans Pro", sans-serif;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #bottom-bar button {
		float: none;
		width: 100%;
		padding: 15px 0;
	}
}

#frame #sidepanel #bottom-bar button:focus {
	outline: none;
}

#frame #sidepanel #bottom-bar button:nth-child(1) {
	border-right: 1px solid #134a8e;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #bottom-bar button:nth-child(1) {
		border-right: none;
		border-bottom: 1px solid #134a8e;
	}
}

#frame #sidepanel #bottom-bar button:hover {
	background: #435f7a;
}

#frame #sidepanel #bottom-bar button i {
	margin-right: 3px;
	font-size: 1em;
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #bottom-bar button i {
		font-size: 1.3em;
	}
}

@media screen and (max-width: 735px) {
	#frame #sidepanel #bottom-bar button span {
		display: none;
	}
}

#frame .content {
	float: right;
	width: 60%;
	height: 100%;
	overflow: hidden;
	position: relative;
}

@media screen and (max-width: 735px) {
	#frame .content {
		width: calc(100% - 58px);
		min-width: 300px !important;
	}
}

@media screen and (min-width: 900px) {
	#frame .content {
		width: calc(100% - 400px);
	}
}

#frame .content .contact-profile {
	width: 100%;
	height: 60px;
	line-height: 60px;
	background: #f5f5f5;
}

#frame .content .contact-profile img {
	width: 40px;
	border-radius: 50%;
	float: left;
	margin: 14px 12px 0 10px;
}

#frame .content .contact-profile p {
	float: left;
}

#frame .content .contact-profile .social-media {
	float: right;
}

#frame .content .contact-profile .social-media i {
	margin-left: 14px;
	cursor: pointer;
}

#frame .content .contact-profile .social-media i:nth-last-child(1) {
	margin-right: 20px;
}

#frame .content .contact-profile .social-media i:hover {
	color: #435f7a;
}

#frame .content .messages {
	width: 100%;
	height: auto;
	min-height: calc(100% - 95px);
	max-height: calc(100% - 95px);
	overflow-y: scroll;
	overflow-x: scroll;
	height: auto;
}

@media screen and (max-width: 735px) {
	#frame .content .messages {
		max-height: calc(100% - 105px);
	}
}

#frame .content .messages::-webkit-scrollbar {
	width: 8px;
	background: transparent;
}

#frame .content .messages::-webkit-scrollbar-thumb {
	background-color: rgba(0, 0, 0, 0.3);
}

#frame .content .messages ul li {
	display: inline-block;
	clear: both;
	float: left;
	margin: 15px 15px 5px 15px;
	width: calc(100% - 25px);
	font-size: 0.9em;
}

#frame .content .messages ul li:nth-last-child(1) {
	margin-bottom: 20px;
}

#frame .content .messages ul li.sent img {
	margin: 6px 8px 0 0;
}

#frame .content .messages ul li.sent p {
	background: #435f7a;
	color: #f5f5f5;
}

#frame .content .messages ul li.replies img {
	float: right;
	margin: 6px 0 0 8px;
}

#frame .content .messages ul li.replies p {
	background: #f5f5f5;
	float: right;
}

#frame .content .messages ul li img {
	width: 22px;
	border-radius: 50%;
	float: left;
}

#frame .content .messages ul li p {
	display: inline-block;
	padding: 10px 15px;
	border-radius: 20px;
	max-width: 205px;
	line-height: 130%;
}

@media screen and (min-width: 735px) {
	#frame .content .messages ul li p {
		max-width: 300px;
	}
}

#frame .content .message-input {
	position: absolute;
	bottom: 0;
	width: 100%;
}

#frame .content .message-input .wrap {
	position: relative;
}

#frame .content .message-input .wrap input {
	font-family: "proxima-nova", "Source Sans Pro", sans-serif;
	float: left;
	border: none;
	width: calc(100% - 90px);
	padding: 15px 32px 10px 15px;
	font-size: 0.8em;
	color: #32465a;
}

@media screen and (max-width: 735px) {
	#frame .content .message-input .wrap input {
		padding: 15px 32px 16px 8px;
	}
}

#frame .content .message-input .wrap input:focus {
	outline: none;
}

#frame .content .message-input .wrap .attachment {
	position: absolute;
	right: 60px;
	z-index: 4;
	margin-top: 10px;
	font-size: 1.1em;
	color: #435f7a;
	opacity: .5;
	cursor: pointer;
}

@media screen and (max-width: 735px) {
	#frame .content .message-input .wrap .attachment {
		margin-top: 17px;
		right: 65px;
	}
}

#frame .content .message-input .wrap .attachment:hover {
	opacity: 1;
}

#frame .content .message-input .wrap button {
	float: right;
	border: none;
	width: 50px;
	padding: 12px 0;
	cursor: pointer;
	background: #32465a;
	color: #f5f5f5;
}

@media screen and (max-width: 735px) {
	#frame .content .message-input .wrap button {
		padding: 16px 0;
	}
}

#frame .content .message-input .wrap button:hover {
	background: #435f7a;
}

#frame .content .message-input .wrap button:focus {
	outline: none;
}
</style>
<script>
	try {
		Typekit.load({
			async : true
		});
	} catch (e) {}
</script>
<div id="frame">
	<div id="sidepanel">
		<div id="profile">
			<div class="wrap">
				<img id="profile-img" src="${pageContext.request.contextPath}/resources/FileUpload/${companyPhoto}" class="online" alt="" />
				<p>${loginName}</p>
				<i class="fa fa-chevron-down expand-button" aria-hidden="true"></i>
				<div id="expanded">
					<label for="twitter">
					<i class="fa fa-facebook fa-fw" aria-hidden="true"></i></label> 
					<input name="twitter" type="text" value="mikeross" /> 
					<label for="twitter"><i class="fa fa-twitter fa-fw" aria-hidden="true"></i></label> 
					<input name="twitter" type="text" value="ross81" /> 
					<label for="twitter"><i class="fa fa-instagram fa-fw" aria-hidden="true"></i></label> 
					<input name="twitter" type="text" value="mike.ross" />
				</div>
			</div>
		</div>
		<div id="search">
			<label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
			<input type="text" id="myInput" placeholder="이름을 검색하세요." />
		</div>
		
		<!-- 채팅리스트 -->
		<div id="contacts">
			<ul>
				<c:forEach var="list" items="${companyChatList}">
					<li class="contact" data-i='${list.interview_id }' data-m='${list.company_id }'>
						<div class="wrap">
							<c:if test="${fn:contains(connId, list.member_id)}">
								<span class="contact-status busy"></span>
							</c:if>
							<img src="${pageContext.request.contextPath}/resources/FileUpload/${list.member_photo}" alt="" />
							<div class="meta">
								<p class="name">${list.member_name}
								<c:if test="${fn:contains(connId, list.member_id)}">접속중
								<box-icon name='message-edit' animation='tada' color='#FFFFFF' ></box-icon>
							</c:if></p>
							</div>
							<form id ="insert">
								<input type="hidden" name="interview_id" value="${list.interview_id}">
								<input type="hidden" name="company_id" value="${list.company_id}">
								<input type="hidden" name="member_id" value="${list.member_id}">
								<input type="hidden" name="receiver" value="${list.member_id}">
								<input type="hidden" name="sender" value="${list.company_id}">
								<input type="hidden" name="message_content" value="${message_content}">
							</form>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 채팅리스트 끝 -->
		
		<div id="bottom-bar">
			<button id="addcontact">
				<i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> 
				<span>맞춤추천인재</span>
			</button>
			<button id="settings">
				<i class="fa fa-cog fa-fw" aria-hidden="true"></i> <span>Settings</span>
			</button>
		</div>
	</div>
	
	<div class="content">
		<div class="contact-profile">
			<img src="" id="photo">
			<p id="name"></p>
			<div class="social-media">
				<i class="fa fa-facebook" aria-hidden="true"></i> 
				<i class="fa fa-twitter" aria-hidden="true"></i> 
				<i class="fa fa-instagram" aria-hidden="true"></i>
			</div>
		</div>

		<!-- 메시지 창  -->
		<div class="messages">
			<ul id="message_content">
			</ul>
		</div>
		<!-- end 메시지 창  -->

		<!-- 메시지 입력 창  -->
		<div class="message-input">
			<div class="wrap">
				<input type="text" placeholder="메시지를 입력하세요." id="message" />
				<a href="cameraChat.do"><i class="fa fa-paperclip attachment" aria-hidden="true"></i></a>
				<button class="submit" id="sendBtn">
					<i class="fa fa-paper-plane" aria-hidden="true"></i>
				</button>
			</div>
		</div>
		<!-- end 메시지 입력 창  -->
	</div>
</div>
<script>
	var img = document.getElementById("photo");
	
	$(document).ready(function(){
		  $("#myInput").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#myList p").filter(function() {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});
	
	
	$(".messages").animate({ scrollTop : $(document).height()}, "fast");
	$(".expand-button").click(function() {
		$("#profile").toggleClass("expanded");
		$("#contacts").toggleClass("expanded");
	});
	
	var message = {};
	message.message_type = 'CHAT';
	
	function newMessage() {
		var msg = $(".message-input input").val();
		if (msg != "") {
			message.message_content = $("#message").val();
			sock.send(JSON.stringify(message)); //웹소켓으로 메시지를 보내겠어
		}
		$("#message").val(""); //입력한후 폼에서 삭제
	}

	function getTimeStamp() {
		var d = new Date();
		var s = leadingZeros(d.getFullYear(), 4) + '-'
				+ leadingZeros(d.getMonth() + 1, 2) + '-'
				+ leadingZeros(d.getDate(), 2) + ' ' +

				leadingZeros(d.getHours(), 2) + ':'
				+ leadingZeros(d.getMinutes(), 2) + ':'
				+ leadingZeros(d.getSeconds(), 2);

		return s;
	}

	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();
		if (n.length < digits) {
			for (i = 0; i < digits - n.length; i++)
				zero += '0';
		}
		return zero + n;
	}

	function appendMessage(msg) {
		if (msg == '') {
			return false;
		} else {
			var t = getTimeStamp();
			if (msg.message_sender == '${loginId}') {
				$("#messages").append($('<li class="replies"><img src="${pageContext.request.contextPath}/resources/FileUpload/${companyPhoto}" alt="" /><p>'
										+ msg.message_content + '</p>' 
										+ '<br><span style="float: right; font-size: 9px; text-align: right;">'
										+ t + '</span></li>').appendTo($('.messages ul')));
			} else {
				$("#messages").append($('<li class="sent"><img src="'+ img.src +'" /><p>'
										+ msg.message_content + '</p>'
										+ '<br><span style="float: left; font-size: 9px; text-align: left;">'
										+ t + '</span></li>').appendTo($('.messages ul')));
		}
	}
		$('.message-input input').val(null);
		$(".messages").scrollTop($(".messages").prop('scrollHeight'))
	};
	
	$('.submit').click(function() {
		newMessage();
	});

	$(window).on('keydown', function(e) {
		if (e.which == 13) {
			newMessage();
			return false;
		}
	});

		$('#sendBtn').click(function() {
			newMessage();
		});
		$('#enterBtn').click(function() {
			connect();
		});
		$('#exitBtn').click(function() {
			disconnect();
		});
		
		$(".contact").click(function() {
			var interview_id = $(this).attr("data-i")
			ajaxSelectChat($(this), interview_id);
		})
		
	function ajaxSelectChat(i, chat) {
		
		$(".contact").removeClass("active")
		i.addClass("active");
		var frm = i.find("form").get(0);
		var company_id = frm.company_id.value
		var member_id = frm.member_id.value
		message.message_receiver = '${loginId}' == company_id ? member_id : company_id;
		message.message_sender = '${loginId}'
		message.interview_id = frm.interview_id.value;
		message.member_id = frm.member_id.value;
		message.company_id = frm.company_id.value;
			
		var t = getTimeStamp();
		
		$.ajax({
			url : "ajaxSelectChat.do",
			type : "post",
			dataType : "json",
			data : {
				'interview_id' : chat
			},
			success : function(data) {
				$('#message_content').empty();
				$('#name').empty();
				$('#name').append(data.name.MEMBER_NAME);
				$('#photo').empty();
				$('#photo').attr("src", "${pageContext.request.contextPath}/resources/FileUpload/" + data.name.MEMBER_PHOTO);
				for (var i = 0; i < data.result.length; i++) {
					if (data.result[i].message_sender == '${loginId}') {
						$('#message_content').append("<li class='replies'><img src='${pageContext.request.contextPath}/resources/FileUpload/${companyPhoto}' alt='' /><p>" 
								+ data.result[i].message_content 
								+ "</p><br><span style='float: right; font-size: 9px; text-align: right;'>" 
								+ t + "</span></li>");
				} else {
					$('#message_content').append("<li class='sent'><img src='${pageContext.request.contextPath}/resources/FileUpload/"
										+ data.name.MEMBER_PHOTO + "' alt='' /><p>"
										+ data.result[i].message_content 
										+ "</p><br><span style='float: left; font-size: 9px; text-align: left;'>" 
										+ t + "</span></li>");
				}					
			}
					if (data.result.length == 0) {$('#message_content').append("<div align='center'><h3>대화를 시작해 보세요.</h3></div>");
				}
					$(".messages").scrollTop($(".messages").prop('scrollHeight'))
			},
			error : function(request, status, error) {
			}
		});
	}
		setTimeout(function() {
			$(".contact").first().click()
		}, 500);
</script>