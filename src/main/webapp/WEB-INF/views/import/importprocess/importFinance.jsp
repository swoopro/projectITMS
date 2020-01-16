<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
       <%@include file="/WEB-INF/views/include_nav.jsp"%>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
</head>
<body>


<div class="content_body">

	<div class="row">
		<div class="ui grid">
			<div class="left floated four wide column">
				<h2 class="ui header">재무요청</h2>

			</div>
			<div class="right floated four wide column">
				어벤져스 주식회사 +82-02-700-7000 <br> 2020-01-05-00:00:00 <br>
				Invoice no. 888-8888-8888
			</div>
		</div>
		<div class="row">
			<div class="ui form segment">
				<div class="two fields">
					<div class="field">
						<table class="ui definition table">
							<h4>신청인</h4>
							<tbody>
								<tr>
									<td>신청인아이디</td>
									<td>jisooLove</td>
								</tr>
							</tfoot>
							<tr>
								<td>회사아이디</td>
								<td>LG05(회사명 검색으로 자동입력)</td>
							</tr>
							<tr>
								<td>거래아이디</td>
								<td>001</td>
							</tr>
							<tr>
								<td>재무팀아이디</td>
								<td>
									<div class="ui icon input">
										<input placeholder="재무팀아이디" type="text">
									</div>
								</td> 	
							</tr>
							</tbody>
						</table>
					</div>
					<div class="field">
						<table class="ui definition table">
							<tbody>
								<tr>
									<td>상대회사아이디</td>
									<td>
										<div class="ui icon input">
											<input placeholder="상대회사아이디" type="text">
										</div>
									</td>
								</tr>
								<tr>
									<td>상대담당자아이디</td>
									<td>
										<div class="ui icon input">
											<input placeholder="상대담당자아이디" type="text">
										</div>
									</td>
								</tr>
								<tr>
									<td>금액</td>
									<td>
										<div class="ui icon input">
											<input placeholder="금액" type="text">
										</div>
									</td>
								</tr>

								<tr>
									<td>비고</td>
									<td>
										<div class="ui icon input">
											<input placeholder="비고" type="text">
										</div>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



</div>


<script>
    
</script>
</body>
</html>