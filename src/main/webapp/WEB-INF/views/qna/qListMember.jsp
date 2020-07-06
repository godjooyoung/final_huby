<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lightbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontastic.css">
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300">문의사항</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">무엇이든
					물어보세요</p>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit"></div>
		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="qInsertPageM.do">문의하기</a></li>
		</ul>
	</div>
</div>

<section>
	<div id="sub_content_wrap" class="sub0101">
		<div class="ov inner center" style="margin: 3% auto 3%;"></div>
		<div class="container" style="max-width: 1229px;">
			<!-- wordPress installation-->
			<header class="section header mb-5">
				<h2></h2>
				<p class="lead">나의 문의 내역</p>
			</header>
			<div class="row">
				<div class="col-lg-8">
					<div id="accordion" class="faq accordion accordion-custom pb-5">
						<!-- question        -->
						<div class="card">
							<c:forEach var="list" items="${qList}" varStatus="sts">
								<div id="headingTwo${ sts.index }" class="card-header">
									<h4 class="mb-0 accordion-heading">
										<button data-toggle="collapse" data-target="#collapseTwo${ sts.index }"
											aria-expanded="false" aria-controls="collapseTwo" class="d-flex align-items-center collapsed">
											<i class="icon-plug"></i><span>${list.Q_TITLE }</span>
										</button>
									</h4>
								</div>
								<div id="collapseTwo${ sts.index }" aria-labelledby="headingTwo" data-parent="#accordion" class="collapse">
									<div class="card-body">문의 내용 : ${ list.Q_CONTENTS }</div>
									<c:choose>
										<c:when test="${list.Q_ANSWER == null}">
											<div class="card-body">답변이 없습니다.</div>
										</c:when>
										<c:otherwise>
											<div class="card-body">운영자의 답변 : ${list.Q_ANSWER}</div>
										</c:otherwise>
									</c:choose>
								</div>
							</c:forEach>
						</div>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>