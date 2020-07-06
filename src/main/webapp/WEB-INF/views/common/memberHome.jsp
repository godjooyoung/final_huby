<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 개인회원 시작페이지에서 채용공고 보여줌 -->
<br>
<br>
<br>
<br><br>
<style>
@import
	url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css')
	;

/* #team {
	background: #eee !important;
} */
.btn-primary:hover, .btn-primary:focus {
	background-color: #108d6f;
	border-color: #108d6f;
	box-shadow: none;
	outline: none;
}

.btn-primary {
	color: #fff;
	background-color: #0b68e3;
	border-color: #0b68e3;
}

section {
	padding: 60px 0;
}

section .section-title {
	text-align: center;
	color: #0b68e3;
	margin-bottom: 50px;
	text-transform: uppercase;
}

#team .card {
	border: none;
	background: #ffffff;
}

.image-flip:hover .backside, .image-flip.hover .backside {
	-webkit-transform: rotateY(0deg);
	-moz-transform: rotateY(0deg);
	-o-transform: rotateY(0deg);
	-ms-transform: rotateY(0deg);
	transform: rotateY(0deg);
	border-radius: .25rem;
}

.image-flip:hover .frontside, .image-flip.hover .frontside {
	-webkit-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	transform: rotateY(180deg);
}

.mainflip {
	-webkit-transition: 1s;
	-webkit-transform-style: preserve-3d;
	-ms-transition: 1s;
	-moz-transition: 1s;
	-moz-transform: perspective(1000px);
	-moz-transform-style: preserve-3d;
	-ms-transform-style: preserve-3d;
	transition: 1s;
	transform-style: preserve-3d;
	position: relative;
}

.frontside {
	position: relative;
	-webkit-transform: rotateY(0deg);
	-ms-transform: rotateY(0deg);
	z-index: 2;
	margin-bottom: 30px;
}

.backside {
	position: absolute;
	top: 0;
	left: 0;
	background: white;
	-webkit-transform: rotateY(-180deg);
	-moz-transform: rotateY(-180deg);
	-o-transform: rotateY(-180deg);
	-ms-transform: rotateY(-180deg);
	transform: rotateY(-180deg);
	-webkit-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
	-moz-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
	box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
}
.backside{width:100%}
.frontside, .backside {
	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	backface-visibility: hidden;
	-webkit-transition: 1s;
	-webkit-transform-style: preserve-3d;
	-moz-transition: 1s;
	-moz-transform-style: preserve-3d;
	-o-transition: 1s;
	-o-transform-style: preserve-3d;
	-ms-transition: 1s;
	-ms-transform-style: preserve-3d;
	transition: 1s;
	transform-style: preserve-3d;
}

.frontside .card, .backside .card {
	min-height: 312px;
}

.backside .card a {
	font-size: 18px;
	color: #0b68e3 !important;
}

.frontside .card .card-title, .backside .card .card-title {
	color: #0b68e3 !important;
}

.frontside .card .card-body img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
}
</style>
<script>
	function selectemployment(cid, eid) {
		$("#company_id").val(cid);
		$("#employment_id").val(eid);
		$("#frm").attr("action", "selectresumepage.do");
		document.frm.submit();
	}
</script>
<script>
	if('${error}' == 'error'){
		alert("이미 지원한 공고입니다.");
	}
</script>
<!-- Team -->
<div class="w3-container">
<form id="frm" name="frm" method="post">
	<section id="team" class="pb-5">
		<div class="row">
			<c:choose>
				<c:when test="${!empty empMatch}">
					<c:forEach var="empMatch" items="${empMatch}">
						<div class="col-xs-12 col-sm-6 col-md-2">
							<div class="container">

								<!-- front -->
								<div class="image-flip"
									ontouchstart="this.classList.toggle('hover');">
									<div class="mainflip flip-0">
										<div class="frontside">
											<div class="card">
												<div class="card-body text-center">
													<p><img class=" img-fluid" src="${pageContext.request.contextPath}/resources/FileUpload/${empMatch.company_photo}"
															alt="card image"></p>
													<h4 class="card-title">${empMatch.company_name}</h4>
													<p class="card-text">${empMatch.employment_title}</p>
			
												</div>
											</div>
										</div>
										<div class="backside">
											<div class="card">
												<div class="card-body text-center mt-4" onclick='selectemployment("${ empMatch.company_id }","${ empMatch.employment_id }")'>
													<h4 class="card-title">${empMatch.company_name}</h4>
													<p class="card-text">${empMatch.employment_contents}</p>
													
												</div>
												<a href="javascript:void(0)" onclick="click_like_btn(event, '${ empMatch.employment_id }')"
														class="btn btn-primary btn-sm" "><font style="color:white;">스크랩하기</font></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</section>
	<input type="hidden" id="company_id" name="company_id"> <input
		type="hidden" id="employment_id" name="employment_id">
</form>
<script>
//스크립버튼
	function click_like_btn(e, empid){
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
<!-- Pagination -->
<!--<div class="w3-center w3-padding-32">
	<div class="w3-bar">
		<a href="#" class="w3-bar-item w3-button w3-hover-black">뒤로</a> <a
			href="#" class="w3-bar-item w3-black w3-button">1</a> <a href="#"
			class="w3-bar-item w3-button w3-hover-black">2</a> <a href="#"
			class="w3-bar-item w3-button w3-hover-black">3</a> <a href="#"
			class="w3-bar-item w3-button w3-hover-black">4</a> <a href="#"
			class="w3-bar-item w3-button w3-hover-black">앞으로</a>
	</div>
</div> -->
</div>	