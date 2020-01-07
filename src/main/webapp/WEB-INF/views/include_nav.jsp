<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.css">
    <script src="${pageContext.request.contextPath}/resources/include/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.js"></script>
    <meta charset="UTF-8">
    <title>ITMS</title>
</head>
<body>
<div id="nav_html">
    <div class="ui sidebar inverted vertical menu">
        <div class="item">
            좌측대메뉴1
        </div>
        <div class="item">
            좌측대메뉴2
        </div>
        <div class="item">
            <div class="header">종합보고</div>
            <div class="menu">
                <a class="item">
                    월별집계표
                </a>
                <a class="item">
                    수출입관리대장
                </a>
                <a class="item">
                    개별보고작성
                </a>
            </div>
        </div>
    </div>
</div>
<div class="ui stackable menu">
    <a class="active item" id="open_menu">
        <i class="align justify icon"></i>
    </a>
    <a class="item">
        상단1
    </a>
    <a class="item">
        상단2
    </a>
</div>

<script>
    $("#open_menu").click(function () {
    $('.ui.sidebar').sidebar('setting','transition','overlay').sidebar('toggle');
    });
</script>
</body>
</html>