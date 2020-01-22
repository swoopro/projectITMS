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
	    
	    // 거래처 정보 수정/삭제(Business Table)	    
        $("#cED1Bnt").click(function(){ 
            var checkbox = $("input[name=checkbox]:checked"); // 체크 된(checked) 레코드의 값을 가져옴
            if (checkbox.parent().children().val() == null) {
            	alert("수정/삭제 하고자 하는 거래처 정보를 선택해주세요.")
			}else{
	            location.href= 'customerEditDel1?id='+checkbox.val();
	            // 선택한 레코드의 거래처(Business Table) PK를 넘겨주는 동시에 페이지 이동을 위해(get방식)
	            // 거래처 수정/삭제 페이지에서 해당 레코드 정보를 select하여 주기 위한 id가 필요해서
			}
         }); // cED1Bnt click end
        
         // 담당자 정보 수정/삭제(Customer Table)       
        $("#cED2Bnt").click(function(){ 
            var checkbox = $("input[name=checkbox]:checked"); // 체크 된(checked) 레코드의 값을 가져옴
            /* console.log(checkbox.parent().children().val()); */
            if (checkbox.parent().children().val() == null) {
				alert("수정/삭제 하고자 하는 담당자 정보를 선택해주세요.")
			}else {
           		location.href= 'customerEditDel2?id='+checkbox.parent().children().val();		
	            // 선택한 레코드의 담당자(Customer Table) PK를 넘겨주는 동시에 페이지 이동을 위해(get방식)
	            // 담당자 수정/삭제 페이지에서 해당 레코드 정보를 select하여 주기 위한 id가 필요해서
			}
        }); // cED2Bnt click end
	    
         
         // 거래처 관리 검색 기능(회사명 or 담당자명)
         $("#searchBnt").click(function(){

		 	var dropdown = $("#drop").val();
		 	var search = $("#search").val();
		 	
		 	console.log(dropdown);
		 	console.log(search);
		 	
		 	if (dropdown == "") {
		 		alert("분류를 선택해야만 검색이 가능합니다.")
				return false;
			} else {
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
							$(".ui.celled.table>tbody").append('<tr><td data-label="radio checkbox" id="r_checkbox"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><div class="ui radio checkbox"><input type="hidden" id="a_id" value="'+data.a_id+'"><input type="radio" name="checkbox" id="checkbox" value="'+data.a_b_id+'"><label></label></div></font></font>\n'
									+'</td><td>'+data.b_type
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
							// 이 ajax에서는 뿌려줄 위치만 지정하면 되기 때문에 <font><font>를 지정하지 않아도 되지만
							// productRead.jsp의 검색 결과 ajax에서도 뿌려주기만 하는 경우에는 가능
							// 그러나 검색 결과에서 dto.code값을 가져와서 모달창을 띄워주는 ajax에서 code값이 필요하므로
							// <font><font>까지 정확하게 지정해주어야 code값을 찾을 수 있다.
						}) // result end		 		
					} // success end
			 	}); // ajax end		 
			} // if else end
		 }) // searchBnt click end
            
	}); // funtion end
	</script>
</head>

<body>
<div class="content_body">
	<br><a href="customerRead"><h1><i class="home icon"></i>		거래처 관리 페이지</h1></a><br><br>
	
	<!-- parent DIV -->
	<div style="width: 100%; margin: 10px auto; ">
	<div style="float: left; width:11%; box-sizing: border-box;">
		<a href="customerAdd1">
		<button class="ui primary button" type="submit" id="cA1Bnt">
			<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처 정보 등록</font></font>
		</button>
		</a>
	</div>
	
	<div style="float: left; margin-left: 1%; width:11%; box-sizing: border-box;">
		<a href="customerAdd2">
		<button class="ui primary button" type="submit" id="cA2Bnt">
			<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 정보 등록</font></font>
		</button>
		</a>
	</div>
	
	<div style="float: left; margin-left: 10%; margin-right: 4%; width:35%; box-sizing: border-box;">
		<select class="ui dropdown" id="drop">
	  		<option value="" selected="selected">분류</option>
	  		<option value="1">회사명</option>
	  		<option value="0">담당자명</option>
		</select>
		
		<div class="ui icon input">
			<input type="text" name="search" id="search" placeholder="검색어를 입력하세요" autocomplete="off" >
			<button class="ui icon button" id="searchBnt"><i class="search icon"></i></button>
		</div>
	</div>
	
	<div style="float: left; width:14%; box-sizing: border-box;">
	    <!-- <a href="customerEditDel1"> -->
	  	<button class="ui primary button" type="button" id="cED1Bnt" style="margin-left: 7.5%;">
	  	<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처 정보 수정/삭제</font></font>
	  	</button>
	  	<!-- </a> -->
  	</div>
  	
  	<div style="float: right; width:14%; box-sizing: border-box;">
	  	<!-- <a href="customerEditDel2"> -->
	  	<button class="ui primary button" type="button" id="cED2Bnt" style="margin-left: 7.5%;">
	  		<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">담당자 정보 수정/삭제</font></font>
	  	</button>
	  	<!-- </a>  -->
  	</div>
  	</div>
  	<!-- parent DIV end-->
  	<br><br>
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
		    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">소속부서</font></font></th>
		    <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래품목</font></font></th>
	  	</tr>
	  </thead>
	  <!-- for문 들어갈 자리 -->
	  <tbody>
	  <c:forEach items="${list}" var="dto">
		  <tr id="cED">
	      <td data-label="radio checkbox" id="r_checkbox"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
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
	  </c:forEach>
	  </tbody>
	</table>
	<button class="ui button" type="button" id="downExcel" style="width: 150px; float: right;">엑셀 다운로드</button>
</div> <!-- content_body DIV -->
</body>
</html>