<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<title>ITMS</title>
<script>
$(function() {
	$("#open_menu").click(
			function() {
				$('.ui.sidebar').sidebar('setting', 'transition', 'overlay')
						.sidebar('toggle');
			});
	$('.ui.dropdown').dropdown({
		direction : 'auto',
		duration : 100,
		onChange : function(value, text, $choice) {

		}
	});
	
	// 담당자 등록 버튼 클릭시 확인창
	$("#insert").click(function(){
		alert("담당자 정보 등록이 완료되었습니다");
	}); // insert click end	

}); // function end
</script>
</head>

<body>
	<div class="content_body">
		<br><h1>담당자 정보 등록 페이지</h1><br>

	<div class="ui grid">

		<!-- 입력 폼 DIV-->
		<form action="insertCs" method="post">
			<div class="three wide column">
				<table border="1" style="width:300px;">
					<tr>
						<td>업체 아이디</td>
					</tr>
					<tr>
						<td><input type="text" name="b_id" id="b_id" placeholder="거래처 또는 협력업체의 아이디 입력" style="width:300px;"></td>
					</tr>

					<tr>
						<td>담당자명</td>
					</tr>
					<tr>
						<td><input type="text" name="name" id="name" style="width:300px;"></td>
					</tr>

					<tr>
						<td>담당자 연락처</td>
					</tr>
					<tr>
						<td><input type="text" name="tel" id="tel" style="width:300px;"" placeholder=" '-'를 포함하여 입력하세요"></td>
					</tr>

					<tr>
						<td>소속부서</td>
					</tr>
					<tr>
						<td><input type="text" name="c_key" id="c_key" style="width:300px;"></td>
					</tr>

					<tr>
						<td>거래품목</td>
					</tr>
					<tr>
						<td><input type="text" name="c_value" id="c_value" style="width:300px;"></td>
					</tr>

					<tr>
						<td align="center">
<!-- 						<button class="ui primary button" type="submit" id="">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 추가</font></font>
						</button> -->
						<button class="ui primary button" type="submit" id="insert">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 등록</font></font>
						</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		
		<!-- 화살표 DIV -->
		<div class="one wide column">
			<button class="ui icon button" style="margin-top: 100px; margin-left: 15px;"><i class="double angle right icon"></i></button>
		</div>

		<!-- 입력 내용 확인 DIV -->
		<div class="eleven wide column">	
		<table class="ui celled table">
		  <thead>
		    <tr><th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">업체 아이디</font></font></th>
		    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회사명</font></font></th>
		    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자명</font></font></th>
		    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 연락처</font></font></th>
		    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">소속부서</font></font></th>
		    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래품목</font></font></th>
		  </tr></thead>
		  <!-- for문 들어갈 자리 -->
		  <tbody>
		    <tr>
		      <td data-label="Name"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
		      <td data-label="Age"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
		      <td data-label="Job"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
		      <td data-label="Job"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
		      <td data-label="Job"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
		      <td data-label="Job"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
		    </tr>
		  </tbody>
		</table>
		</div>
	
	</div> <!-- grid DIV -->
	</div> <!-- content_body DIV -->
</body>
</html>