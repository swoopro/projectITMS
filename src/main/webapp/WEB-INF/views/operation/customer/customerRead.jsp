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

// 거래처 관리 페이지에서 조인테이블 목록에서 선택한 레코드의 수정/삭제를 위한 정보를 select 해오기 위한 함수들	
	// 상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
	    
        // 담당자 정보 수정/삭제(Customer Table)
        
        $("#cED2Bnt").click(function(){ 
            var checkbox = $("input[name=checkbox]:checked"); // 체크 된(checked) 레코드의 값을 가져옴
           	location.href= 'customerEditDel2?id='+checkbox.parent().children().val();
            // 선택한 레코드의 담당자(Customer Table) PK를 넘겨주는 동시에 페이지 이동을 위해(get방식)
            // 담당자 수정/삭제 페이지에서 해당 레코드 정보를 select하여 주기 위한 id가 필요해서
        }); // cED2Bnt click end
	    
	    // 거래처 정보 수정/삭제(Business Table)
	    
        $("#cED1Bnt").click(function(){ 
            var checkbox = $("input[name=checkbox]:checked"); // 체크 된(checked) 레코드의 값을 가져옴
            location.href= 'customerEditDel1?id='+checkbox.val();
            // 선택한 레코드의 거래처(Business Table) PK를 넘겨주는 동시에 페이지 이동을 위해(get방식)
            // 거래처 수정/삭제 페이지에서 해당 레코드 정보를 select하여 주기 위한 id가 필요해서
         }); // cED1Bnt click end
         
         // 거래처 관리 검색 기능(회사명 or 담당자명)
         $("#searchBnt").click(function(){

		 	var dropdown = $("#drop").val();
		 	var search = $("#search").val();
		 	
		 	console.log(dropdown);
		 	console.log(search);
		 	
/* 		 	var b_type = $("#b_type").children().children().text(); // 거래처 구분
		 	var b_name = $("#b_name").children().children().text(); // 거래처명
		 	var b_ceo = $("#b_ceo").children().children().text(); // 대표자명
		 	var b_addr = $("#b_addr").children().children().text(); // 거래처 주소
		 	var b_tel = $("#b_tel").children().children().text(); // 거래처 전화번호
		 	var b_country_code = $("#b_country_code").children().children().text(); // 거래처 국가번호
		 	var a_name = $("#a_name").children().children().text(); // 담당자명
		 	var a_tel = $("#a_tel").children().children().text(); // 담당자 전화번호
		 	var a_c_key = $("#a_c_key").children().children().text(); // 담당자 키
		 	var a_c_value = $("#a_c_value").children().children().text(); // 담당자 값
		 	
		 	console.log(b_type);
		 	console.log(b_name);
		 	console.log(b_ceo);
		 	console.log(b_addr);
		 	console.log(b_tel);
		 	console.log(b_country_code);
		 	console.log(a_name);
		 	console.log(a_tel);
		 	console.log(a_c_key);
		 	console.log(a_c_value); */
		 	
		 	$.ajax({
		 		url: "searchBnCs",
		 		data : {
		 			dropdown : dropdown,
		 			search : search
		 		},
		 		// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					console.log(result);
					$(".ui.celled.table>tbody").empty(); // 기존 출력 결과를 백지화 시켜 주기 위해
					/* $("#content").append('<input type="hidden" id="code" value="'+code+'">'); */
					// ajax 성공 시 code값을 다른 .click 함수에서 사용하기 위해 hidden으로 
					$(result).each(function(index, data){
						/* console.log(index + " ~~~~~ " + data); */
						$(".ui.celled.table>tbody").append('<tr><td>'+data.b_type
								+'</td><td>'+data.b_name
								+'</td><td>'+data.b_ceo
								+'</td><td>'+data.b_addr
								+'</td><td>'+data.b_tel
								+'</td><td>'+data.b_country_code
								+'</td><td>'+data.a_name
								+'</td><td>'+data.a_tel
								+'</td><td>'+data.a_c_key
								+'</td><td>'+data.a_c_value
								+'</td></tr>');
					}) // result end		 		
				} // success end
		 	}); // ajax end		 
		 }) // searchBnt click end
            
	}); // funtion end
	</script>
