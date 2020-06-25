<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>


<div class="w3-container">
  <h1>개인회원 스크랩 공고 목록</h1>
  <p>메세지를 추가해서 보다 편하게 관리하세요.</p>
  <ul class="w3-ul w3-hoverable">
    <c:forEach var="empLikeList" items="${empLikeList}">
    <li><strong>스크랩날짜 </strong>${empLikeList.EMPLOYMENT_DATE}
    	<br>
    	<strong> ${empLikeList.COMPANY_NAME} </strong>
    	<br>
    	<strong> 공고제목 </strong>${empLikeList.EMPLOYMENT_TITLE}
    	<br>
    	<strong> 직종분류 </strong>${empLikeList.CODE_NAME}
    	<br>
    	<strong> 근무형태 </strong>${empLikeList.HOPE_WORK_TYPE}
    	<br>
    	<strong> 공고기간 </strong>${empLikeList.EMPLOYMENT_TIME}
    	<br>
    	<strong> 메모 </strong>
    		<c:set var="memo" value='${empLikeList.EMPLOYMENT_LIKE_MEMO}' />
    			<c:choose>
				<c:when test="${memo eq null}">
					<div>
					<i>메모를 작성해주세요.</i>
					<button onclick="document.getElementById('modal${empLikeList.EMPLOYMENT_LIKE_ID}').style.display='block'"
							class="w3-button w3-block w3-aqua">
					메모 작성
					</button>
					<button onclick="scrapDelete()"
							class="w3-button w3-block w3-black">
					스크랩 취소
					</button>
					<!-- 모달창1 -->
						<div id="modal${empLikeList.EMPLOYMENT_LIKE_ID}" class="w3-modal">
							<div class="w3-modal-content">
								<div class="w3-container">
									<br> <span
											onclick="document.getElementById('id01').style.display='none'"
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
						 <!-- 모달창1 END-->
					</div>
				</c:when>
				
				<c:when test="${memo != null}">
					<div>
					<i>${empLikeList.EMPLOYMENT_LIKE_MEMO}</i>
					<button onclick="document.getElementById('modal${empLikeList.EMPLOYMENT_LIKE_ID}').style.display='block'" class="w3-button w3-block w3-blue">
					메모 수정
					</button>
					<button onclick="scrapDelete(event, ${empLikeList.EMPLOYMENT_LIKE_ID})"
							class="w3-button w3-block w3-black">
					스크랩 취소
					</button>
							<!-- 모달창2 -->
							<div id="modal${empLikeList.EMPLOYMENT_LIKE_ID}" class="w3-modal">
								<div class="w3-modal-content">
									<div class="w3-container">
										<br> <span
											onclick="document.getElementById('id02').style.display='none'"
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
							<!-- 모달창2 END -->
					</div>
				</c:when>
				</c:choose>
   		</li>
    </c:forEach>
  </ul>
 
</div>
<form action="delete_from_employment_like.do" name="scrapdeletfrm" id="scrapdeletfrm">
<input type="hidden" value="" name="sid" id="inputsid">
</form>
<script>
function scrapDelete(e, sid){
	var scrap_id = sid;
	alert("취소버튼 정상 클리끗ㅎ");

	document.getElementById("inputsid").value=scrap_id;
	  document.scrapdeletfrm.action = "delete_from_employment_like.do";
	  document.scrapdeletfrm.method = "post";
	  document.scrapdeletfrm.submit();
}
</script>