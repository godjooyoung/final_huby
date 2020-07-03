<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300"> 공고 상세내용</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					시간을 허비말고 DO HUBY!<br>
					공고의 상세 내용을 확인하세요.
				</p>
			</div>
		</div>
	</div>
	<!--  
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit"></div>
		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="forcomemploymentsList.do">공고관리</a></li>
			<li class="m2"><a href="empInsertPageGo.do">공고등록</a></li>
			<li class="m3"><a href="companyEmploymentsList.do">지원내역</a></li>
		</ul>
	</div>
	  -->
</div>
<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 0px auto 2%;">    
    <!-- ---------------------------- -->
    <div class="w3-container w3-margin-bottom" style="background-color:#134a8e;">
    	<div style="vertical-align: middle;">
    		&nbsp;<h3 style="color:white; margin-bottom:10px;">${ empMatch.EMPLOYMENT_TITLE }</h3>
    		<h5 style="color:white; margin-bottom:20px;"><fmt:formatDate pattern ="yyyy년MM월dd일 까지" value="${ empMatch.EMPLOYMENT_TIME }"/></h5>
    	</div>
	</div>
	<!-- title 끝 -->
	<div class="w3-row-padding ">
		<!-- 내용부분 -->
		<div class="w3-twothird">
			  <h2>공고내용</h2>
			  <div>
			  <pre style="word-wrap: break-word">
			  		${ empMatch.EMPLOYMENT_CONTENTS }
			  </pre>
			  </div>
			  <h2>우대사항</h2>
			  <div>
			  <pre style="word-wrap: break-word">
			  		${ empMatch.EMPLOYMENT_PREFER }
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
  					<td style="width:50%">${ empMatch.HOPE_CAREER }</td>
  					<td style="width:50%">${ empMatch.HOPE_GRADUATE }</td>
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
  					<td style="width:50%">${empMatch.HOPE_SALARY}</td>
  					<td style="width:50%">${empMatch.HOPE_LOCATION}</td>
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
  					<td style="width:33%">${empMatch.HOPE_WORK_TYPE}</td>
  					<td style="width:33%">${empMatch.JOB_NAME}</td>
  					<td style="width:33%">${empMatch.HOPE_JOB_POSITION}</td>
  				</tr>
  			</table>
		</div>
	<!-- 테이블 끝 -->
	</div><br><br><br>
	<!-- 타이틀아래 -->
	<div>
		<table class="w3-table w3-bordered w3-border">
  				<thead class="w3-teal">
  					&nbsp;
  				</thead>
  				<tr>
  					<td rowspan="6" colspan="3" style="border: 1px solid;">회사Logo</td>
  				</tr>
  				<tr>
  					<td colspan="2">${empMatch.COMPANY_NAME}</td>
  					<td colspan="2"><button type="button" class="btn-primary">관심기업 등록</button></td>
  				</tr>
  				<tr>
  					<td>직종</td>
  					<td>${empMatch.JOB_NAME}</td>
  					<td>본사 번호</td>
  					<td>${empMatch.COMPANY_TEL}</td>
  				</tr>
  				<tr>
  					<td>업종</td>
  					<td>${empMatch.BUSINESS_CATEGORY}</td>
  					<td>이메일</td>
  					<td>${empMatch.COMPANY_EMAIL}</td>
  				</tr>
  				<tr>
  					<td>매출액</td>
  					<td>${empMatch.COMPANY_SALES}</td>
  					<fmt:formatDate value="${empMatch.COMPANY_BIRTH}" pattern="yyyy-MM-dd" var="company_birth" />
  					<td>설립일</td>
  					<td>${company_birth}</td>
  				</tr>
  				<tr>
  					<td>홈페이지</td>
  					<td>${empMatch.HOMEPAGE}</td>
  					<td>대표자명</td>
  					<td>${empMatch.CEO_NAME}</td>
  				</tr>
  				<tr align="center">
  					<td>회사주소</td>
  					<td colspan="6">${empMatch.COMPANY_ADDR}</td>
  				</tr>
  			</table>
	</div>
<br>
<!-- END -->
</div>
</div>	
