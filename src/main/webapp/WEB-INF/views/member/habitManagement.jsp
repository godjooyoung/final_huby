<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style>
#div1 {
	color: red
}

#overhid {
	overflow: hidden;
	height: 100px;
}
</style>
<script>
	function habitcheck(hid){
		$("#habit_id").val(hid);
		$("#frm").attr("action","habitUpdate.do");
		document.frm.submit();
	}
	
	function habitInsertPage(){
		$("#frm").attr("action","habitInsertPage.do");
		document.frm.submit();
	}
	
	function habitDelete(hid){
		$("#habit_id").val(hid);
		alert(hid);
		$("#frm").attr("action","habitDelete.do");
		document.frm.submit();
	}
	
	function habitDelete(){
		var chk = $('input[id="habit_id_check"]').is(':checked');
		
		if(chk==false){
			alert("삭제 할 이력서를 선택해주세요");
		}
		if(chk==true){
		var result = confirm("선택한 습관을 정말 삭제하시겠습니까?");
			if(result){
				$("#frm").attr("action", "habitDelete.do");
				document.frm.submit();
			}
		}
	}
	
	function habitPreview(){
		var url = "habitPreview.do";
		var preview = window.open(url,"fullscreen","scrollbars=1,width=500,height=300");
	}
</script>
<script type="text/javascript">
	 // Load the Visualization API and the corechart package.
    google.charts.load('current', {'packages':['corechart']});
	// Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart(hid) {
      var habitid = $("#habit_id").val();
      // AJAX로 데이터
      var chartData = [];
      var ajaxData;
      $.ajax({
			url : "habitChartData.do",
			method : "post",
			async : false,
			type : "json",
			success : function(data) { // [ {} ] --> [ [] ]로 바꾸는 형태
				ajaxData = data;
			//ajax결과를 chart에 맞는 data 형태로 가공
			for(i=0; i<data.length; i++) {
				var chartData2 = [];
				chartData2.push(['습관명','%'])
				var subarr = [data[i].habit_name, parseInt(data[i].per)];
				console.log(data[i].per);
				chartData2.push(subarr);
				chartData.push(chartData2);
				}
			}// #3CB371 연그린
      });	//	#FFA500 연주황
      // Instantiate and draw our chart, passing in some options.
      console.log(chartData);
      	 for(var i=0; i<chartData.length; i++){
      		 var fontColor = '3CB371'; 
      		 console.log("@@@@@"+chartData[i][1][1]);
      		 if(chartData[i][1][1] >= 80){
      			 fontColor = '#3CB371';
      		 }
      		 if(chartData[i][1][1] <= 79){
     			 fontColor = '#FFA500';
     		 }
      	 	 if(chartData[i][1][1] <= 33){
      	 		 fontColor = 'red';
      	 	 }
      		 // Set chart options
      	      var options = {'title':ajaxData[i].habit_name,
		      	    		titleTextStyle: {
		      	    	         color: '333333',
		      	    	         fontName: 'Arial',
		      	    	         fontSize: 20,
		      	    	       	 titlePosition: 'none'
		      	    	       },
      	                     'width':345,
      	                     'height':300,
      	                     'bar': {groupWidth: '30%'},
      	                     'hAxis': { gridlines: { count: 0 }, minValue: 0,maxValue: 100  },
      	                     'colors': [fontColor]
      	      };
	      var chart = new google.visualization.BarChart(document.querySelector('#chart_div'+i));
	      chart.draw(google.visualization.arrayToDataTable(chartData[i]), options);
      	 }
    }
</script>

<div id="sub_vis_wrap" class="sub01 page01">
	<div class="hd_box"></div>
	<div class="visual-area ">
		<div class="visual-area-in">
			<div class="visual-area-txt inner sub01 ">
				<div class="tit" data-aos="fade-up" data-aos-delay="300">나의습관</div>
				<p class="fs18" data-aos="fade-up" data-aos-delay="400">
					다관리해<br>습관적어봐
				</p>
			</div>
		</div>
	</div>
	<div class="sub_menu_wrap s-inner sub_menu_pc ">
		<div class="sub_menu_tit"></div>
		<ul class="sub_menu_box sub01">
			<li class="m1"><a href="#" onclick="habitPreview();">습관등록</a></li>
			<li class="m2"><a href="#" onclick="habitDelete();">습관삭제</a></li>
		</ul>
	</div>
