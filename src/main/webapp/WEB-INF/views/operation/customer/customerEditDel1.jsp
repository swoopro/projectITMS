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
		
		/* '거래처 정보 수정' 버튼 누를 때 DB에서 정보를 수정하고 '거래처 관리' 페이지로 이동 */
		$("#cED_Edit1").click(function() {
			// ajax를 사용하여 updateBn.jsp에 metadata와 data를 전송하고 result값을 받아오기 위해 각 입력값들을 변수에 할당
			// update메소드 사용시 모든 항목값들을 수정하기 위해 각 항목값들 필요
			var id = $("#id").val();
			var com_id = $("#com_id").val();
			var type = $("#type").val();
			var name = $("#name").val();
			var ceo = $("#ceo").val();
			var addr = $("#addr").val();
			var tel = $("#tel").val();
			var country_code = $("#country_code").val();

			console.log(id)
			console.log(com_id)
			console.log(type)
			console.log(name)
			console.log(ceo)
			console.log(addr)
			console.log(tel)
			console.log(country_code)
			
			/* '거래처 정보 수정' 버튼 누를 때 DB에서 정보를 수정하고 '거래처 관리' 페이지로 이동 */
			$.ajax({
				url : "updateBn", // url: 가져올 페이지(controller에서 받아줄 @RequestMapping 주소)
				data : {
					id : id, // metadata : data
					com_id : com_id,
					type : type,
					name : name,
					ceo : ceo,
					addr : addr,
					tel : tel,
					country_code : country_code
				},
				/* async : true, */
				
				// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					console.log(result); // result값 확인용						
					alert("거래처 정보 수정이 완료되었습니다");
					location.href = "customerRead"; // '거래처 관리'페이지로 이동
				} // success
			}); // ajax end
		}); // click end

		/* '거래처 삭제 수정' 버튼 누를 때 DB에서 정보를 삭제하고 '거래처 관리' 페이지로 이동 */
		$("#cED_Del1").click(function() {
			// ajax를 사용하여 deleteBn.jsp에 metadata와 data를 전송하고 result값을 받아오기 위해 각 입력값들을 변수에 할당
			// delete메소드의 where 조건으로 id값 필요
			// delete메소드의 where 조건으로 com_id값 필요
			var id = $("#id").val();
			var com_id = $("#com_id").val();
			
			var choice = confirm("거래처 정보 삭제시 해당 담당자 정보도 삭제됩니다.\n삭제하시겠습니까?");
			console.log(choice);

			if (choice == true) {
				/* '거래처 정보 삭제' 버튼 누를 때 DB에서 정보를 삭제하고 '거래처 관리' 페이지로 이동 */
				$.ajax({
					url : "deleteBn", // url: 가져올 페이지
					data : {
						id : id, // metadata : data
						com_id : com_id
					},
					// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
					success : function(result) {
						console.log(result); // result값 확인용
						alert("거래처 정보 삭제가 완료되었습니다");
						location.href = "customerRead"; // '메인'페이지로 이동
					} // success
				}); // ajax end				
			} else {
				return false;
			}
			
		}); // click end
		
	}); // funtion end
</script>
</head>

<body>
	<div class="content_body">
		<br><h1>거래처 정보 수정/삭제 페이지</h1><br><br>

	<div class="ui centered grid">

		<!-- 입력 폼 DIV-->
		<form action="">
			<div class="four wide column">
				<table border="1" style="width:300px;">
					<input type="hidden" id="id" value="${omBnDTO.id}">
					<input type="hidden" id="com_id" value="${omBnDTO.com_id}">
					<tr>
						<td>구분</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="type" value="${omBnDTO.type}" placeholder="'거래처 - 1 / 협력업체 - 2' 입력" style="width:300px;"></td>
					</tr>

					<tr>
						<td>회사명</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="name" value="${omBnDTO.name}" style="width:300px;"></td>
					</tr>

					<tr>
						<td>대표자명</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="ceo" value="${omBnDTO.ceo}"  style="width:300px;"></td>
					</tr>

					<tr>
						<td>회사 주소</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="addr" value="${omBnDTO.addr}" style="width:300px;"></td>
					</tr>

					<tr>
						<td>회사 전화번호</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="tel" value="${omBnDTO.tel}" placeholder=" '-'를 포함하여 입력하세요" style="width:300px;"></td>
					</tr>

					<tr>
						<td>회사 국가번호</td>
					</tr>
					<tr>
						<td><input type="text" name="" id="country_code" value="${omBnDTO.country_code}" placeholder="" style="width:300px;"></td>
					</tr>

					<tr>
						<td align="center">
						<button class="ui primary button" type="button" id="cED_Edit1">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처 수정</font></font>
						</button>
						<button class="ui primary button" type="button" id="cED_Del1">
							<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">거래처 삭제</font></font>
						</button>
						</td>
					</tr>
				</table>
			</div>
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