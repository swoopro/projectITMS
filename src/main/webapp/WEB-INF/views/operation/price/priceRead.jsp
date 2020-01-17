<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/views/include_nav.jsp"%>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>
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
</head>

<body>
<div class="content_body">
	<h1>단가 이력 페이지</h1>
	
<!-- 	<select class="ui dropdown">
  		<option value="">분류</option>
  		<option value="1">제품코드</option>
  		<option value="0">제품명</option>
	</select> -->
	
<!-- 	<div class="ui icon input">
	<input type="text" name="search" placeholder="검색어를 입력하세요" >
	<button class="ui icon button"><i class="search icon"></i></button>
	</div> -->
	
	<select class="ui dropdown">
  		<option value="">정렬기준</option>
  		<option value="1">날짜 내림차순</option>
  		<option value="0">날짜 오름차순</option>
	</select>
	<button class="ui icon button"><i class="filter icon"></i></button>
	
  	<table class="ui celled table">
  <thead>
  <tr>
<!--<th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처명</font></font></th>-->
    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 코드</font></font></th>
    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품명</font></font></th>
    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 상세</font></font></th>
    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 단가</font></font></th>
    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">단가 입력일</font></font></th>
  </tr>
  </thead>
  <!-- for문 들어갈 자리 -->
  <tbody>
    <tr>
<!--  <td data-label="Name"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td> -->
      <td data-label="code"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
      <td data-label="name"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
      <td data-label="spec"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
      <td data-label="price"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
      <td data-label="date"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></td>
    </tr>
  </tbody>
</table>
  	
  	
<!-- 	<table border=1 id="table" style="width: 1420px;">
		<tr align="center">
			<td>거래처명</td>
			<td>제품 코드</td>
			<td>제품명</td>
			<td>제품 상세</td>
			<td>제품 단가</td>
			<td>단가 입력일</td>
		</tr>
		for문 들어갈 자리
	    <tr align="center">
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table> -->

</div> <!-- content_body DIV -->
</body>
</html>