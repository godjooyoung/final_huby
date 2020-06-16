<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 공고목록과 지원자 목록이 뜬다. -->
<!-- br.. -->
<br><br><br><br><br><br><br>

<h3>공고목록</h3>
<p><strong> 공고제목을 눌러 지원자를 확인하세요!!</strong></p>

<div class="accordion-box">
   
   	<c:forEach var="employmentList" items="${employmentList }">
    		<p class="title" onclick="listview(event,${employmentList.EMPLOYMENT_ID})" >
      			<b>${employmentList.EMPLOYMENT_TITLE}</b>
      			<br>${employmentList.EMPLOYMENT_TIME}
      		</p>
      		<div class="con" id="${employmentList.EMPLOYMENT_ID}" style="background-color:pink">
      			
      			
      			
      		</div>
     </c:forEach>
</div>

<script>

function listview(e,listviewId){
	//alert('클릭' + listviewId);
	$.ajax({
		type:"get",
		url:"companyEmploymentsApply.do",
		data : {'listviewId': listviewId },
		dataType : 'json',
		success: function(data){
			//$(e.target).parent().next().empty();
			//$(e.target).next().append("<b>넥스트가 어딘데?</b>")
			$(e.target).next().empty();
			 for(var i=0; i<data.length; i++){
				$(e.target).next().append( "<p>"+
						data[i].member_id + " " + data[i].apply_date + " " 
						+ data[i].member_name + " " + data[i].resume_title + "</p>")
			 }
			
		},
		error: function(){
		  alert("에러 발생. 관리자에게 문의주세요.");
		}
	})
	
	};
</script>


