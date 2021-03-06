<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jQuery CDN -->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 -->
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
				type : "POST",
				data : form,
				//contentType : "application/json; charset=utf-8;",
				dataType : "json",
				success : function(data) {
					console.log(data.dataSearch.content);
					for (i = 0; i < data.dataSearch.content.length; i++) {
						$('#tbody').append("<tr>");
						appendingText(data.dataSearch.content[i].jbgp_code);
						appendingText(data.dataSearch.content[i].jbgp_code_nm);
						$('#tbody').append("</tr>");
					}
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
<button id="btn">눌러</button>
<table border="1">
	<thead>
		<tr>
			<td>코드</td>
			<td>이름</td>
		</tr>
	</thead>
	<tbody id="tbody"></tbody>
</table>