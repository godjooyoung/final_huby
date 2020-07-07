<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- !PAGE CONTENT! -->
<!-- !기업회원에게 매칭해서 자기소개영상띄워주는 페이지! -->
<div class="w3-main w3-content w3-padding" style="max-width: 1200px;"></div>

<!-- 일단...
<div class="w3-row-padding w3-padding-16 w3-center">
	<c:forEach var="matched" items="${matched}">
		<div class="w3-quarter">
			<img src="download.do?name=${matched.video_img }" alt="thumnail"
				style="width: 100%;"
				onerror="this.src='${pageContext.request.contextPath}/resources/img/common/empty_thumnails.png'"
				onclick="location.href='resumeDetail.do?video_id=${matched.video_id}&member_id=${matched.member_id }'">
			<div class="likebtn" 
				id="btn${matched.video_id }" name="likeBtn"
				value="${matched.video_id}"
				onclick="clickLike(${matched.video_id})">
				<font id="font${matched.video_id }" color="white" 
					  style="-webkit-text-stroke: 1px black; 
					  font-size: xx-large;">
					<b> <i class="fas fa-heart"></i> </b>
				</font>
			</div>
			<h3>#${matched.code_name}</h3>
			<p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:300px;
			font-weight: bold; text-shadow: 1px 1px 2px white;">
			${matched.video_contents}
			</p>
		</div>
	</c:forEach>
</div>
<!-- 일단 END -->

<!-- 다시시도 -->

<div class="w3-row w3-padding-16 w3-center">
	<c:forEach var="matched" items="${matched}">
		<div class="w3-quarter">
			<div class='wrap' style='position:relative;'>
				<div class="inner01" style="position:absolute; left:3%; top:3%;">
					<h4 style="align:left; color:white; text-shadow: 2px 2px 5px black; font-weight: bolder; 
				 	padding-top:5px; padding-left:5px;">
				 		#${matched.code_name}
					</h4>
				</div>
				<div class="inner02" style="position:absolute; left:5%; top:5%;">
					<br>
					<p style="text-align:left;overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:250px;
						font-weight: bold;  color:white; text-shadow: 2px 2px 5px black; ">
						${matched.video_contents}
					</p>
				</div>
			<img src="download.do?name=${matched.video_img }" alt="thumnail"
				style="width: 100%;"
				onerror="this.src='${pageContext.request.contextPath}/resources/img/common/empty_thumnails.png'"
				onclick="location.href='resumeDetail.do?video_id=${matched.video_id}&member_id=${matched.member_id }&hashcode=${matched.code_name}'">
			<div class="inner03"
				style="position:absolute; left:87%; top:4%"; 
				id="btn${matched.video_id }" name="likeBtn"
				value="${matched.video_id}"
				onclick="clickLike(${matched.video_id})">
				<font id="font${matched.video_id }" color="white" style="-webkit-text-stroke: 1px black; font-size: xx-large;" data-count="0">
					<b> <i class="fas fa-heart"></i> </b>
				</font>
			</div>
			</div>
			<br>
		</div>

	</c:forEach>
</div>


<!-- Second Photo Grid-->
<div class="w3-row w3-padding-16 w3-center" style="position:relative;" id="morePlace">
<!-- 여기에 붙음!!!!!!!!!!!! -->
</div>
<!-- Grid END -->

<c:set var="matched" value="${matched}" />
<c:if test="${empty matched}">
<div class="w3-container"> <br><br><br><br>  
		<div align="center">
			<h2>매치된 영상이 없습니다. <br>
			허비를 통해 공고를 내보세요. 맞춤 인재를 추천해드립니다!</h2>
			<br><input type="button" value="공고 등록 하러가기"
				class="btn btn-warning btn-lg"
				onClick="location.href='empInsertPageGo.do'">
		</div></div>
