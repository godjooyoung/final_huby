<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	#div1{color: red}
	#overhid{
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
		$("#frm").attr("action", "habitDelete.do");
		document.frm.submit();
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
      $.ajax({
			url : "habitChartData.do",
			method : "post",
			async : false,
			type : "json",
			success : function(data) { // [ {} ] --> [ [] ]로 바꾸는 형태
			//ajax결과를 chart에 맞는 data 형태로 가공
			for(i=0; i<data.length; i++) {
				var chartData2 = [];
				chartData2.push(['습관명','%'])
				var subarr = [data[i].habit_name, parseInt(data[i].per)];
				console.log(data[i].per);
				chartData2.push(subarr);
				chartData.push(chartData2);
				}
			}
      });


      // Instantiate and draw our chart, passing in some options.
      	 for(var i=0; i<chartData.length; i++){
      		 var fontColor = 'green'; 
      		 console.log("@@@@@"+chartData[i][1][1]);
      		 if(chartData[i][1][1] <= 50){
      			 fontColor = '#e2431e';
      		 }
      		 // Set chart options
      	      var options = {'title':'습관을 잘 지키자',
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
</head>
<body>
<!-- <div id="chart_div"></div> -->
<form id="frm" name="frm" method="post">
<div align="center">
<div>
<button class="btn-primary" onclick="habitInsertPage()"> 습관 등록하기 </button>
<button class="btn-primary" onclick="habitDelete()"> 습관 삭제하기 </button>
</div><br>
<h1>습관 관리</h1>
<br>
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
<div class="container">
  <hr/>
  <div class="row">
    <c:forEach items="${ hlist }" var="habit" varStatus="var">
    <div class="col-md-4" style="table-layout: fixed;">
		<div class="card">
			<!-- <img class="card-img-top" src="http://gdurl.com/ow9D" alt="Card image cap"> -->
			<div id="chart_div${ var.index }"></div>
   				<h5 class="card-title" style="font-weight: bolder;">습관명:${ habit.habit_name }<input type="checkbox" id="habit_id_check" name="habit_id_check" value="${habit.habit_id}"></h5>
   				<fmt:formatDate value="${ habit.habit_start_date }" pattern="yyyy-MM-dd" var="habit_start_date" />
   				<p class="card-text" style="font-weight: bolder;">시작시간:${ habit_start_date }</p>
   				<fmt:formatDate value="${ habit.habit_log_date }" pattern="yyyy-MM-dd HH:mm:ss" var="habit_log_date" />
   				<p class="card-text" style="font-weight: bolder;">최근인증시간:${ habit_log_date }</p>
   				<button type="button" class="btn btn-primary" style="color: white; font-weight: bolder;" onclick="habitcheck(${habit.habit_id})"
					<c:if test="${ habit.checked == 1 }">disabled
				</c:if>>인증</button>
		</div>
	</div>
	</c:forEach>
  </div>
</div>		


</div>
<input type="hidden" id="habit_id" name="habit_id">
<input type="hidden" id="habit_cnt" name="habit_cnt" value="${ habit.cnt }">
</form>			

						
</body>
</html>