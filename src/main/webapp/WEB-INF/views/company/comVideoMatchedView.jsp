<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- !PAGE CONTENT! -->
<!-- !기업회원에게 매칭해서 자기소개영상띄워주는 페이지! -->
<div class="w3-main w3-content w3-padding"
	style="max-width: 1200px; margin-top: 100px"></div>

<!-- First Photo Grid-->
<div class="w3-row-padding w3-padding-16 w3-center" id="food">
	<c:forEach var="matched" items="${matched}">
		<div class="w3-quarter">
			<img src="download.do?name='${matched.video_img }'" alt="thumnail"
				style="width: 100%;"
				onclick="location.href='resumeDetail.do?video_id=${matched.video_id}&member_id=${matched.member_id }'">
			<button class="w3-button w3-padding-small w3-xlarge"
				id="btn${matched.video_id }" name="likeBtn"
				value="${matched.video_id}" type="button"
				onclick="clickLike(${matched.video_id})">
				<font id="font${matched.video_id }" color="black" data-count="0">
					<b> <i class="fas fa-heart"></i>
				</b>
				</font>
			</button>
			<h3>#${matched.code_name }</h3>
			<p>${matched.video_contents }</p>
		</div>
	</c:forEach>
</div>


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
					$('<div class="w3-quarter">').html("<img src='download.do?name="+item.video_img+"' "+
							"alt='thumnail' style='width: 100%;' onclick=\"location.href='resumeDetail.do?video_id=" + item.video_id + "&member_id=" +item.member_id + "'\">"
							+"<button class='w3-button w3-padding-small w3-xlarge'id='btn"+item.video_id+"' name='likeBtn' value='" + item.video_id + "' type='button' onclick='clickLike(" + 
							item.video_id + ")'>"+
							"<font id='font" +item.video_id+ "' color='black' data-count='0'> <b> <i class='fas fa-heart'></i> </b> </font> </button>"
							+" <h3>#"+ item.code_name+ " </h3><p>"+ item.video_contents +
							"</p>")
					.appendTo(place);
				});
			}else if(data.length ==0){
				$(load_mord_btn).empty();
				$('<div align="center">').html("<br><br><br><h4><b><u>더이상 없어요..ㅜㅜ</u></b></h4>").appendTo(place);
			};//endif
			},
			error: function(){
			  alert("에러 발생. 관리자에게 문의주세요.");
			}
		})//end ajax
	}; //end of function load...
</script>
