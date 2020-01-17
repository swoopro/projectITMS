<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< Updated upstream
      <%@include file="/WEB-INF/views/include_nav.jsp"%>
       
=======
<<<<<<< Updated upstream
      <%@include file="/WEB-INF/views/include_nav.jsp"%>
       
=======
    <%@include file="/WEB-INF/views/include_nav.jsp"%>
>>>>>>> Stashed changes
>>>>>>> Stashed changes
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
</head>
<body>

<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
>>>>>>> Stashed changes

<div class="content_body">
HOME
</div>


<<<<<<< Updated upstream
=======
=======
<div class="content_body">
<h2>HOME</h2>

</div>





<script>
    $("#open_menu").click(function () {
        $('.ui.sidebar').sidebar('setting','transition','overlay').sidebar('toggle');
    });
    $('.ui.dropdown').dropdown({
        direction:'auto',
        duration:100,
        onChange:function(value, text, $choice){

        }
    });
</script>
>>>>>>> Stashed changes
>>>>>>> Stashed changes
</body>
</html>