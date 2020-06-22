<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<br>
<br><br><br>
<h1>기업이 좋아한 사용자 목록입니다.</h1>


<c:forEach var="comLike" items="${comLike}">
<ul>
<li>${comLike.VIDEO_CONTENTS}</li>
<li>${comLike.CODE_NAME}</li>
</ul>
<img src="${pageContext.request.contextPath}/resources/img/common/${comLike.VIDEO_IMG }"
onclick="location.href='resumeDetail.do?video_id=${comLike.VIDEO_ID}&member_id=${comLike.MEMBER_ID }'">
</c:forEach>



