<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300"> 지원자</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					시간을 허비말고 DO HUBY<br>
					공고에 지원한 지원자들을 확인하세요.
				</p>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit"></div>
		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="forcomemploymentsList.do">공고관리</a></li>
			<li class="m2"><a href="empInsertPageGo.do">공고등록</a></li>
			<li class="m3"><a href="companyEmploymentsList.do">지원내역</a></li>
		</ul>
	</div>
</div>


<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 2%;">    
    <!-- 실제소스 -->
    <!-- ---------------------------- -->
    <div class="w3-margin-bottom" style="background-color:#134a8e;">
    	<div style="vertical-align: middle;">
    		&nbsp;<h3 style="color:white; margin-bottom:05px;">
    				${title.employment_title}
    			  </h3>
    			  <h5 style="color:white;  margin-bottom:20px; padding-bottom:20px;">
    			  	<fmt:formatDate pattern ="yyyy년MM월dd일 까지" value="${title.employment_time}"/>
    			  </h5>
    	</div>
	</div>
	<!-- title 끝 -->
	<div class="w3-row-padding ">
		<!-- 내용부분 -->
		<div class="w3-twothird">
			
			  <h2>공고내용</h2>
			  <div>
			  <pre>${title.employment_contents}
			  </pre>
			  </div>
			  <h2>우대사항</h2>
			  <div>
			  <pre>${title.employment_prefer}
			  </pre>
			  </div>
 		</div>
 		<!-- 내용부분끝 -->
 		<!-- 오른쪽 테이블들 -->
		<div class="w3-third">
 			<table class="w3-table w3-bordered w3-border">
  				<thead class="w3" style="background-color:#1a56a1;">
  					<h3>지원자격</h3>
  				</thead>
  				<tr>
  					<th style="width:50%">경력</th>
  					<th style="width:50%">학력</th>
  				</tr>
  				<tr>
  					<td style="width:50%">${title.hope_career}</td>
  					<td style="width:50%">${title.hope_graduate}</td>
  				</tr>
  			</table>
  			
  			
 			<table class="w3-table w3-bordered w3-border">
  				<thead class="w3-blue">
  					&nbsp;
  					<h3>근무조건</h3>
  				</thead>
  				<tr>
  					<th style="width:50%">임금</th>
  					<th style="width:50%">근무지역</th>
  				</tr>
  				<tr>
  					<td style="width:50%">${title.hope_salary}</td>
  					<td style="width:50%">${title.hope_location}</td>
  				</tr>
  			</table>
  			
  			
 			<table class="w3-table w3-bordered w3-border">
  				<thead class="w3-teal">
  					&nbsp;
  					<h3>모집형태</h3>
  				</thead>
  				<tr>
  					<th style="width:33%">고용형태</th>
  					<th style="width:33%">모집직종</th>
  					<th style="width:33%">근무포지션</th>
  				</tr>
  				<tr>
  					<td style="width:33%">${title.hope_work_type}</td>
  					<td style="width:33%">${code.code_name }</td>
  					<td style="width:33%">${title.hope_job_position}</td>
  				</tr>
  			</table>
		</div>
	<!-- 테이블 끝 -->
	</div>
	<br>
	<!-- 타이틀아래 -->
	<!-- ---------------------------------------------- -->
	 <div class="w3-container w3-margin-bottom" style="background-color:#134a8e;">
    	<div style="vertical-align: middle;">
    		&nbsp;<h4 style="color:white; margin-bottom:15px;">
    				지원자 목록
    			  </h4>
    	</div>
	</div>
	<!-- ---------------------------------------------- -->
	<c:set var="applymenList" value="${applymenList}" />
	<c:choose>
		<c:when test="${!empty applymenList}">
		<div class="sub0101_con">
			<div class="container">
				  <ul class="list-group list-group-flush">
				  	<c:forEach var="applymen" items="${applymenList}" varStatus="cnt" >
				    <li style="cursor:pointer;" class="list-group-item"  value="${applymen.apply_id}" 
				    	onclick="showPeson(${applymen.apply_id})">
				    	<p align="left" style="float:left;">${cnt.count}번 ${applymen.member_name} 지원자</p>
				    	<p align="right" style="float:right;"><fmt:formatDate pattern ="yyyy년MM월dd일 지원" value="${applymen.apply_date}"/></p>
				    </li>
				  	<form id="applyfrm${applymen.apply_id}" name="applyfrm" action="" method="">
						<input type="hidden" value="" name="applyidInput" id="applyidInput${applymen.apply_id}">
					</form>
				    
				    </c:forEach>
				  </ul>
			</div>
		</div>
		</c:when>
		
		<c:when test="${empty applymenList}">
			<h5>지원자가 아직 없습니다.</h5>
		</c:when>
	</c:choose>
	<!--END-->
	</div>
</div>

<script>
function showPeson(id){
	var apply_id = id;
	var inputTagId = "applyidInput"+apply_id;
	var formTagId="applyfrm"+apply_id;
	alert(apply_id);
	document.getElementById(inputTagId).value=apply_id;
	  document.getElementById(formTagId).action = "companyApplyMember.do";
	  document.getElementById(formTagId).method = "post";
	  document.getElementById(formTagId).submit();
};
</script>

