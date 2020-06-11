<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- !PAGE CONTENT! -->
<!-- !기업회원에게 매칭해서 자기소개영상띄워주는 페이지! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px"></div>

  
 <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
  <c:forEach var="matched" items="${matched }">
    <div class="w3-quarter">
    	<img src="${pageContext.request.contextPath}/resources/img/common/${matched.video_img }" 
     	  alt="thumnail" style="width:100%;">
   		<button id="btn${matched.video_id }" 
   				name="likeBtn" 
   				value="${matched.video_id}" type="button"
   				onclick="clickLike(${matched.video_id})">
   			<font color="green"><i class="fas fa-heart"></i></font>
   		</button>
		<h3>#${matched.code_name }</h3>
      	<p>${matched.video_contents }</p>
    </div>
  </c:forEach>
  </div>
<!-- Grid END -->
  

 <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">더보기</a>
    </div>
  </div>

  
  <hr id="about">


<form id="frm" name="frm">
	<input type="hidden" id="hid">
</form>
  
<script>
	//좋아요 버튼 클릭하면 인설트된다.
	function clickLike(vid){
		var clickedBtn = document.getElementById("btn"+vid);
		//좋아요 클릭된버튼의 아이디 찾음.
		var clickedBtnValue = clickedBtn.value;
		//그 버튼에 붙은 비디오아이디 값을 받아서 clickedBtnValue에 넣음.
		hid.setAttribute('vid', clickedBtnValue);
		frm.action ='companyLikeVideo.do';
		frm.submit();
		
	}
</script>
