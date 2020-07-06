<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300">공고목록</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					허빟<br>공고목록
				</p>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit">
		</div>

		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="employmentList.do">전체채용공고</a></li>
			<li class="m2"><a href="employmentMatch.do">맞춤채용공고</a></li>
			<li class="m3"><a href="load_employment_like_list.do">관심채용공고</a></li>
		</ul>
	</div>
</div>

<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 5%;">
		<div class="sub0101_tit">여긴공고전체 보</div>

		<div class="sub0101_con">
			<div class="w3-container">
				<h2>공고리스트</h2>
				<div>
					<select class="form-control input-md" id="location"
						name="hope_location" onchange="locationcheck(this.value)">
						<option value="">지역 선택</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="경기">경기</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="강원">강원</option>
						<option value="경남">경남</option>
						<option value="경북">경북</option>
						<option value="전남">전남</option>
						<option value="전북">전북</option>
						<option value="충남">충남</option>
						<option value="충북">충북</option>
						<option value="제주">제주</option>
						<option value="강원.">강원</option>
						<option value="전국">전국</option>
					</select>

					<!-- 스크립트 -->
					<script>
						$("#location").val("${param.hope_location}");
					</script>

				</div>
				<div>
					<select class="form-control input-md" id="job" name="hope_job"
						onchange="jobcheck(this.value)">
						<option value="">직업 선택</option>
						<c:forEach items="${typeVo}" var="type">
							<option value="${ type.code_id }">${ type.code_name }</option>
						</c:forEach>
					</select>
					<!-- 스크립트 -->
					<script>
						$("#job").val("${param.hope_job}");
					</script>
					</form>
					<!-- 공고 리스트 BODY -->
				</div>
				<c:forEach var="elist" items="${elist}">
					<ul class="w3-ul w3-card-4">
						<li class="w3-bar"><img src="img_avatar2.png"
							class="w3-bar-item w3-circle w3-hide-small" style="width: 85px">
							<div class="w3-bar-item">
								<a onclick="empDetail(event,'${elist.EMPLOYMENT_ID}')"> <span
									class="w3-large">${elist.EMPLOYMENT_TITLE}</span></a><br> <span>${elist.HOPE_JOB_POSITION}</span>
							</div></li>
					</ul>
					<ul class="nav nav-pills flex-column"
						id="emp${elist.EMPLOYMENT_ID}">
					</ul>
					<br>
					<form id="empfrmforapply${elist.EMPLOYMENT_ID}"
						action="applyinfoall.do" method="POST" name="empfrm">
						<input type="hidden" id="empidInput${elist.EMPLOYMENT_ID}"
							value="${elist.EMPLOYMENT_ID}" name="empid">
					</form>
				</c:forEach>

			</div>
			<!-- 공고 리스트 end -->
		</div>
		<!-- 상단바 end -->

	</div>
</div>
<!-- 스크립트 -->
<script>
	function locationcheck(selected) {
		document.frm.submit();
	}

	function jobcheck(selected) {
		document.frm.submit();
	}

	function openCity(evt, cityName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("city");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < x.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(
					" w3-border-red", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.firstElementChild.className += " w3-border-red";
	}
</script>

<!-- 스크립트 -->
<script>
	function empDetail(e, empid) {
		var closeBtn = '<span onclick="this.parentElement.style.display=\'none\'" class="w3-bar-item w3-button w3-white w3-xlarge w3-right">×</span>';
		var place = document.getElementById("emp" + empid);
		var plusLi = document.createElement('li');
		var yesOrNo="";
		$
				.ajax({
					type : "get",
					url : "empDetaleList.do",
					data : {
						'empno' : empid
					},
					dataType : 'json',
					success : function(data) {
						console.log(data[0]);
						$(place).empty();
						$.each( data,
									 function(idx, item) {
											yesOrNo = item.COMPLETE;
											if (yesOrNo == 'Y'){
												$('<li>').html(
														"공고제목:"
																+ item.EMPLOYMENT_TITLE
																+ "<br>"
																+ "직급:"
																+ item.HOPE_JOB_POSITION
																+ "<br>"
																+ closeBtn
																+ "지역:"
																+ item.HOPE_LOCATION
																+ "<br>"
																+ "내용:"
																+ item.EMPLOYMENT_CONTENTS
																+ "<br>"
																+ item.HOPE_WORK_TYPE
																+ "<b>"
																+ item.EMPLOYMENT_ID
																+ "<br>"
																+ "<input type=\"button\" value=\"공고 마감된 공고입니다.\">"
																+ "<br><input type=\"button\" value=\"스크랩하기\"  onClick=\"click_like_btn(event,"
																+ item.EMPLOYMENT_ID
																+ ")\">")

												.appendTo(place);
												
											}else if (yesOrNo =='N'){
												$('<li>').html(
														"공고제목:"
																+ item.EMPLOYMENT_TITLE
																+ "<br>"
																+ "직급:"
																+ item.HOPE_JOB_POSITION
																+ "<br>"
																+ closeBtn
																+ "지역:"
																+ item.HOPE_LOCATION
																+ "<br>"
																+ "내용:"
																+ item.EMPLOYMENT_CONTENTS
																+ "<br>"
																+ item.HOPE_WORK_TYPE
																+ "<b>"
																+ item.EMPLOYMENT_ID
																+ "<br>"
																+ "<input type=\"button\" value=\"지원하기\" onClick=\"go_apply_page(event,"
																+ item.EMPLOYMENT_ID
																+ ")\">"
																+ "<br><input type=\"button\" value=\"스크랩하기\"  onClick=\"click_like_btn(event,"
																+ item.EMPLOYMENT_ID
																+ ")\">")

												.appendTo(place);
												}//end if
											
										});//each

					},

					error : function() {
						alert("에러 발생. 관리자에게 문의주세요.");
					}
				})//end OF AJAX

	};

	//좋아요 버튼 스크립트
	function click_like_btn(e, empid) {
		alert(empid)
		var emp_id = empid;
		$.ajax({

			type : "get",
			url : "insert_to_employment_like.do",
			data : {
				"employment_id" : emp_id
			},
			//dataType : 'json',
			success : function() {
				alert("해당 공고가 스크랩 되었습니다. 스크랩관리에 가서 메모를 추가하세요");
			},
			error : function() {
				alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end OF AJAX

	};//END OF click_like_btn

	function go_apply_page(e, empid) {
		alert(empid)
		var emp_id = empid;
		var formTag = "empfrmforapply" + emp_id;
		//document.getElementById(formTag).action="applyinfoall.do";
		//document.getElementById(formTag).method="post";
		document.getElementById(formTag).submit();

		//applyinfoall.do'\">"
	};//go_apply_page
</script>
