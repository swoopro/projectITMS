<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
>>>>>>> Stashed changes
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/include_nav.jsp"%>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
    
<script>
	$(function () {
	/* 	$("#ok").click(function () {
			
		}); */
		
	});	
</script>
</head>
<body>

<div class="content_body">
<div class="ui form segment">
    <h1>결제예정 수정</h1>
    <div class="field">

        <table class="ui celled table">
            <thead>

            <tr>
                <th>전표번호</th>
                <th>PO번호</th>
                <th>항목</th>
                <th>금액(USD) or 금액(KRW) </th>
            </tr></thead>
            <tbody>
            <tr>
                <td><div class="ui icon input"><input placeholder="전표번호" type="text" readonly="readonly"></div></td>
                <td><div class="ui icon input"><input placeholder="PO번호" type="text" readonly="readonly"></div></td>
                <td><div class="ui icon input"><input placeholder="항목" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="금액" type="text"></div></td>
            </tr>
            </tbody>
        </table>

<button class="ui button" id="ok">수정</button>

    </div>
</div>

</div>
</div>
</body>
<<<<<<< Updated upstream
=======
=======
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.css">
    <script src="${pageContext.request.contextPath}/resources/include/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.js"></script>
    <title>ITMS</title>
    
<script>
	$(function () {
	/* 	$("#ok").click(function () {
			
		}); */
		
	});	
</script>
</head>
<body>

<div class="content_body">
<div class="ui form segment">
    <h1>결제예정 수정</h1>
    <div class="field">

        <table class="ui celled table">
            <thead>

            <tr>
                <th>전표번호</th>
                <th>PO번호</th>
                <th>항목</th>
                <th>금액(USD) or 금액(KRW) </th>
            </tr></thead>
            <tbody>
            <tr>
                <td><div class="ui icon input"><input placeholder="전표번호" type="text" readonly="readonly"></div></td>
                <td><div class="ui icon input"><input placeholder="PO번호" type="text" readonly="readonly"></div></td>
                <td><div class="ui icon input"><input placeholder="항목" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="금액" type="text"></div></td>
            </tr>
            </tbody>
        </table>

<button class="ui button" id="ok">수정</button>

    </div>
</div>

</div>
</div>
</body>
>>>>>>> Stashed changes
>>>>>>> Stashed changes
</html>