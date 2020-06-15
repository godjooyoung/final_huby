<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 공고목록과 지원자 목록이 뜬다. -->
<!-- br.. -->
<br><br><br><br><br><br><br>

<h3>공고목록</h3>
 <p><strong>Note:</strong> 공고제목을 눌러 지원자를 확인하세요!!</p>
<div class="accordion-box">
   <ul class="Emp_list">
   	<c:forEach var="employmentList" items="${employmentList }">
     <li>
      <p class="title" onclick="listview(event,${employmentList.EMPLOYMENT_ID})" >
      	<b>${employmentList.EMPLOYMENT_TITLE}</b>
      	<br>${employmentList.EMPLOYMENT_TIME}
      </p>
      <div class="con" id="${employmentList.EMPLOYMENT_ID}">
      	<ul>
      		<li></li>
      	</ul>
      	</div>
      	 </li>
     </c:forEach>
     </ul>
  
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
			console.log(data);
			//alert('아작=======아작' + listviewId);
			$(e.target).parent().next().append(data[0].member_id)
			
		},
		error: function(){
		  alert("에러 발생. 관리자에게 문의주세요.");
		}
	})
	
	};
</script>


