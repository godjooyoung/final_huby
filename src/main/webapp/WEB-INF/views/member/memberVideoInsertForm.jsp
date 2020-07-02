<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script>
	$(function() {
		var bar = $('.bar');
		var percent = $('.percent'); 
		var status = $('#status');
		var img = "<p><img src='${pageContext.request.contextPath}/resources/img/common/progress.gif'></p>"
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
														$("#div_gifInsert")
																.append(img);
													}
												},
												success : function(data) {
													alert('영상이 등록되었습니다.');
													var percentVal = '0%';
													bar.width(percentVal);
													percent.html(percentVal);
													$("#div_gifInsert *")
															.remove();
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
													$("#div_gifInsert *")
															.remove();
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
	padding: 10px;
	float: center;
	width: 10%;
	margin: 0 auto;
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
<div>
	<div class="progress">
		<div class="bar"></div>
		<div class="percent">0%</div>
	</div>
	<div id="status"></div>
</div>
<div id="div_gifInsert"></div>
<div class="container h-100">
	<div class="row h-100 justify-content-center align-items-center">
		<form id="videoForm" class="col-12" action="memberVideoInsert.do"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
				<div style="padding-top: 10px">
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
					<textarea name="textarea" style="width: 100%" rows="10"
						id="textarea"></textarea>
					<!-- 텍스트 에어리어는 붙여서 입력할것 떨어지면 공백이 발생한다. -->
				</div>
				<div style="padding-top: 20px">
					<input id="videoChoice" type="file" name="uploadFile"
						accept="video/*">
					<button type="button" id="btnSend">보내기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<div id="list">
	<c:forEach var="matched" items="${videoName}">
		<div class="div_videoInsert">
			<video width="360" height="640" controls>
				<source src="download.do?name=${matched.video_location }"
					type="video/mp4" />
			</video>
			<span class="hoverBtn"> <a class="deleteBtn" href="#"
				data="${matched.video_id }">삭제하기</a>
			</span>
		</div>
	</c:forEach>
</div>
