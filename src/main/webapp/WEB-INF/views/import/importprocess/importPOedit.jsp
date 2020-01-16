<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/include_nav.jsp"%>
<link href="<c:url value="/resources/style.css" />" rel="stylesheet">
<meta charset="UTF-8">
<title>ITMS</title>

<script type="text/javascript">
	
</script>

</head>
<body>


	<div class="content_body">


		<form id="importAddOrder"
			action="${pageContext.request.contextPath}/import/importprocess/importAddOrder.do"
			method="get" target="iframe2">
			<input type="hidden" id="com_id" name="com_id"
				value="${companyDTO.id}"> <input type="hidden" id="user_id"
				name="user_id" value=""> <input type="hidden" id="b_id"
				name="b_id" value=""> <input type="hidden" id="c_id"
				name="c_id" value=""> <input type="hidden" id="type_tr"
				name="type_tr" value="2"> <input type="hidden" id="doc_no"
				name="doc_no" value=""> <input type="hidden" id="notes"
				name="notes" value="">
		</form>

		<form id="importAddShip"
			action="${pageContext.request.contextPath}/import/importprocess/importAddShipping.do"
			method="get" target="iframe2">
			<input type="hidden" id="id" name="id" value="0"> <input
				type="hidden" id="basic_id" name="basic_id" value="0"> <input
				type="hidden" id="cb_id" name="cb_id" value="0"> <input
				type="hidden" id="dcb_id" name="dcb_id" value="0"> <input
				type="hidden" id="track_no" name="track_no" value=""> <input
				type="hidden" id="o_from" name="o_from" value=""> <input
				type="hidden" id="o_to" name="o_to" value=""> <input
				type="hidden" id="event" name="event" value="0"> <input
				type="hidden" id="date" name="date" value="">
		</form>

		<div id="nav_html"></div>
		<!--상단,좌측메뉴-->

		<h2 class="ui header">수입신규등록</h2>
		<div class="ui form segment">
			<div class="two fields">
				<div class="field">
					<table class="ui definition table">
						<h4>구매자(기본값:나의정보)</h4>
						<tbody>
							<tr>
								<td>회사명</td>
								<td><c:out value='${comDTO.name}' /></td>
							</tr>
							<tr>
								<td>회사주소</td>
								<td><c:out value='${comDTO.addr}' /></td>
							</tr>
							<tr>
								<td>회사 Tel</td>
								<td>${comDTO.tel }</td>
							</tr>

							<tr>
								<td>담당자</td>
								<td>
									<!-- 									<div class="ui selection dropdown" id="dropCustomer">
										<input type="hidden" name="customer"> <i
											class="dropdown icon"></i>
										<div class="default text"></div>
										<div class="menu" id="customerSelect"></div>
									</div>
 --> <select class="ui search dropdown" id="dropEmployee">
										<option value="">${emDTO.name}</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>담당자 연락처</td>
								<td><div id="employeeTel"></div></td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="field">
					<table class="ui definition table">
						<h4>수입관리정보</h4>
						<tbody>
							<tr>
								<td>인보이스NO.</td>
								<td>${basicDTO.doc_no}</td>
							</tr>
							<tr>
								<td>인보이스발행일</td>
								<td>${basicDTO.issued_date}</td>
							</tr>
							<tr>
								<td>Notes</td>
								<td>${basicDTO.notes }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>


			<div class="two fields">
				<div class="field">
					<table class="ui definition table">
						<h4>판매업체</h4>
						<tbody>
							<tr>
								<td>회사명</td>
								<td>${bsDTO.name}</td>
							</tr>
							<!-- 		</tfoot> -->
							<tr>
								<td>회사주소</td>
								<td>${bsDTO.addr}</td>
							</tr>
							<tr>
								<td>Tel</td>
								<td>${bsDTO.tel}</td>
							</tr>

							<tr>
								<td>담당자</td>
								<td>
									<!-- 									<div class="ui selection dropdown" id="dropCustomer">
										<input type="hidden" name="customer"> <i
											class="dropdown icon"></i>
										<div class="default text"></div>
										<div class="menu" id="customerSelect"></div>
									</div>
 --> <select class="ui search dropdown" id="dropCustomer">
										<option value="">${cusDTO.name}</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>담당자 연락처</td>
								<td><span id="customerTel"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="field">
					<table class="ui definition table">
						<h4>협력업체</h4>
						<tbody>
							<tr>
								<td>회사명</td>
								<td><select class="ui search dropdown" id="dropPBusiness">
										<option value="">${bsPartnerDTO.name}</option>


										<c:forEach var="businessPList" items="${businessPList}"
											varStatus="status">
<%-- 											<option value="${businessPList.id}">${businessPList.name}</option>
 --%>
										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<td>회사주소</td>
								<td><span id="businessPAddr"></span></td>
							</tr>
							<tr>
								<td>Tel</td>
								<td><span id="businessPTel"></span></td>
							</tr>
							<tr>
								<td>담당자</td>
								<td>--> <select class="ui search dropdown" id="dropPartner">
										<option value="">담당자 검색</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>담당자 연락처</td>
								<td><span id="partnerTel"></span></td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
			<br>
			<div class="field">
				<label>주문상세내역</label>
				<table class="ui celled table" id="goodsTable">
					<thead>
						<tr>
							<th colspan="7">Description of Goods</th>
						</tr>
						<tr>
							<th>제품코드</th>
							<th>제조사</th>
							<th>제품명</th>
							<th>상세규격</th>
							<th>단가</th>
							<th>수량</th>
							<th>소계</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><select class="ui search dropdown testDrop"
								id="dropProduct0">
									<option value="">제품 검색</option>


									<c:forEach var="product" items="${productList}"
										varStatus="status">
										<option value="${product.id}"
											data-value='{"code":"${product.code}", "name":"${product.name }", "spec":"${product.spec }","price":"${product.price }"}'>${product.name}</option>

									</c:forEach>
							</select></td>
							<td><span id="productCode0"></span></td>
							<td><span id="productName0"></span></td>
							<td><span id="productSpec0"></span></td>
							<td><span id="productPrice0"></span></td>
							<td><input placeholder="수량" type="text" class="productInput"
								id="productInput0"></td>
							<td><span id="productResult0"></span></td>
						</tr>
					</tbody>
				</table>

				<div class="field">
					<table class="ui definition table">
						<tbody>
							<tr>
								<td colspan="3">합계</td>
								<td colspan="1">총수량: 수량수식</td>
								<td colspan="1">총금액: 금액수식</td>
								<td colspan="1">
									<div class="ui right floated small primary labeled icon button"
										id="resultBtn">
										<i class="pencil alternate icon"></i>수량 금액 확인
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="ui left floated icon buttons">
					<button class="ui button" id="btn-add-row">
						<i class="plus icon"></i>
					</button>
					<button class="ui button" id="btn-del-row">
						<i class="minus icon"></i>
					</button>
				</div>
				<div class="ui right floated small primary labeled icon button"
					id="importInsertBtn">
					<i class="pencil alternate icon"></i>수출신규등록
				</div>
			</div>
		</div>
	</div>
	<iframe name="iframe" style="display: none;"></iframe>
	<iframe name="iframe2" style="display: none;"></iframe>
</body>
</html>






