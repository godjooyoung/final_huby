<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	li{cursor:pointer}
</style>

<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300"> 공고관리</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					시간을 허비말고 DO HUBY<br>
					공고 목록입니다.
				</p>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit">
			
		</div>

		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="forcomemploymentsList.do">공고관리</a></li>
			<li class="m2"><a href="empInsertPageGo.do">공고등록</a></li>
			<li class="m3"><a href="companyEmploymentsList.do">지원내역</a></li>
		</ul>
	</div>
</div>

<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 2%;">
		<!-- 실제 소스들-->
		<div class="sub0101_con">
			<div class="container">
				  <ul class="list-group list-group-flush">
				  	<c:forEach var="employment" items="${employments}">
				    <li class="list-group-item"  value="${employment.employment_id}" 
				    	onclick="showemployment(${employment.employment_id})">
				    	<p align="left" style="float:left;">${employment.employment_title}</p>
				    	<p align="right" style="float:right;"><fmt:formatDate pattern ="yyyy년MM월dd일 까지" value="${employment.employment_time}"/></p>
				    </li>
				    <form id="frm${employment.employment_id}">
				    	<input type="hidden" 
				    	value="${employment.employment_id}" 
				    	name="employment_id">
				    </form>
				    </c:forEach>
				  </ul>
			</div>
		</div>
		<!-- 실제소스 끝 -->
	</div>
</div>
<script>
	//게시글을 누르면 셀렉트 되서 상세 내용 보기로 간다 슝슝
	function showemployment(employment_id){
		alert(employment_id);
		var emp_id =employment_id;
		var frm = document.getElementById("frm"+emp_id);
			 frm.action = "employmentsDetailsforCom.do";
			 frm.method = "post";
			 frm.submit();
			}
	

</script>