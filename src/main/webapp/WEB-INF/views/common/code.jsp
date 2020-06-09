<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Code</title>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btn').on("click", function() {
			var form = {
				svcType : "api",
				svcCode : "JOB_TYPE",
				gubun : "job_dic_list"
			}
			$.ajax({
				url : "getData.do",
			//	type : "POST",
				data : form,
				//contentType : "application/json; charset=utf-8;",
				dataType : "json",
				success : function(data) {
					console.log(data.response.body.items);
					$('#tbody').append("<tr>");
					appendingText(data.dataSearch.content.jbgp_code);

					$('#tbody').append("</tr>");
				},
				error : function() {
					alert("err");
				}
			});
		});
	});

	function appendingText(txt) {
		var tag = "<td>" + txt + "</td>";
		$('#tbody').append(tag);
	}
</script>
<body>
	<button id="btn">btn</button>
	<table border="1">
		<thead>
			<tr>
				<td>직종</td>
			</tr>
		</thead>
		<tbody id="tbody"></tbody>
	</table>
</body>
</html>