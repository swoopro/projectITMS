<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/include_nav.jsp" %>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
</head>
<body>
<div class="content_body">
    <table class="ui celled table">
        <thead>
        <tr>
            <th colspan="11">나의보고서</th>
        </tr>
        <tr>
            <th>NO</th>
            <th>종류</th>
            <th>제목</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>1</th>
            <th>1</th>
            <th></th>

        </tr>
        </tbody>
    </table>

    <div class="ui centered primary labeled icon button">
        <a href="${pageContext.request.contextPath}/report/myReport/myReportNew.do"><i class="edit icon"></i> 신규등록</a>
    </div>
</div>
</body>
</html>
