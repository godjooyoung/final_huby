<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	
<script>
	function applyinfoall(cid, eid){
		$("#company_id").val(cid);
		$("#employment_id").val(eid);
		alert(eid+"번째 공고입니다.");
		$("#frm").attr("action","applyinfoall.do");
		document.frm.submit();
	} 	
</script>
<style>
#cominfotitle {
	vertical-align: middle;
	font-family: sans-serif;
	font-size: large;
	color: #B8860B;
}

#cominfoth {
	vertical-align: middle;
	border-bottom: solid 1px;
}

#cominfotd {
	vertical-align: middle;
	border-bottom: solid 1px;
}

#cominfobtn {
	vertical-align: middle;
}
</style>
<style>
.pinkBg {
    background-image: linear-gradient(90deg, #fd5581, #fd8b55);
}
.btns{
    height:60px;
    width:60px;
    position:fixed;
    vertical-align: middle;
    top:45%;
    left:90%;
    text-align:justify;
    margin:-30px 0 0 -30px;
    border-radius:100px;
    z-index:1;
    font-size: middle;
    font-weight: bolder;
    color: white;
}
.btns .ripple{
    position:fixed;
    width:160px;
    height:160px;
    z-index:-1;
    left:90%;
    top:45%;
    opacity:0;
    margin:-80px 0 0 -80px;
    border-radius:100px;
    -webkit-animation:ripple 1.8s infinite;
    animation:ripple 1.8s infinite
}
.btns .ripple:nth-child(2){
    animation-delay:.3s;
    -webkit-animation-delay:.3s
}
.btns .ripple:nth-child(3){
    animation-delay:.6s;
    -webkit-animation-delay:.6s
}

@-webkit-keyframes ripple{
    0%{
        opacity:1;
        -webkit-transform:scale(0);
        transform:scale(0)
    }
    100%{
        opacity:0;
        -webkit-transform:scale(1);
        transform:scale(1)
    }
}
@keyframes ripple{
    0%{
        opacity:1;
        -webkit-transform:scale(0);
        transform:scale(0)
    }
    100%{
        opacity:0;
        -webkit-transform:scale(1);
        transform:scale(1)
    }
}
</style>
<form id="frm" name="frm" method="post">
<br><br><br><br><br>
	<div id="sub_vis_wrap" class="sub01 page01">
		<div class="hd_box"></div>
		<div class="visual-area ">
			<div class="visual-area-in">
				<div class="visual-area-txt inner sub01 ">
					<div class="tit" data-aos="fade-up" data-aos-delay="300">공고
						상세내용</div>
					<p class="fs18" data-aos="fade-up" data-aos-delay="400">
						시간을 허비말고 DO HUBY!<br> 공고의 상세 내용을 확인하세요.
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
			<div class="w3-margin-bottom"
				style="background-color: #134a8e;">
				<div style="vertical-align: middle;">
					&nbsp;
					<h3 style="color: white; margin-bottom: 5px;">${ empMatch.EMPLOYMENT_TITLE }</h3>
					<h5 style="color: white; margin-bottom:20px; padding-bottom:20px;">
						<fmt:formatDate pattern="yyyy년MM월dd일 까지"
							value="${ empMatch.EMPLOYMENT_TIME }" />
					</h5>
				</div>
			</div>
			<!-- title 끝 -->
			<div class="w3-row-padding ">
				<!-- 내용부분 -->
				<div class="w3-twothird">
					<h2>공고내용</h2>
					<div>
					<pre>${ empMatch.EMPLOYMENT_CONTENTS }</pre>
					</div>
					<h2>우대사항</h2>
					<div>
					<pre>${ empMatch.EMPLOYMENT_PREFER }</pre>
					</div>
				</div>
				<!-- 내용부분끝 -->
				<!-- 오른쪽 테이블들 -->
				<div class="w3-third">
					<table class="w3-table w3-bordered w3-border">
						<thead class="w3" style="background-color: #1a56a1;">
							<h3>지원자격</h3>
						</thead>
						<tr>
							<th style="width: 50%">경력</th>
							<th style="width: 50%">학력</th>
						</tr>
						<tr>
							<td style="width: 50%">${ empMatch.HOPE_CAREER }</td>
							<td style="width: 50%">${ empMatch.HOPE_GRADUATE }</td>
						</tr>
					</table>


					<table class="w3-table w3-bordered w3-border">
						<thead class="w3-blue">
							&nbsp;
							<h3>근무조건</h3>
						</thead>
						<tr>
							<th style="width: 50%">임금</th>
							<th style="width: 50%">근무지역</th>
						</tr>
						<tr>
							<td style="width: 50%">${empMatch.HOPE_SALARY}</td>
							<td style="width: 50%">${empMatch.HOPE_LOCATION}</td>
						</tr>
					</table>


					<table class="w3-table w3-bordered w3-border">
						<thead class="w3-teal">
							&nbsp;
							<h3>모집형태</h3>
						</thead>
						<tr>
							<th style="width: 33%">고용형태</th>
							<th style="width: 33%">모집직종</th>
							<th style="width: 33%">근무포지션</th>
						</tr>
						<tr>
							<td style="width: 33%">${empMatch.HOPE_WORK_TYPE}</td>
							<td style="width: 33%">${empMatch.JOB_NAME}</td>
							<td style="width: 33%">${empMatch.HOPE_JOB_POSITION}</td>
						</tr>
					</table>
				</div>
				<!-- 테이블 끝 -->
			</div>
			<br> <br> <br>
			<!-- 타이틀아래 -->


			<!-- 회사정보 시작 -->
			<div>
				<table class="w3-table" style="border-left: none;">
					<%-- <tr>
  					<td id="cominfologo" rowspan="8" colspan="2">
  					<img style="width: 30%;" src="${pageContext.request.contextPath}/resources/FileUpload/${ empMatch.COMPANY_PHOTO }">
  					</td>
  				</tr> --%>
					<tr>
						<td colspan="1" id="cominfotitle"
							style="width: 15%; border-left: none;"></td>
						<th colspan="2" id="cominfotitle" style="width: 35%">
						<c:if test="${not empty empMatch.COMPANY_PHOTO }">
							<img style="width: 30%;" src="${pageContext.request.contextPath}/resources/FileUpload/${ empMatch.COMPANY_PHOTO }">
						</c:if>
						${empMatch.COMPANY_NAME}</th>
						<td colspan="1" id="cominfobtn" style="width: 15%">
							
								<!-- <a href="resumemanagement.do" class="pinkBg btns">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스크랩
									<span class="ripple pinkBg"></span> 
									<span class="ripple pinkBg"></span>
									<span class="ripple pinkBg"></span>
									<span class="ripple pinkBg"></span>
								</a> -->
								
								<button type="button" onclick="click_like_btn(event, '${ empMatch.EMPLOYMENT_ID }')" 
									class="pinkBg btns">스크랩
									<span class="ripple pinkBg"></span> 
									<span class="ripple pinkBg"></span>
									<span class="ripple pinkBg"></span>
									<span class="ripple pinkBg"></span>
								</button>
						</td>
						<td colspan="1" id="cominfobtn" style="width: 15%"></td>
					</tr>
					<tr>
						<th colspan="1" id="cominfoth">직종</th>
						<td colspan="2" id="cominfotd">${empMatch.JOB_NAME}</td>
						<th id="cominfoth">전화번호</th>
						<td id="cominfotd">${empMatch.COMPANY_TEL}</td>
					</tr>
					<tr>
						<th id="cominfoth">카테고리</th>
						<td colspan="2" id="cominfotd">${empMatch.BUSINESS_CATEGORY}</td>
						<th id="cominfoth">매출액</th>
						<td id="cominfotd">${empMatch.COMPANY_SALES}</td>
					</tr>
					<tr>
						<th id="cominfoth">홈페이지</th>
						<td colspan="2" id="cominfotd">${empMatch.HOMEPAGE}</td>
						<fmt:formatDate value="${empMatch.COMPANY_BIRTH}"
							pattern="yyyy-MM-dd" var="company_birth" />
						<th id="cominfoth">설립일</th>
						<td id="cominfotd">${company_birth}</td>
					</tr>
					<tr>
						<th id="cominfoth">이메일</th>
						<td colspan="2" id="cominfotd">${empMatch.COMPANY_EMAIL}</td>
						<th id="cominfoth">대표</th>
						<td id="cominfotd">${empMatch.CEO_NAME}</td>
					</tr>
					<tr>
						<th id="cominfoth">회사주소</th>
						<td id="cominfotd" colspan="4">${empMatch.COMPANY_ADDR}</td>
					</tr>
				</table>
			</div>
			<br>
			<!-- 회사정보 끝 -->

			<!-- 지원하기 버튼  시작 -->
			<div align="center">
				<c:set var="complete_state" value="${ empMatch.COMPLETE }" />
				<c:choose>
					<c:when test="${complete_state == 'N'}">
						<button class="btn btn-primary" type="button"
							style="height: 50px; size: 50px;"
							onclick="applyinfoall('${empMatch.company_id}','${empMatch.employment_id}')">지원하기</button>
					</c:when>
					<c:when test="${complete_state == 'Y'}">
						<button class="btn btn-secondary" type="button"
							style="height: 50px; size: 50px;" onclick="#">채용마감</button>
					</c:when>
				</c:choose>
				<!-- 지원하기 버튼  끝 -->
			</div>
			<br>
			<!-- END -->
		</div>
	</div>

	<input type="hidden" id="company_id" name="company_id"> <input
		type="hidden" id="employment_id" name="employment_id">
</form>
<script>
//스크립버튼
	function click_like_btn(e, empid){
		alert(empid)
		var emp_id=empid;
		$.ajax({
			
			type : "get",
			url : "insert_to_employment_like.do",
			data : {"employment_id" : emp_id},
			//dataType : 'json',
			success : function() {
				alert("해당 공고가 스크랩 되었습니다. 스크랩관리에 가서 메모를 추가하세요");
			},
			error : function() {
				alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end OF AJAX

	}//END OF click_like_btn
</script>