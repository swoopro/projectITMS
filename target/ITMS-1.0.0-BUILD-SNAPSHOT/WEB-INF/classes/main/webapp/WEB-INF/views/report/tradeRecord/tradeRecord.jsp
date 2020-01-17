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
            <th colspan="11">수입관리</th>
        </tr>
        <tr>
            <th>NO</th>
            <th>거래처</th>
            <th>발주일</th>
            <th>PO번호</th>
            <th>제품명</th>
            <th>상세규격</th>
            <th>수량</th>
            <th>단가(USD)</th>
            <th>소계(USD)</th>
            <th>입고일</th>
            <th>비고</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>1</th>
            <th>1</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </tbody>
        <tfoot class="full-width">
        <tr>
            <th colspan="8">합계</th>
            <th colspan="3">금액</th>
        </tr>


        <tr>
            <th colspan="11">
                <div class="ui right floated small primary labeled icon button">
                    <i class="edit icon"></i>확인
                </div>
            </th>
        </tr>
        </tfoot>
    </table>
    <br><br><br>
    <table class="ui celled table">
        <thead>
        <tr>
            <th colspan="11">수출관리</th>
        </tr>
        <tr>
            <th>NO</th>
            <th>거래처</th>
            <th>발주일</th>
            <th>PO번호</th>
            <th>제품명</th>
            <th>상세규격</th>
            <th>수량</th>
            <th>단가(USD)</th>
            <th>소계(USD)</th>
            <th>출고일</th>
            <th>비고</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>1</th>
            <th>1</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </tbody>
        <tfoot class="full-width">
        <tr>
            <th colspan="8">합계</th>
            <th colspan="3">금액</th>
        </tr>

        <tr>
            <th colspan="11">
                <div class="ui right floated small primary labeled icon button">
                    <i class="edit icon"></i>확인
                </div>
            </th>
        </tr>
        </tfoot>
    </table>
</div>

</body>
</html>
