<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<br>
<div class="w3-container">
	<h2 align="center">지원내역</h2>

	<div id="Paris" class="w3-container city" style="display: none">
		<h2>Paris</h2>
		<p>Paris is the capital of France.</p>
	</div>
	<div id="London" class="w3-container city" style="display: block">
		<div class="w3-container">
			<c:forEach var="alist" items="${ alist }">
				<ul class="w3-ul w3-card-4">
					<li class="w3-bar"><span
						onclick="this.parentElement.style.display='none'"
						class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
						<img src="img_avatar2.png"
						class="w3-bar-item w3-circle w3-hide-small" style="width: 85px">
						<div class="w3-bar-item" onclick="selectApplyList('${alist.EMPLOYMENT_ID}')">
							<span class="w3-large">공고명: ${alist.EMPLOYMENT_TITLE}</span><br>
							<span class="w3-large">공고내용: ${alist.EMPLOYMENT_CONTENTS}</span><br>채용공고기간${ alist.EMPLOYMENT_TIME } &nbsp;&nbsp; <span>지원시간: ${alist.APPLY_DATE}  </span>
						</div></li>
						<input type="hidden" id="employment_id" name="employment_id">
				</ul>
				<%-- <ul class="nav nav-pills flex-column" id="emp${alist.EMPLOYMENT_TIME}"></ul> --%>
				<br>
			</c:forEach>

		</div>
	</div>
</div>
<script>
	/* function selectApplyList(eid) {
		$("#employment_id").val(eid);
		$.ajax({
		    url: "selectApplyList.do",
		    type: "POST",
		    dataType: "json",
		    data: "employment_id" + eid,
		    success: function(data){
		      alert("성공했다");  
		    }
		  });
	} */

	
</script>

</body>
</html>