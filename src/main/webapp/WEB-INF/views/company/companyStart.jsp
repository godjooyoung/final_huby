<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- !PAGE CONTENT! -->
<!-- !기업회원에게 매칭해서 자기소개영상띄워주는 페이지! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px"></div>

  
 <!-- First Photo Grid-->
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
  <c:forEach var="matched" items="${matched }">
    <div class="w3-quarter">
    	<img src="${pageContext.request.contextPath}/resources/img/common/${matched.video_img }" 
     	  alt="thumnail" style="width:100%;">
   		<button class="w3-button w3-padding-small w3-xlarge"
   				id="btn${matched.video_id }" 
   				name="likeBtn" 
   				value="${matched.video_id}" type="button"
   				onclick="clickLike(${matched.video_id})">
   			<font id="font${matched.video_id }" color=black ><b><i class="fas fa-heart"></i></b></font>
   		</button>
		<h3>#${matched.code_name }</h3>
      	<p>${matched.video_contents }</p>
    </div>
  </c:forEach>
  </div>
<!-- Grid END -->
<!-- test -->
<button type="button" onclick="location.href='companyEmploymentsList.do'">기업에 지원한 인간들 목록 테스트</button>

  

 <!-- Pagination -->
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a href="#" class="w3-bar-item w3-button w3-hover-black">더보기</a>
    </div>
  </div>

  
  <hr id="about">


<script>
	//좋아요 버튼 클릭하면 하트 색이 바뀌고 버튼의 벨류가 넘어가서 인설트된다.
	function clickLike(video_id){
		var heartid = "font"+video_id;
		var viedoid = "btn"+video_id;
		document.getElementById(heartid).color="red"
		var vid= document.getElementById(viedoid).value;
		
		$.ajax({
			type:"get",
			url:"companyLikeVideo.do",
			data : {'video_id': vid },
			success: function(){
				
			},
			error: function(){
			  alert("에러 발생. 관리자에게 문의주세요.");
			}
		})
		
		
	}
</script>
