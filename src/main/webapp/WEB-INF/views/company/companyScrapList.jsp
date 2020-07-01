<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 기업이 스크랩한 영상들 보여주는 페이지 -->
<div class="w3-main w3-content w3-padding" style="max-width: 1200px;"></div>

<!-- First Photo Grid-->
<h2 align="center">스크랩한 영상입니다.</h2>
<div class="w3-row-padding w3-padding-16 w3-center">
	<c:forEach var="comLike" items="${comLike}">
		<div class="w3-quarter">
			<div class='wrap' style='position:relative;'>
				<div class="inner01" style="position:absolute; left:3%; top:3%;">
					<h4 style="align:left;  color:white; text-shadow: 2px 2px 5px black;  font-weight: bolder; 
				 	padding-top:5px; padding-left:5px;">
				 		#${comLike.CODE_NAME}
					</h4>
				</div>
				<div class="inner02" style="position:absolute; left:5%; top:5%;">
					<br>
					<p style="text-align:left;overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:250px;
						font-weight: bold;  color:white; text-shadow: 2px 2px 5px black; ">
						${comLike.VIDEO_CONTENTS}
					</p>
				</div>
			<img src="download.do?name=${comLike.VIDEO_IMG }" alt="thumnail"
				style="width: 100%;"
				onerror="this.src='${pageContext.request.contextPath}/resources/img/common/empty_thumnails.png'"
				onclick="location.href='resumeDetail.do?video_id=${comLike.VIDEO_ID}&member_id=${comLike.MEMBER_ID }'">
			<div class="inner03"
				style="position:absolute; left:87%; top:4%"; 
				id="btn${comLike.VIDEO_ID }" name="likeBtn"
				value="${comLike.VIDEO_ID}"
				onclick="subm(${comLike.LIKE_VIDEO_ID})">
				<font id="font${comLike.VIDEO_ID }" color="red" style="-webkit-text-stroke: 1px black; font-size: xx-large;" data-count="0">
					<b> <i class="fas fa-heart"></i> </b>
				</font>
			</div>
			</div>
			<br>
		</div>
		<form id ="frm${comLike.LIKE_VIDEO_ID}" name="frm${comLike.LIKE_VIDEO_ID}" action="">
		<input type="hidden" value="${comLike.LIKE_VIDEO_ID}" name="delid">
		<!--<input type="button"  class="btn btn-primary" value="좋아요취소"  id="btnDelete" onclick="subm(${comLike.LIKE_VIDEO_ID})">-->
		</form>
	</c:forEach>
</div>
<!-- Grid END -->
<!-- Second Photo Grid-->
<div class="w3-row-padding w3-padding-16 w3-center" style="position:relative;" id="morePlace">
		
</div>
<!-- Grid END -->


<!-- 더보기버튼 
<div class="w3-center w3-padding-32">
	<div class="w3-bar">
		<font color="#134a8e" onclick="loadVideoData_more('4')" id="loadData">MORE</font></a>
	</div>
</div>
-->

<div class="w3-main w3-content w3-padding" style="max-width:1200px; height:50px"></div>

<script>	
	function loadVideoData_more(plusnum) {
		var plus = plusnum;
		count_more_button_click ++;
		plus = plus*(count_more_button_click);
		
		var place = document.getElementById("morePlace");
		var load_mord_btn = document.getElementById("loadData");
		$.ajax({
			type:"get",
			url:"#",
			data : {'count': plus },  
			contentType: 'application/json', 
			dataType : 'json',
			success: function(data){
			 alert("불러온느중..."+ count_more_button_click + "_"+plus);
			 console.log(data.length);
			 if (data.length !=0){
			 $.each(data, function(idx,item){	
					$('<div class=\"w3-quarter\">').html(
							"<div class='wrap' style='position:relative; width:100%;'>"
							+"<div class='inner01' style='position:absolute; left:3%; top:3%;'>"
							+"<h4 style='align:left; text-shadow: 1px 1px 2px white; font-weight: bolder;"
							+"padding-top:5px; padding-left:5px;'>"
							+"#"
							+item.CODE_NAME
							+"</h4>"
							+"</div>"
							+"<div class='inner02' style='position:absolute; left:5%; top:5%;'>"
							+"<br>"
							+"<p style='overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:250px;"
							+"font-weight: bold; text-shadow: 1px 1px 2px white;'>"
							+item.VIDEO_CONTENTS
							+"</p></div>"
							+"<img src='download.do?name="
							+item.VIDEO_IMG
							+"' alt='썸네일'"
							+"style='width:100%;' onerror=\""
							+"this.src=\'"
							+"${pageContext.request.contextPath}/resources/img/common/empty_thumnails.png'\""
							+"onclick=\"location.href='resumeDetail.do?video_id="
							+item.VIDEO_ID
							+"&member_id="
							+item.MEMBER_ID
							+"'\">"
							+"<div class='inner03' style='position:absolute; left:87%; top:4%'; id='btn"
							+item.VIDEO_ID
							+"' name='likeBtn' value='"
							+item.VIDEO_ID
							+"' onclick=\"clickLike('"
							+item.VIDEO_ID
							+"')\">"
							+"<font id=\"font"
							+item.VIDEO_ID
							+"\" color='white' style=\"-webkit-text-stroke: 1px black; font-size: xx-large;\" data-count=\"0\">"
							+"<b> <i class=\"fas fa-heart\"></i> </b> </font></div></div><br>"
							)
					.appendTo(place);
				});
			 }else if(data.length ==0){
					$(load_mord_btn).empty();
					$('<div class=\"\">').html(
							"<div class='wrap' style='position:relative; width:100%;'>"
							+"<h4><b><u>더이상 없어요..T.T</u></b></h4>"
							+"</div>").appendTo(place);
				};//endif
			},
			error: function(){
			  alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end ajax
	}; //end of function load...
	
</script>

<!-- 이전 
<h1>기업이 좋아한 사용자 목록입니다.</h1>
<c:forEach var="comLike" items="${comLike}">
<ul>
<li>${comLike.VIDEO_CONTENTS}</li>
<li>${comLike.CODE_NAME}</li>
</ul>
<img src="${pageContext.request.contextPath}/resources/img/common/${comLike.VIDEO_IMG }"
onclick="location.href='resumeDetail.do?video_id=${comLike.VIDEO_ID}&member_id=${comLike.MEMBER_ID }'">
<form id ="frm${comLike.LIKE_VIDEO_ID}" name="frm${comLike.LIKE_VIDEO_ID}" action="">
<input type="hidden" value="${comLike.LIKE_VIDEO_ID}" name="delid">
<input type="button"  class="btn btn-primary" value="좋아요취소"  id="btnDelete" onclick="subm(${comLike.LIKE_VIDEO_ID})">
</form>
</c:forEach>
-->
<script>
function subm(like_video_id){
	alert("스크랩을 취소합니다.");
	var lvid = like_video_id;
	var frmid = "frm"+lvid;
	document.getElementById(frmid).action="delete_like_video.do";
	document.getElementById(frmid).method = "post";
	document.getElementById(frmid).submit();
	
	
}
</script>



