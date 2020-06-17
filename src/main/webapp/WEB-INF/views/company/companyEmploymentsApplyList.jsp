<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 공고목록과 그 공고에 지원한 지원자 목록이 뜬다. -->
<!-- br.. -->
<br><br><br><br><br><br>

<h2>
	공고목록
</h2>
<span>
	<b> 
		공고제목을 눌러 지원자를 확인하세요!!
	</b>
</span>
<br>
<!-- 제목 -->
<!-- 공고목록 -->
<div class="accordion-box">
	<c:forEach var="employmentList" items="${employmentList }">
  		<div id="accordion${employmentList.EMPLOYMENT_ID}">
    		<div class="card">
      			<div class="card-header">
        			<p class="card-link" 
        			onclick="listview(event,${employmentList.EMPLOYMENT_ID})">
          				${employmentList.EMPLOYMENT_TITLE}
        			</p>
        			<span>${employmentList.EMPLOYMENT_TIME}</span>
      			</div>
      			
      			<div id="Listbody${employmentList.EMPLOYMENT_ID}">
        			<div class="card-body">
          			 
        			</div>
      			</div>
    		
    		</div>
  		</div>
	</c:forEach>
</div>
<form id="applyIdfrm" name="applyIdfrm" action="companyApplyMember.do">
	<input type="hidden" id ="applyIdInput"  name ="applyIdInput" value="">
</form>
<script>
function listview(e,listviewId){
	var div = document.getElementById("Listbody"+listviewId);
	$.ajax({
		type:"get",
		url:"companyEmploymentsApply.do",
		data : {'listviewId': listviewId },
		dataType : 'json',
		success: 
			function(data){
			//$(e.target).parent().next().empty();
			//$(e.target).next().append("<b>넥스트가 어딘데?</b>")
			
			$(e.target).parent().next().empty();
			 for(var i=0; i<data.length; i++){
				$(e.target).parent().next().append("<p id=" + 
													"\"" + data[i].apply_id  + "\" onclick=\"showPeson(this)\" >"
						+(i+1)+"번 "+
						data[i].member_id + " " + data[i].apply_date + " " 
						+ data[i].member_name + " " + data[i].resume_title + "</p>")
			 }
			
		},
		
		error: function(){
		  alert("에러 발생. 관리자에게 문의주세요.");
		}
	})
	
	};
function showPeson(id){
		var apply_id = id.getAttribute( 'id' );
		alert(apply_id);
		document.getElementById("applyIdInput").value=apply_id;
		  document.applyIdfrm.action = "companyApplyMember.do";
		  document.applyIdfrm.method = "post";
		  document.applyIdfrm.submit();
};
</script>


