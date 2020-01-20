<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
    <%@include file="/WEB-INF/views/include_nav.jsp"%>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <title>ITMS</title>

      
<script>
	$(function () {
		$("#save").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/request/pay_save";
			var name = "save";
			var option = "width=800, height=800, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		
		$("#update").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/request/pay_update";
			var name = "update";
			var option = "width=1000, height=240, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		$("#update2").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/request/pay_update2";
			var name = "update2";
			var option = "width=1000, height=240, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		
		$("#detail").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/request/pay_account_detail";
			var name = "account_detail";
			var option = "width=1100, height=230, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		$("#detail2").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/request/pay_account_detail";
			var name = "account_detail";
			var option = "width=1100, height=250, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		
		$(".pay").click(function () {
			var requestID = $(this).data("value").id;
			var divID = $(this).data("value").divID;
			var btnID = $(this).attr("id");
 			 $.ajax({
					url:"${pageContext.request.contextPath}/financialMng/request/pay_check",
					data:{
						id : requestID 
					},
					success:function(){
						$("#"+btnID).hide();
						$("#"+divID).html("<i class = 'check icon'></i><br>")
					}			
				}); // ajax end
 		}); //click end
	});	
</script>
      
</head>
<body>
		
<%-- <%
	String response_id = (String)session.getAttribute("id"); // 세션에 등록된 id가져오기 
%>  --%>

<div class="content_body">
<div class="ui form segment">

        <h1>결제요청</h1>
        <label>검색</label>
        <div class="ui icon input">
            <i class="search icon"></i>
            <input placeholder="검색어를 입력하세요" type="text">
        </div>
    <div class="field">
        <table class="ui celled table">
            <thead>
            <tr>
                <th style="" rowspan="2">PO번호</th>
                <th rowspan="2">항목</th>
                <th rowspan="1">금액</th>
                <th rowspan="1" colspan="3">송금정보</th>
                <th rowspan="2">신청인아이디</th>
                <th rowspan="2">요청한날짜</th>
                <th rowspan="2">요청확인</th>
            </tr>
            <tr>
                <th>단위(USD) or 단위(KRW)</th>
                <th>회사명</th>
                <th>은행명</th>
                <th>계좌 no.</th>
            </tr>

            </thead>
            <tbody>
            
            <c:forEach items="${list}" var="dto" varStatus="status">
            <tr>
                <td>${dto.id}</td>
                <td>${dto.note}</td>
                <td>${dto.amount_krw}</td>
                <td></td>
                <td></td>
                <td></td>
                <td>${dto.request_id}</td>
                <td></td>
                <td>
                	<div id="d1${status.count}">
                	<c:choose>
                		<c:when test="${dto.receive_date eq null}">
		                    <button class="ui button pay" id="check${status.count}" data-value='{"id":"${dto.id}","divID":"d1${status.count}"}'>요청확인</button>
                		</c:when>
                		<c:otherwise>
                			<i class = 'check icon'></i>${dto.receive_date}
                		</c:otherwise>
                	</c:choose>
                    </div>
                </td>
            </tr>
            </c:forEach>

            </tbody>
        </table>

    </div>
</div>


<div class="ui form segment">
    <h1>결제예정</h1>
    <label>검색</label>
    <div class="ui icon input">
        <i class="search icon"></i>
        <input placeholder="검색어를 입력하세요" type="text">
    </div>
    <div class="field">

        <table class="ui celled table">
            <thead>

            <tr>
                <th>전표번호</th>
                <th>PO번호</th>
                <th>항목</th>
                <th>금액(USD) or 금액(KRW) </th>
                <th>송금계좌정보</th>
                <th>신천인아이디</th>
                <th>수령인아이디</th>
            </tr></thead>
            <tbody>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <button class="ui button" id="detail">상세</button>
                </td>
                <td></td>
                <td></td>
                <td>
                    <button class="ui button">결제완료</button>
                </td>
                 <td>
                    <button class="ui button" id="update">수정</button>
                    <button class="ui button" id="delete">삭제</button>
                </td>
            </tr>
            </tbody>
        </table>


    </div>
</div>



<div class="ui form segment">
    <h1>결제완료</h1>
    <label>검색</label>
    <div class="ui icon input">
        <i class="search icon"></i>
        <input placeholder="검색어를 입력하세요" type="text">
    </div>
    <div class="field">

        <table class="ui celled table">
            <thead>

            <tr>
                <th>전표번호</th>
                <th>PO번호</th>
                <th>항목</th>
                <th>송금금액(USD or KRW)</th>
                <th>수수료(USD or KRW)</th>
                <th>실송금액(USD or KRW)</th>
                <th>송금계좌정보</th>
                <th>송금증</th>
            </tr></thead>
            <tbody>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <button class="ui button" id="detail2">상세</button>
                </td>
                <td>
                    <button class="ui button" id="save">저장</button>
                </td>
                <td>
                    <button class="ui button" id="update2">수정</button>
                    <button class="ui button" id="delete2">삭제</button>
                </td>
            </tr>
            </tbody>
        </table>


    </div>
</div>





</div>





</body>
</html>