<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function gopage(p) {
		location.href = window.location.pathname + "?page=" + p;
	}
</script>
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
		<!-- <div class="w3-container"> -->
			<c:forEach var="alist" items="${ alist }">
				<ul class="w3-ul w3-card-4">
					<li id="detailemp${alist.EMPLOYMENT_ID}" class="w3-bar">
					<span
						onclick="this.parentElement.style.display='none'"
						class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>
						<img src="img_avatar2.png"
						class="w3-bar-item w3-circle w3-hide-small" style="width: 85px">
						<div class="w3-bar-item" onclick="selectApplyList('${alist.EMPLOYMENT_ID}')">
							<span class="w3-large">공고명: ${alist.EMPLOYMENT_TITLE}</span><br>
							<span class="w3-large">공고내용: ${alist.EMPLOYMENT_CONTENTS}</span><br>채용공고기간${ alist.EMPLOYMENT_TIME } &nbsp;&nbsp; <span>지원시간: ${alist.APPLY_DATE}  </span>
						</div></li>
				</ul>
						<p id="appendemp${alist.EMPLOYMENT_ID}" style="display: none;"></p>
				<%-- <ul class="nav nav-pills flex-column" id="emp${alist.EMPLOYMENT_TIME}"></ul> --%>
				<br>
			</c:forEach>

	</div>
</div>
<div align="center">
<nav id="paging" aria-label="Page navigation example">
	<ul class="pagination">
		<c:if test="${paging.startPage>1}">
			<li class="page-item"><a class="page-link"
				href="javascript:void(0);" onclick="gopage(${paging.startPage-1})">이전</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
			<c:if test="${i != paging.page}">
				<li class="page-item"><a class="page-link"
					href="javascript:void(0);" onclick="gopage(${i})">${i}</a>
			</c:if>
			<c:if test="${i == paging.page}">
				<li class="page-item active"><a class="page-link"
					href="javascript:void(0);" onclick="gopage(${i})">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.totalPageCount}">
			<li class="page-item"><a class="page-link"
				href="javascript:void(0);" onclick="gopage(${paging.endPage+1})">다음</a>
		</c:if>
	</ul>
</nav>
</div>
<form id="frm_go_page" name="frm_go_page" action="selectresumepage.do" method="post">
<input type="hidden" value="" name="employment_id" id="go_page_input">
</form>
<script>
	function pagegogo(empid){
		document.getElementById("go_page_input").value = empid;
		document.getElementById("frm_go_page").submit(); 
	}
	

	function selectApplyList(eid) {
		if($("#appendemp"+eid).css("display") == "none"){
		$.ajax({
		    url: "selectApplyList.do",
		    type: "POST",
		    dataType: "json",
		    data: {'employment_id':eid},
		    success: function(data){
		    	$("#appendemp"+eid).empty();
		    	$("#appendemp"+eid).append(data.employment_title + "<br>");
		    	$("#appendemp"+eid).append(data.employment_contents + "<br>");
		    	$("#appendemp"+eid).append(data.hope_career + "<br>");
		    	$("#appendemp"+eid).append(data.hope_graduate + "<br>");
		    	$("#appendemp"+eid).append(data.hope_job_position + "<br>");
		    	$("#appendemp"+eid).append(data.hope_job + "<br>");
		    	$("#appendemp"+eid).append(data.hope_location + "<br>");
		    	$("#appendemp"+eid).append(data.hope_work_type + "<br>");
		    	$("#appendemp"+eid).append(data.employment_prefer + "<br>");
		    	$("#appendemp"+eid).append(data.hope_salary + "<br>");  
		    	$("#appendemp"+eid).show();
		    	$("#appendemp"+eid).append("<input type=\"button\" class=\"btn-primary\" value=\"상세히보기\"" 
		    									+"onclick=\"pagegogo('"
		    									+data.employment_id+
		    									"')\">" );
		    },

			error : function() {
				alert("에러 발생. 관리자에게 문의주세요.");
			}
		})
		}else{
			$("#appendemp"+eid).hide();
		}
};
</script>

</body>
</html>