<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script>
	$(function() {
		var bar = $('.bar');
		var percent = $('.percent'); 
		var status = $('#status');
		
			function LoadingWithMask() {
		    //화면의 높이와 너비를 구합니다.
		    var maskHeight = $(document).height();
		    var maskWidth  = window.document.body.clientWidth;
		     
		    //화면에 출력할 마스크를 설정해줍니다.
		    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
		    var loadingImg ='';
		      
		    loadingImg +="<div id='loadingImg'>";
		    loadingImg +=" <img src='${pageContext.request.contextPath}/resources/img/common/progress.gif' style='position: relative; display: block; margin: 0px auto;'/>";
		    loadingImg +="</div>"; 
		  
		    //화면에 레이어 추가
		   $("#div_gifInsert")
		        .append(mask)
		        .append(loadingImg)
		        
		    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
		    $('#mask').css({
		            'width' : maskWidth
		            ,'height': maskHeight
		            ,'opacity' :'0.3'
		    });
		  
		    //마스크 표시
		    $('#mask').show();  
		  
		    //로딩중 이미지 표시
		    $('#loadingImg').show();

		}
		
		function closeLoadingWithMask() {
		    $('#mask, #loadingImg').hide();
		    $('#mask, #loadingImg').remove(); 
		}

		$(document).on('click', '#btnSend',function(){
							if($("video").length >=3){
								alert("영상은 3개까지 등록 가능합니다. 기존의 영상을 삭제 후 다시 실행해 주세요.");
								$('#btnSend').attr('disabled',true);
								return
							}
							$('form')
									.ajaxForm(
											{
												url : 'memberVideoInsert.do',
												enctype : "multipart/form-data",
												dataType : "json",
												beforeSend : function() {
													status.empty();
													var percentVal = '0%';
													bar.width(percentVal);
													percent.html(percentVal);
												},
												uploadProgress : function(
														event, position, total,
														percentComplete) {
													var percentVal = percentComplete
															+ '%';
													bar.width(percentVal);
													percent.html(percentVal);
													if (percentComplete == 100) {
														percent.html("처리중")
														LoadingWithMask();
													}
												},
												success : function(data) {
													alert('영상이 등록되었습니다.');
													var percentVal = '0%';
													bar.width(percentVal);
													percent.html(percentVal);
															closeLoadingWithMask();
															
													var video = '<video width="360" height="640" controls>'
															+ '<source src="download.do?name='
															+ data.video_location
															+ '" type="video/mp4" />'
															+ '</video>'
															+'<span class="hoverBtn">'
															+'<a href="#" class="deleteBtn" + data="'
															+ data.video_id
															+'">'
															+'삭제하기'
															+'</a>'
															+'</span>'
													$('<div>').addClass('div_videoInsert').html(video)
															.appendTo('#list');
												},
												error : function(e) {
													console.log(e);
													var percentVal = '0%';
													bar.width(percentVal);
													percent.html(percentVal);
													alert('영상이 등록되지 않았습니다.');
													closeLoadingWithMask();
												}

											}).submit();
		});
		$(document).on('click','.deleteBtn',function(){
			if(confirm("영상을 삭제하시겠습니까?")){
				
			var videoId = $(this).attr('data');
			var btn = $(this)
				$.ajax({
						dataType:'json',
						data:{'videoId':videoId},
					type:"POST",
					url:"memberVideoDelete.do",
					
				success:function(data){
					if(data.data=="true"){
					btn.closest('.div_videoInsert').remove();
					$('#btnSend').attr('disabled',false);
					alert("삭제되었습니다.");
					}
				},
				error:function(err){
					console.log(err)
				}
						
				});
			
			}else{
					return false;
				};
	});
	
	});
</script>
<<<<<<< HEAD
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>

