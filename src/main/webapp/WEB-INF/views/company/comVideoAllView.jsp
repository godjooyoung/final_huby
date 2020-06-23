<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- !PAGE CONTENT! -->
<!-- !영상 전체 보여주는 페이지! -->
<div class="w3-main w3-content w3-padding"
	style="max-width: 1200px; margin-top: 100px"></div>


<!-- First Photo Grid-->
<div class="w3-row-padding w3-padding-16 w3-center" id="food">
	<c:forEach var="allList" items="${allList}">
		<div class="w3-quarter">
			<img src="${pageContext.request.contextPath}/resources/img/common/${allList.video_img }"
				alt="thumnail" style="width: 100%;" onclick="location.href='resumeDetail.do?video_id=${allList.video_id}&member_id=${matched.member_id }'">
			<button class="w3-button w3-padding-small w3-xlarge"
				id="btn${allList.video_id }" name="likeBtn"
				value="${allList.video_id}" type="button"
				onclick="clickLike(${allList.video_id})">
				<font id="font${allList.video_id }" color="black" data-count="0">
					<b>
						<i class="fas fa-heart"></i>
					</b>
				</font>
			</button>
			<h3>#${allList.code_name }</h3>
			<p>${allList.video_contents }</p>
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


<script>
	//좋아요 버튼 클릭하면 하트 색이 바뀌고 버튼의 벨류가 넘어가서 인설트된다.
	function clickLike(video_id){
		var heart = "font"+video_id;
		var viedoid = "btn"+video_id;
		
		if(document.getElementById(heart).color == "black"){
		document.getElementById(heart).color="red";
		}else{
			document.getElementById(heart).color = "black";
		}
		//var vid= document.getElementById(viedoid).value;
		var video_id = video_id;
		
		if (document.getElementById(heart).color == "red") {
		$.ajax({
			type:"get",
			url:"companyLikeVideo.do",
			data : {'video_id': video_id },  
			//contentType: 'application/json', 
			success: function(){
			 alert("스크랩했습니다");		
			},
			error: function(){
			  alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end ajax
		}
		
		else if (document.getElementById(heart).color == "black") {
			
			$.ajax({
				type:"get",
				url:"likeVideoDelete.do",
				data : {'video_id': video_id },  
				//contentType: 'application/json', 
				success: function(){
				 alert("스크랩취소");
				},
				error: function(){
				  alert("에러 발생. 관리자에게 문의주세요.");
				}
			})//end ajax
		}
	
	}
</script>
