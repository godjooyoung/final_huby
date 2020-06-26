<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- FAQ Section-->
<br>
<br>
<section>
	<div class="container">
		<input type="button" value="문의하기">
		<!-- wordPress installation-->
		<header class="section header mb-5">
			<br> <br>
			<h2>나의 문의내용</h2>
			<p class="lead">문의사항있으세요벫레레레레레레</p>
		</header>
		<div class="row">
			<div class="col-lg-8">
				<div id="accordion" class="faq accordion accordion-custom pb-5">
					<!-- question        -->
					<div class="card">
						<c:forEach var="list" items="${qList}">
							<div id="headingTwo" class="card-header">
								<h4 class="mb-0 accordion-heading">
									<button data-toggle="collapse" data-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseTwo"
										class="d-flex align-items-center collapsed">
										<i class="icon-plug"></i><span>${list.Q_TITLE }</span>
									</button>
								</h4>
							</div>
							<div id="collapseTwo" aria-labelledby="headingTwo"
								data-parent="#accordion" class="collapse">
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
					<!-- question-->
					<div class="card">
						<div id="headingThree" class="card-header">
							<h4 class="mb-0 accordion-heading">
								<button data-toggle="collapse" data-target="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree"
									class="d-flex align-items-center collapsed">
									<i class="icon-shield-settings"></i><span>Food truck
										quinoa nesciunt laborum?</span>
								</button>
							</h4>
						</div>
						<div id="collapseThree" aria-labelledby="headingThree"
							data-parent="#accordion" class="collapse">
							<div class="card-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>