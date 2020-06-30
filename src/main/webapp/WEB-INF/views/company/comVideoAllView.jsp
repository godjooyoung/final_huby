<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 영상 전체 보여주는 페이지 -->
<div class="w3-main w3-content w3-padding"
	style="max-width: 1200px; margin-top: 100px"></div>

<!-- First Photo Grid-->
<div class="w3-row-padding w3-padding-16 w3-center" id="food">
	<c:forEach var="firstList" items="${firstList}">
		<div class="w3-quarter">
			<img src="download.do?name=${firstList.VIDEO_IMG}"
				onerror="this.src='${pageContext.request.contextPath}/resources/img/common/empty_thumnails.png'"
				alt="thumnail" style="width: 100%;" onclick="location.href='resumeDetail.do?video_id=${firstList.video_id}&member_id=${firstList.member_id }'">
			<button class="w3-button w3-padding-small w3-xlarge"
				id="btn${firstList.VIDEO_ID }" name="likeBtn"
				value="${firstList.VIDEO_ID}" type="button"
				onclick="clickLike(${firstList.VIDEO_ID})">
				<font id="font${firstList.VIDEO_ID }" color="black" data-count="0">
					<b>
						<i class="fas fa-heart"></i>
					</b>
				</font>
			</button>
			<h3>#${firstList.CODE_NAME }</h3>
			<p>${firstList.VIDEO_CONTENTS }</p>
		</div>
	</c:forEach>
</div>
<!-- Grid END -->
<!-- Second Photo Grid-->
<div class="w3-row-padding w3-padding-16 w3-center" id="morePlace">
		
</div>
<!-- Grid END -->


<!-- Pagination -->
<div class="w3-center w3-padding-32">
	<div class="w3-bar">
		<font color="#134a8e" onclick="loadVideoData_more('4')" id="loadData">MORE</font></a>
	</div>
</div>


<hr id="about">


<script>
	var count_more_button_click = 0;
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
		}//end If
	
	};
	
	function loadVideoData_more(plusnum) {
		var plus = plusnum;
		count_more_button_click ++;
		plus = plus*(count_more_button_click);
		
		var place = document.getElementById("morePlace");
		var load_mord_btn = document.getElementById("loadData");
		$.ajax({
			type:"get",
			url:"get_video_list_more.do",
			data : {'count': plus },  
			contentType: 'application/json', 
			dataType : 'json',
			success: function(data){
			 alert("불러온느중..."+ count_more_button_click + "_"+plus);
			 console.log(data.length);
			 if (data.length !=0){
			 $.each(data, function(idx,item){	
					$('<div class="w3-quarter">').html("<img src=\"${pageContext.request.contextPath}/resources/img/common/"+item.VIDEO_IMG+"\" "+
							"alt='thumnail' style='width: 100%;' onclick=\"location.href='resumeDetail.do?video_id=" + item.VIDEO_ID + "&member_id=" +item.MEMBER_ID + "'\">"
							+"<button class='w3-button w3-padding-small w3-xlarge'id='btn"+item.VIDEO_ID+"' name='likeBtn' value='" + item.VIDEO_ID + "' type='button' onclick='clickLike(" + 
							item.VIDEO_ID + ")'>"+
							"<font id='font" +item.VIDEO_ID+ "' color='black' data-count='0'> <b> <i class='fas fa-heart'></i> </b> </font> </button>"
							+" <h3>#"+ item.CODE_NAME+ " </h3><p>"+ item.VIDEO_CONTENTS +
							"</p>")
					.appendTo(place);
				});
			 }else if(data.length ==0){
					$(load_mord_btn).empty();
					$('<div align="center">').html("<h4><b><u>더이상 없어요..T.T</u></b></h4>").appendTo(place);
				};//endif
			},
			error: function(){
			  alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end ajax
	}; //end of function load...
	
</script>
