<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		$("#open_menu").click(
				function() {
					$('.ui.sidebar').sidebar('setting', 'transition', 'overlay')
							.sidebar('toggle');
				});
		$('.ui.dropdown').dropdown({
			direction : 'auto',
			duration : 100,
			onChange : function(value, text, $choice) {
	
			}
		});
		
		/* '제품 정보 수정' 버튼 누를 때 DB에서 정보를 추가(이력을 위해 수정이 아닌 추가)하고 '제품 관리' 페이지로 이동 */
		$("#pED_Add").click(function() {
			// ajax를 사용하여 updatePd.jsp에 metadata와 data를 전송하고 result값을 받아오기 위해 각 입력값들을 변수에 할당
			// update메소드 사용시 모든 항목값들을 수정하기 위해 각 항목값들 필요
			var id = $("#id").val();
			var com_id = $("#com_id").val();
			var code = $("#code").val();
			var name = $("#name").val();
			var spec = $("#spec").val();
			var price = $("#price").val();

			console.log(id)
			console.log(com_id)
			console.log(code)
			console.log(name)
			console.log(spec)
			console.log(price)
			
			/* '거래처 정보 수정' 버튼 누를 때 DB에서 정보를 수정하고 '거래처 관리' 페이지로 이동 */
			$.ajax({
				url : "updatePd", // url: 가져올 페이지(controller에서 받아줄 @RequestMapping 주소)
				data : {
					id : id, // metadata : data
					com_id : com_id,
					code : code,
					name : name,
					spec : spec,
					price : price

				},
				/* async : true, */
				
				// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					console.log(result); // result값 확인용						
					alert("제품 정보 수정이 완료되었습니다");
					location.href = "productRead"; // '거래처 관리'페이지로 이동
				} // success
			}); // ajax end
		}); // click end

						
		/* '제품 삭제 수정' 버튼 누를 때 DB에서 정보를 삭제하고 '제품 관리' 페이지로 이동 */
		$("#pED_Del").click(function() {
			// ajax를 사용하여 deletePd.jsp에 metadata와 data를 전송하고 result값을 받아오기 위해 각 입력값들을 변수에 할당
			// delete메소드의 where 조건으로 id값 필요
			// delete메소드의 where 조건으로 com_id값 필요
			var id = $("#id").val();
			var code = $("#code").val();
			var com_id = $("#com_id").val();
			
			if (confirm("선택한 제품의 정보와 단가 이력까지 모두 삭제 됩니다.\n진행하시겠습니까?") === true) {
				/* '제품 정보 삭제' 버튼 누를 때 DB에서 정보를 삭제하고 '제품 관리' 페이지로 이동 */
				$.ajax({
					url : "deletePd", // url: 가져올 페이지
					data : {
						id : id, // metadata : data
						code : code,
						com_id : com_id
					},
					// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
					success : function(result) {
						console.log(result); // result값 확인용
						alert("제품 정보 삭제가 완료되었습니다");
						location.href = "productRead"; // '메인'페이지로 이동
					} // success
				}); // ajax end
			}else{
				return false;
			}
		}); // click end
		
	}); // funtion end
	
</script>
</head>

<body>
	<div class="content_body">
		<br><h1 align="center">제품 정보 수정/삭제 페이지</h1><br><br>

	<div class="ui grid">

		<!-- 입력 폼 DIV-->
<%-- 		<form action="">
			<div class="four wide column">
				<table border="1" style="width:300px;">
					<input type="hidden" id="id" value="${omPdDTO.id}">
					<input type="hidden" id="com_id" value="${omPdDTO.com_id}">
					<tr>
						<td>제품 코드</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="code" value="${omPdDTO.code}" placeholder="" style="width:300px;" disabled="disabled"></td>
					</tr>

					<tr>
						<td>제품명</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="name" value="${omPdDTO.name}" style="width:300px;"></td>
					</tr>

					<tr>
						<td>제품 상세</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="spec" value="${omPdDTO.spec}" style="width:300px;" placeholder=""></td>
					</tr>

					<tr>
						<td>제품 단가</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="price" value="${omPdDTO.price}" style="width:300px;"></td>
					</tr>

					<tr>
						<td align="center">
						<button class="ui primary button" type="button" id="pED_Add">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 수정</font></font>
						</button>
						<button class="ui primary button" type="button" id="pED_Del">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제품 삭제</font></font>
						</button>
						</td>
					</tr>
				</table>
			</div>
		</form> --%>
		
		<form class="ui form" style="margin-left: 470px;">
			<input type="hidden" id="id" value="${omPdDTO.id}">
			<input type="hidden" id="com_id" value="${omPdDTO.com_id}">
			
		  <div class="field">
		    <label>제품코드</label>
		    <input type="text" name="code" id="code" value="${omPdDTO.code}" placeholder="">
		  </div>
		  <div class="field">
		    <label>제품명</label>
		    <input type="text" name="name" id="name" value="${omPdDTO.name}" placeholder="">
		  </div>
		  <div class="field">
		    <label>제품상세</label>
		    <input type="text" name="spec" id="spec" value="${omPdDTO.spec}" placeholder="">
		  </div>
		  <div class="field">
		    <label>제품단가</label>
		    <input type="text" name="price" id="price" value="${omPdDTO.price}" placeholder="">
		  </div>
		  <button class="ui primary button" type="button" id="pED_Add" style="width: 250px;">제품 정보 수정</button>
		  <button class="ui primary button" type="button" id="pED_Del" style="width: 250px;">제품 정보 삭제</button>
		</form>
		
		
<!-- 		화살표 DIV 
		<div class="one wide column">
			<button class="ui icon button" style="margin-top: 140px; margin-left: 60px;"><i class="double angle right icon"></i></button>
		</div>

		입력 내용 확인 DIV
		<div class="eleven wide column">
			<table border=1 id="table" style="width: 900px; float: right;">
				<tr align="center">
					<td>구분</td>
					<td>회사명</td>
					<td>대표자명</td>
					<td>회사 주소</td>
					<td>회사 전화번호</td>
					<td>회사 국가번호</td>
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
			</table>
		</div> -->
	
	</div> <!-- grid DIV -->
	</div> <!-- content_body DIV -->
</body>
</html>