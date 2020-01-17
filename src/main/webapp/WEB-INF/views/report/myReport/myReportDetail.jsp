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
            <th colspan="16"><h3 class="ui centered header">${dto.title}</h3></th>
        </tr>
         </thead>
        <tbody>
        <tr>
            <th colspan="16">
                <div class="ui form">
                    <div class="field">
                        <textarea class="form-control">${dto.content}</textarea>
                    </div>
                </div>
            </th>
        </tr>
        </tbody>
    </table>
    <div class="ui right floated primary labeled icon button">
        <i class="edit icon"></i><input type="submit" value="등록">
    </div>
</div>
</body>
</html>
