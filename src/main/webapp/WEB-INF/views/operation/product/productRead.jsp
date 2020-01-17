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
	$(function() {
		
	    $("#open_menu").click(function () {
	        $('.ui.sidebar').sidebar('setting','transition','overlay').sidebar('toggle');
	    });
	    $('.ui.dropdown').dropdown({
	        direction:'auto',
	        duration:100,
	        onChange:function(value, text, $choice){
	
	        }
	    });
	    
// 제품 관리 페이지에서 조인테이블 목록에서 선택한 레코드의 수정/삭제를 위한 정보를 select 해오기 위한 함수들	
// 상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
		   		    
	// 제품 정보 수정/삭제(Product Table)	    
	    $("#pED1Bnt").click(function(){ 
            var checkbox = $("input[name=checkbox]:checked"); // 체크 된(checked) 레코드의 값을 가져옴
            console.log(checkbox.val());
            location.href = "productEditDel?id="+checkbox.val();
	        // 선택한 레코드의 거래처(Business Table) PK를 넘겨주는 동시에 페이지 이동을 위해(get방식)
	        // 거래처 수정/삭제 페이지에서 해당 레코드 정보를 select하여 주기 위한 id가 필요해서
        }); // click end
        
	// 제품 단가 이력 모달창(모달창 띄우고 제품 단가 이력 데이터 출력)    
        var filter = 0; // controller에 flag 형식으로 보내주기 위한 변수 선언 및 초기값 할당. 모든 .click함수에서 사용하기 위해 여기서 선언
	    $("#pHBnt").click(function(){ 
            var checkbox = $("input[name=checkbox]:checked"); // 체크 된(checked) 레코드의 값을 가져옴
            var code = checkbox.parent().parent().parent().parent().parent().children().children().children().eq(1).text();
            // checkbox 위치를 기준으로 code 값을 가져옴
            
            $.ajax({
				url : "priceHistory", // url: 가져올 페이지(controller에서 받아줄 @RequestMapping 주소)
				data : {
					code : code, // mapper에서 select를 하기 위한 where 조건으로 필요
					filter : filter // controller에서 오름차순, 내림차순에 따라 쿼리문을 다르게 실행 시켜주기 위해 필요
				},
				
				// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					/* console.log(result); */
					$("#content").empty(); // 기존 출력 결과를 백지화 시켜 주기 위해
					$("#content").append('<input type="hidden" id="code" value="'+code+'">');
					// ajax 성공 시 code값을 다른 .click 함수에서 사용하기 위해 hidden으로 
					$(result).each(function(index, data){
						/* console.log(index + " ~~~~~ " + data); */
						$("#content").append('<tr><td>'+data.code
								+'</td><td>'+data.name
								+'</td><td>'+data.spec
								+'</td><td>'+data.price
								+'</td><td>'+dateTimeFormat('/Date('+data.date+')/')
								+'</td></tr>');
					})
					$(".ui.modal").modal("show"); // 모달창을 띄워주기 위한 함수
				} // success
			}); // ajax end 
        }); // pHBnt click end
       
     // 제품 단가 이력 내림차순(모달창에 append 결과만 바꿔서 제품 단가 이력 데이터 출력)
        $("#down").click(function() {
	   		filter = $("#down").val(); // filter = 0; 과 동일
	   		var code = $("#code").val(); // pHBnt.click함수 ajax success함수에 hidden으로 출력한 code 값 가져오기
		
	   		$.ajax({
	     		url : "priceHistory", // url: 가져올 페이지(controller에서 받아줄 @RequestMapping 주소)
				data : {
					code : code, // mapper에서 select를 하기 위한 where 조건으로 필요
					filter : filter // controller에서 오름차순, 내림차순에 따라 쿼리문을 다르게 실행 시켜주기 위해 필요
				},
				
				// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					/* console.log(result); */
					$("#content").empty(); // 기존 출력 결과를 백지화 시켜 주기 위해
					$("#content").append('<input type="hidden" id="code" value="'+code+'">');
					// ajax 성공 시 code값을 다른 .click 함수에서 사용하기 위해 hidden으로 
					$(result).each(function(index, data){
						/* console.log(index + " ~~~~~ " + data); */
						$("#content").append('<tr><td>'+data.code
								+'</td><td>'+data.name
								+'</td><td>'+data.spec
								+'</td><td>'+data.price
								+'</td><td>'+dateTimeFormat('/Date('+data.date+')/')
								+'</td></tr>');
					}) // result end
				}	// success end	     		
	     	}) // ajax end	        
		}); // click end (#down)
			
	// 제품 단가 이력 오름차순(모달창에 append 결과만 바꿔서 제품 단가 이력 데이터 출력)	
		$("#up").click(function() {
	    	filter = $("#up").val(); // filter = 1; 과 동일
	        var code = $("#code").val();
	   
	     	$.ajax({
	     		url : "priceHistory", // url: 가져올 페이지(controller에서 받아줄 @RequestMapping 주소)
				data : {
					code : code, // mapper에서 select를 하기 위한 where 조건으로 필요
					filter : filter // controller에서 오름차순, 내림차순에 따라 쿼리문을 다르게 실행 시켜주기 위해 필요
				},
				
				// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					/* console.log(result); */
					$("#content").empty(); // 기존 출력 결과를 백지화 시켜 주기 위해
					$("#content").append('<input type="hidden" id="code" value="'+code+'">');
					// ajax 성공 시 code값을 다른 .click 함수에서 사용하기 위해 hidden으로 
					$(result).each(function(index, data){
						/* console.log(index + " ~~~~~ " + data); */
						$("#content").append('<tr><td>'+data.code
								+'</td><td>'+data.name
								+'</td><td>'+data.spec
								+'</td><td>'+data.price
								+'</td><td>'+dateTimeFormat('/Date('+data.date+')/')
								+'</td></tr>');
					}) // result end
				}	// success end	     		
	     	}) // ajax end
		}); // click end (#up)
            	    
	}); // funtion end 
	</script>
	
	<!-- ajax 통신으로 return 받은 데이터(jackson-databind 활용으로 TimeStamp형식으로 나오지 않아서)를 datetime 타입으로 변환시키는 함수 -->
	<script>
	function dateTimeFormat(dateTimeValue) {
        var dt = new Date(parseInt(dateTimeValue.replace(/(^.*\()|([+-].*$)/g, '')));
        var dateTimeFormat = dt.getFullYear() + "-" + (dt.getMonth() + 1) + '-' 
              + dt.getDate() + ' ' + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
        return dateTimeFormat;
    }
	</script>
</head>

<body>
<div class="content_body">
	<h1>제품 관리 페이지</h1>
	
	<a href="productAdd">
	<button class="ui primary button" type="submit" id="">
		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 정보 등록</font></font>
	</button>
	</a>
	<select class="ui dropdown">
  		<option value="">분류</option>
  		<option value="1">제품코드</option>
  		<option value="0">제품명</option>
	</select>
	<div class="ui icon input">
	<input type="text" name="search" placeholder="검색어를 입력하세요" >
	<button class="ui icon button"><i class="search icon"></i></button>
	</div>
	<!-- <a href="productEditDel"> -->
  	<button class="ui primary button" type="button" id="pED1Bnt">
  	<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 정보 수정/삭제</font></font>
  	</button>
  	<!-- </a> -->
  	<!-- <a href="productHistory"> -->
  	<button class="ui primary button" type="button" id="pHBnt">
  	<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 정보 이력</font></font>
  	</button>
  	<!-- </a> -->
  	
  	<table class="ui celled table">
  <thead>
    <tr>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">선택</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 코드</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품명</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 상세</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 단가</font></font></th>
  </tr>
  </thead>
  
  <!-- for문 들어갈 자리 -->
  <c:forEach items="${list}" var="dto">
  <tbody>
     <tr id="pED">
     <td data-label="radio checkbox"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
		<div class="ui radio checkbox">
		 	<input type="radio" name="checkbox" id="checkbox" value="${dto.id}"> <!-- productEditDel.jsp로 넘겨주기 위한 제품 PK(id) -->
		    <label></label>
		 </div>
	  </font></font>
	  </td>
      <td data-label="code"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.code}</font></font></td>
      <td data-label="name"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.name}</font></font></td>
      <td data-label="spec"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.spec}</font></font></td>
      <td data-label="price"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.price}</font></font></td>
    </tr>
  </tbody>
  </c:forEach>