</c:if>
<c:set var="matched" value="${matched}" />
<c:if test="${not empty matched}">
		<!-- Pagination -->
	<div class="w3-center w3-padding-32">
	<div class="w3-bar">
		<font color="#134a8e" onclick="loadVideoData_more('4')" id="loadData">MORE</font></a>
	</div>
</div>
		
</c:if>


<hr id="about">

<div class="w3-main w3-content w3-padding" style="max-width:1200px; height:50px"></div>
<script>
	var count_more_button_click = 0;
	//좋아요 버튼 클릭하면 하트 색이 바뀌고 버튼의 벨류가 넘어가서 인설트된다.
	function clickLike(video_id){
		var heart = "font"+video_id;
		
		if(document.getElementById(heart).color == "white"){
		document.getElementById(heart).color="red";
		}else{
			document.getElementById(heart).color = "white";
		}
		var video_id = video_id;
		
		if (document.getElementById(heart).color == "red") {
		$.ajax({
			type:"get",
			url:"companyLikeVideo.do",
			data : {'video_id': video_id },  
			success: function(){
			 alert("스크랩했습니다");		
			},
			error: function(){
			  alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end ajax
		}
		
		else if (document.getElementById(heart).color == "white") {
			
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
	
	};
	
	function loadVideoData_more(plusnum) {
		var plus = plusnum;
		count_more_button_click ++;
		plus = plus*(count_more_button_click);
		
		var place = document.getElementById("morePlace");
		var load_mord_btn = document.getElementById("loadData");
		$.ajax({
			type:"get",
			url:"get_matched_video_list_more.do",
			data : {'count': plus },  
			contentType: 'application/json', 
			dataType : 'json',
			success: function(data){
			 alert("불러온느중... "+ count_more_button_click + "<<버튼 클릭 횟수.. "+plus + "<<row범위..");
			 console.log(data.length);
			if (data.length !=0){
			 $.each(data, function(idx,item){	
					$('<div class=\"w3-quarter\">').html(
							
							"<div class='wrap' style='position:relative; width:100%;'>"
							+"<div class='inner01' style='position:absolute; left:3%; top:3%;'>"
							+"<h4 style='align:left; text-shadow: 1px 1px 2px white; font-weight: bolder;"
							+"padding-top:5px; padding-left:5px;'>"
							+"#"
							+item.code_name
							+"</h4>"
							+"</div>"
							+"<div class='inner02' style='position:absolute; left:5%; top:5%;'>"
							+"<br>"
							+"<p style='overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:250px;"
							+"font-weight: bold;  color:white; text-shadow: 2px 2px 5px black;'>"
							+item.video_contents
							+"</p></div>"
							+"<img src='download.do?name="
							+item.video_img
							+"&member_id="
							+item.member_id
							+"hashcode="
							+item.code_name
							+"' alt='썸네일'"
							+"style='width:100%;' onerror=\""
							+"this.src=\'"
							+"${pageContext.request.contextPath}/resources/img/common/empty_thumnails.png'\""
							+"onclick=\"location.href='resumeDetail.do?video_id="
							+item.video_id
							+"&member_id="
							+item.member_id
							+"'\">"
							+"<div class='inner03' style='position:absolute; left:87%; top:4%'; id='btn"
							+item.video_id
							+"' name='likeBtn' value='"
							+item.video_id
							+"' onclick=\"clickLike('"
							+item.video_id
							+"')\">"
							+"<font id=\"font"
							+item.video_id
							+"\" color='white' style=\"-webkit-text-stroke: 1px black; font-size: xx-large;\" data-count=\"0\">"
							+"<b> <i class=\"fas fa-heart\"></i> </b> </font></div></div><br>")
					.appendTo(place);
				});
			}else if(data.length ==0){
				$(load_mord_btn).empty();
				$('<div class=\"\">').html(
						"<div class='wrap' style='position:relative; width:100%;'>"
						+"<h4><b><u>더이상 없어요..(T.T)</u></b></h4>"
						+"</div>"
						).appendTo(place);
			};//endif
			},
			error: function(){
			  alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end ajax
	}; //end of function load...
</script>