=======
>>>>>>> branch 'master' of https://github.com/godjooyoung/final_huby.git
<style>
.progress {
	position: relative;
	width: 400px;
	height: 30px;
	border: 1px solid #ddd;
	padding: 1px;
	border-radius: 3px;
}

.bar {
	background-color: #B4F5B4;
	width: 0%;
	height: 100px;
	border-radius: 3px;
	margin: 0px;
}

.percent {
	position: absolute;
	display: inline-block;
	top: 15px;
	height: 20px;
	left: 48%;
}

.div1 {
	position: relative;
	top: 100px;
}

/* .hoverBtn {
	display: none;
}

video:hover+.hoverBtn {
	display: block;
} */
.div_videoInsert {
	display: inline-block;
}
</style>
<span style="height: 50px"></span>
<div id="div_gifInsert">
	<div class="container h-100">
		<div class="row h-100 justify-content-center align-items-center">
			<form id="videoForm" class="col-12" action="memberVideoInsert.do"
				method="post" enctype="multipart/form-data">
				<div class="form-group">
					<div class="form-group" style="padding-top: 10px">
						<input type=text list=browsers name="hashtag"
							placeholder="지원 분야를 선택해주세요" size="25" required>
						<datalist id=browsers>
							<c:forEach var="RegionNameList" items="${RegionName }">
								<option value="${RegionNameList.code_name }">
							</c:forEach>
						</datalist>
					</div>
					<br />
					<div>
						<textarea id="editor" name="textarea" style="width: 100%"
							rows="10" id="textarea" placeholder="코멘트를 남기실 수 있습니다."></textarea>
						<!-- 텍스트 에어리어는 붙여서 입력할것 떨어지면 공백이 발생한다. -->
					</div>
					<div style="padding-top: 20px">
						<input id="videoChoice" type="file" name="uploadFile"
							accept="video/*">
						<button type="button" id="btnSend"><box-icon name='camera' type='solid' animation='tada' color='#134a8e' size='40px'></box-icon></box-icon></button>
					</div>
				</div>
			</form>
<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300">나의영상</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					영상등록해해해해</p>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit"></div>
		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="#" onclick="habitInsertPage();">영상등록</a></li>
		</ul>
	</div>
</div>
<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 5%;">
		<span style="height: 50px"></span>
		<div id="div_gifInsert">
			<div class="container h-100">
				<div class="row h-100 justify-content-center align-items-center">
					<form id="videoForm" class="col-12" action="memberVideoInsert.do"
						method="post" enctype="multipart/form-data">
						<div class="form-group">
							<div class="form-group" style="padding-top: 10px">
								<input type=text list=browsers name="hashtag"
									placeholder="지원 분야를 선택해주세요" size="25" required>
								<datalist id=browsers>
									<c:forEach var="RegionNameList" items="${RegionName }">
										<option value="${RegionNameList.code_name }">
									</c:forEach>
								</datalist>
							</div>
							<br />
							<div>
								<textarea id="editor" name="textarea" style="width: 100%"
									rows="10" id="textarea" placeholder="코멘트를 남기실 수 있습니다."></textarea>
								<!-- 텍스트 에어리어는 붙여서 입력할것 떨어지면 공백이 발생한다. -->
							</div>
							<div style="padding-top: 20px">
								<input id="videoChoice" type="file" name="uploadFile"
									accept="video/*">
								<button type="button" id="btnSend">
									<box-icon name='camera' type='solid' animation='tada'></box-icon>
									보내기
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="list">
			<c:forEach var="matched" items="${videoName}">
				<div class="div_videoInsert">
					<video width="360" height="640" controls>
						<source src="download.do?name=${matched.video_location }"
							type="video/mp4" />
					</video>
					<span class="hoverBtn"><i class='bx bxs-camera bx-tada' style='color:#134a8e'></i><a class="deleteBtn" href="#" data="${matched.video_id }">삭제하기</a>
					</span>
				</div>
			</c:forEach>
		</div>
	</div>
</div>