</head>

<body>
<div class="content_body">
	<h1>거래처 관리 페이지</h1>
	
	
	<a href="customerAdd1">
	<button class="ui primary button" type="submit" id="cA1Bnt">
		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처 정보 등록</font></font>
	</button>
	</a>
	<a href="customerAdd2">
	<button class="ui primary button" type="submit" id="cA2Bnt">
		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 정보 등록</font></font>
	</button>
	</a>
	
	<select class="ui dropdown" id="drop">
  		<option value="" selected="selected">분류</option>
  		<option value="1">회사명</option>
  		<option value="0">담당자명</option>
	</select>
	
	<div class="ui icon input">
	<input type="text" name="search" id="search" placeholder="검색어를 입력하세요" autocomplete="off" >
	<button class="ui icon button" id="searchBnt"><i class="search icon"></i></button>
	</div>
    <!-- <a href="customerEditDel1"> -->
  	<button class="ui primary button" type="submit" id="cED1Bnt">
  	<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처 정보 수정/삭제</font></font>
  	</button>
  	<!-- </a> -->
  	<!-- <a href="customerEditDel2"> -->
  	<button class="ui primary button" type="submit" id="cED2Bnt">
  		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 정보 수정/삭제</font></font>
  	</button>
  	<!-- </a>  -->
  	
<table class="ui celled table">
  <thead>
  	<tr>
		<th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">선택</font></font></th>
		<th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">구분</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회사명</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">대표자명</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회사 주소</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회사 전화번호</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회사 국가번호</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자명</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 연락처</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">key</font></font></th>
	    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">value</font></font></th>
  	</tr>
  </thead>
  <!-- for문 들어갈 자리 -->
  <c:forEach items="${list}" var="dto">
  <tbody>
  	<%-- <form action="customerEditDel1?b_id=${dto.b_id}&b_com_id=${dto.b_com_id}&a_id=${dto.a_id}&a_com_id=${dto.a_com_id}" method="post"> --%>
  	<%-- <a href="customerRead?b_id=${dto.b_id}&a_b_id=${dto.a_id}"></a> --%>
  <!-- 	<tr> -->
	  <tr id="cED">
      <td data-label="radio checkbox"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	 	 <div class="ui radio checkbox">
	 	 	<!-- hidden 타입: 코드상에는 존재하여 필요한 다른 코드에 사용할 수 있지만 UI에는 출력되지 않음 -->
	 	 	<input type="hidden" id="a_id" value="${dto.a_id}"> <!-- customerEditDel2.jsp로 넘겨주기 위한 담당자 PK(a_id) -->
		 	<input type="radio" name="checkbox" id="checkbox" value="${dto.b_id}"> <!-- customerEditDel1.jsp로 넘겨주기 위한 거래처 PK(b_id) -->
		    <label></label>
		 </div>
	  </font></font>
	  </td>	        
      <td data-label="b_type" id="b_type"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.b_type}</font></font></td>
      <td data-label="b_name" id="b_name"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.b_name}</font></font></td>
      <td data-label="b_ceo" id="b_ceo"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.b_ceo}</font></font></td>
      <td data-label="b_addr" id="b_addr"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.b_addr}</font></font></td>
      <td data-label="b_tel" id="b_tel"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.b_tel}</font></font></td>
      <td data-label="b_country_code" id="b_country_code"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.b_country_code}</font></font></td>
      <td data-label="a_name" id="a_name"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.a_name}</font></font></td>
      <td data-label="a_tel" id="a_tel"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.a_tel}</font></font></td>
      <td data-label="a_c_key" id="a_c_key"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.a_c_key}</font></font></td>
      <td data-label="a_c_value" id="a_c_value"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${dto.a_c_value}</font></font></td>
    </tr>
	<!-- </form> -->
  </tbody>
  </c:forEach>
<%--   <c:forEach items="${list}" var="dto">
    업체id:${dto.b_id} / 회사id:${dto.b_com_id} / 담당자id${dto.a_id} / 회사id:${dto.a_com_id} 
  </c:forEach> --%>
</table>

</div> <!-- content_body DIV -->
</body>
</html>