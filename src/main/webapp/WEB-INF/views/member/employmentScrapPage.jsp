<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300"> 관심 채용 공고</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					시간을 허비말고 DO HUBY<br>
					관심 채용 공고입니다. 관심있는 공고만 모아보세요.
				</p>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit">
			
		</div>

		<ul class="sub_menu_box sub01">
			
			<li class="m1"><a href="employmentList.do">전체채용공고</a></li>
			<li class="m2"><a href="empMatch.do">맞춤채용공고</a></li>
			<li class="m3"><a href="load_employment_like_list.do">관심채용공고</a></li>
		</ul>
	</div>
</div>

<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 2%;">
<!-- ---------------------------- -->
<div class="container" style="padding-right: 0px; padding-left: 0px;">
	<div class="w3-row-padding">
		<c:forEach var="empLikeList" items="${empLikeList}">
			<div class="w3-quarter w3-margin-bottom">
			  <ul class="w3-ul w3-border w3-center w3-hover w3-hoverable">
			    <li class="w3-padding-16" style="background-color:#134a8e; color:white;"><p style=" overflow: hidden;
																	text-overflow: ellipsis;
																	white-space: nowrap;
																	width: 200px;
																	margin: 0px 0px 0px">${empLikeList.EMPLOYMENT_TITLE}</p></li>
			    <li class="w3-padding"><span class="w3-opacity">${empLikeList.EMPLOYMENT_DATE}</span></li>
			    <li class="w3-padding"><b>${empLikeList.COMPANY_NAME}</b></li>
			    <li class="w3-padding">${empLikeList.CODE_NAME}</li>
			    <li class="w3-padding">${empLikeList.HOPE_WORK_TYPE}</li>
			    <li class="w3-padding"><b>공고 기간</b> 2020년22월22까지</li>
					<c:set var="memo" value='${empLikeList.EMPLOYMENT_LIKE_MEMO}'/>
		    			<c:choose>
							<c:when test="${memo eq null}">
								<li class="w3-padding">
									<p class="w3-opacity" style=" overflow: hidden;
																	text-overflow: ellipsis;
																	white-space: nowrap;
																	width: 200px;
																	margin: 0px 0px 0px;
																	">
										메모를 작성해주세요.
									</p>
								</li>
								<li class="w3-light-grey w3-padding-8">
				      				<button class="w3-button w3-gree"
				      					onclick="document.getElementById('modal${empLikeList.EMPLOYMENT_LIKE_ID}').style.display='block'">
				     	 				메모작성
				      				</button>
				      				<button class="w3-button w3-gree"
											onclick="scrapDelete(event,${empLikeList.EMPLOYMENT_LIKE_ID})">
			      						스크랩삭제
			      					</button>
			      				</li>
			      				<!-- 작성모달 -->
			      				<div id="modal${empLikeList.EMPLOYMENT_LIKE_ID}" class="w3-modal">
									<div class="w3-modal-content">
									<div>
										<br> 
											<span
												onclick="modalOff(event,${empLikeList.EMPLOYMENT_LIKE_ID})"
												class="w3-button w3-display-topright">&times;</span>
												<p>메모를 작성하면 스크랩 관리가 쉬워집니다.</p>
												<form action="write_memo_for_Scrap.do" id="memofrm" name="memofrm">
												<input type="text"
												id="writememo${empLikeList.EMPLOYMENT_LIKE_ID}" value=""
												name="memotext">
												<input type="hidden" value="${empLikeList.EMPLOYMENT_LIKE_ID}" name="likeid">
												<input type="submit" value="작성완료">
											</form>
											<br>
									</div>
								</div>
						 		</div>
			      				<!-- 작성모달 -->
			      			
							</c:when>
							
							<c:when test="${memo != null}">
								<li class="w3-padding">
									<p class="w3-opacity" style=" overflow: hidden;
																	text-overflow: ellipsis;
																	white-space: nowrap;
																	width: 200px;
																	margin: 0px 0px 0px;">
										${empLikeList.EMPLOYMENT_LIKE_MEMO}
									</p>
								</li>
								<li class="w3-light-grey w3-padding-8">
				      				<button class="w3-button w3-gree"
				      						onclick="document.getElementById('modal${empLikeList.EMPLOYMENT_LIKE_ID}').style.display='block'">
				     	 				메모수정
				      				</button>
				      				<button class="w3-button w3-gree"
											onclick="scrapDelete(event,${empLikeList.EMPLOYMENT_LIKE_ID})">
			      						스크랩삭제
			      					</button>
			      				</li>
			      				<!-- 수정모달 -->
			      				<div id="modal${empLikeList.EMPLOYMENT_LIKE_ID}" class="w3-modal">
								<div class="w3-modal-content">
									<div>
										<br> <span
											onclick="modalOff(event,${empLikeList.EMPLOYMENT_LIKE_ID})"
											class="w3-button w3-display-topright">&times;</span>
										<p>메모를 수정하시나요?</p>
										<form action="write_memo_for_Scrap.do" id="memofrm" name="memofrm">
											<input type="text"
												id="writememo${empLikeList.EMPLOYMENT_LIKE_ID}" value="${empLikeList.EMPLOYMENT_LIKE_MEMO}"
												name="memotext">
											<input type="hidden" value="${empLikeList.EMPLOYMENT_LIKE_ID}" name="likeid">
											<input type="submit" value="작성완료">
										</form>
										<br>
									</div>
								</div>
								</div>
			      				<!-- 수정모달 -->
							</c:when>
						</c:choose>
					</ul>
			   </div>		
		</c:forEach>
	</div>
</div>
<!-- ---------------------------- -->
</div>
</div>
<form action="delete_from_employment_like.do" name="scrapdeletfrm" id="scrapdeletfrm">
<input type="hidden" value="" name="sid" id="inputsid">
</form>
<script>
function modalOff(e, sid){
	var scrap_id = sid;
	var modal_id = "modal"+ scrap_id;
	document.getElementById(modal_id).style.display='none'
	
}

function scrapDelete(e, sid){
	var scrap_id = sid;
	alert("스크랩목록에서 삭제했습니다.");
	  document.getElementById("inputsid").value=scrap_id;
	  document.scrapdeletfrm.action = "delete_from_employment_like.do";
	  document.scrapdeletfrm.method = "post";
	  document.scrapdeletfrm.submit();
}
</script>