</table>
</div> <!-- content_body DIV -->

<!-- Modal -->
<div class="ui modal">
	<div class="ui header" style="height: 70px">	
		<div style="float: left; margin-top: 10px;">
			<i class="large chart line icon"></i><font style="font-size: 40px">원가관리</font>
		</div>
		<!-- Filter 버튼 DIV -->		
		<div class="ui blue label" style="float: right; height: 50px; margin-top: px;">
			<div class="ui blue label" style="height: 35px; font-size: 15px; margin-bottom: 3px; margin-right: 10px; background-color: blue;">
			  <i class="filter icon"></i>
			  단가 입력일
			</div>
			<button class="ui toggle labeled icon button" id="down" value="0">
			  <i class="sort amount down icon"></i>내림차순</button>
			<button class="ui toggle labeled icon button" id="up" value="1">
			  <i class="sort amount up icon"></i>오름차순</button>
		</div>		
<!-- 		<div class="ui grey basic floating labeled icon dropdown button" style="float: right; height: 35px; margin-top: 10px">
			<i class="small filter icon"></i>
			<span class="text" style="font-size: 20px;">필터</span>
			<div class="menu">
				<div class="header">
			      <i class="small calendar alternate outline icon"></i>단가 입력일 기준
			    </div>
 			    <div class="divider"></div>
			    <div class="item" id="down">
			      <i class="sort amount down icon"></i>내림차순</div>
			    <div class="item" id="up">
			      <i class="sort amount up icon"></i>오름차순</div>
		  	</div>
		</div> -->		
	</div>

	<div class="ui content">
		<table class="ui selected celled table">
			<thead>
				<tr>
					<th>제품 코드</th>
					<th>제품명</th>
					<th>제품 상세</th>
					<th>제품 단가</th>
					<th>단가 입력일</th>
				</tr>
			</thead>
			<tbody id="content">
			</tbody>
		</table>
	</div>
	
	<div class="ui actions">
		<button class="ui primary button">버튼</button>
	</div>
</div>

</body>
</html>