</div>
<div id="sub_content_wrap" class="sub0101">
	<div class="ov inner center" style="margin: 10% auto 5%;">
		<form id="frm" name="frm" method="post">
			<!-- <div id="chart_div"></div> -->

			<!-- 기존 작업 시작 -->
			<%-- <c:forEach items="${ hlist }" var="habit">
습관명:${ habit.habit_name }<input type="checkbox" id="habit_id_check" name="habit_id_check" value="${habit.habit_id}"><br>
<fmt:formatDate value="${ habit.habit_start_date }" pattern="yyyy-MM-dd" var="habit_start_date" />
시작시간:${ habit_start_date }<br>
<fmt:formatDate value="${ habit.habit_log_date }" pattern="yyyy-MM-dd HH:mm:ss" var="habit_log_date" />
최근체크시간:${ habit_log_date }<br>
체크:${ habit.cnt }&nbsp;&nbsp;&nbsp;

<button type="button" class="btn-primary" onclick="habitcheck(${habit.habit_id})"
<c:if test="${ habit.checked == 1 }">disabled
</c:if>>
인증</button><br>
<br><br><br>
</c:forEach> --%>
			<!-- 기존 작업 끝 -->
			<span style="background: #3CB371; font-weight: bolder; font-size: larger; color: white; float: left; margin-right: 1%">성실</span>
			<span style="background: #FFA500; font-weight: bolder; font-size: larger; color: white; float: left; margin-right: 1%">보통</span>
			<span style="background: red; font-weight: bolder; font-size: larger; color: white; float: left; margin-right: 1%">게으름</span>
			<br><br>
			<div class="container">
				<hr />
				<div class="row">
					<c:forEach items="${ hlist }" var="habit" varStatus="var">
						<div class="col-md-4" style="table-layout: fixed;">
							<div class="card">
								<!-- <img class="card-img-top" src="http://gdurl.com/ow9D" alt="Card image cap"> -->
								<div id="chart_div${ var.index }"></div>
								<br>
								<fmt:formatDate value="${ habit.habit_start_date }"
									pattern="yyyy-MM-dd" var="habit_start_date" />
								<p class="card-text" style="font-weight: bolder;">시작시간:${ habit_start_date }
								<input type="checkbox"
										id="habit_id_check" name="habit_id_check"
										value="${habit.habit_id}">
								</p>
								
								<fmt:formatDate value="${ habit.habit_log_date }"
									pattern="yyyy-MM-dd HH:mm:ss" var="habit_log_date" />
								<p class="card-text" style="font-weight: bolder;">최근인증시간:${ habit_log_date }</p>
								
<%-- <button type="button" class="btn btn-primary" style="color: white; font-weight: bolder;" 
onclick="habitcheck(${habit.habit_id})" 
<c:if test="${ habit.checked == 1 }">disabled </c:if>
>인증</button> --%>

<c:choose>
	<c:when test="${ habit.checked == 0 }">
		<button type="button" class="btn btn-primary" style="color: white; font-weight: bolder;" 
		onclick="habitcheck(${habit.habit_id})">인증 해주세요!</button> 
	</c:when>
	<c:otherwise>
		<button type="button" class="btn btn-primary" style="color: white; font-weight: bolder; background: darkblue" 
		onclick="habitcheck(${habit.habit_id})"disabled>오늘 인증 완료!</button> 
	</c:otherwise>
</c:choose>

							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<input type="hidden" id="habit_id" name="habit_id"> <input
				type="hidden" id="habit_cnt" name="habit_cnt" value="${ habit.cnt }">
		</form>
	</div>
</div>