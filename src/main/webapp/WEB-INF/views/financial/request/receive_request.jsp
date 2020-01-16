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
	$(function () {
		$("#save").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/request/receive_save";
			var name = "save";
			var option = "width=800, height=800, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		
		$("#update").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/request/receive_update";
			var name = "update";
			var option = "width=1000, height=240, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		
		$("#update2").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/request/receive_update2";
			var name = "update2";
			var option = "width=1000, height=240, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		
		$("#detail").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/request/receive_sender_detail";
			var name = "sender_detail";
			var option = "width=1100, height=230, top=100, left=200, location=no";
			window.open(url, name, option);
		});
		
	});	
</script>
    
    
</head>
<body>

<div class="content_body">

<div class="ui form segment">

    <h1>입금예정</h1>
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
                <th>invoice no.</th>
                <th>수취은행</th>
                <th>계좌정보</th>
                <th>예정금액(USD or KRW)</th>
                <th>신청인아이디</th>
                <th>수령인아이디</th>
                <th>상대회사담당자</th>
                <th>항목(비고)</th>
                <th>요청한날짜</th>
                <th>입금 확인</th>
            </tr></thead>
            <tbody>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <button class="ui button">입금확인</button>
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
    <h1>입금완료</h1>
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
                <th>invoice no.</th>
                <th>수취은행</th>
                <th>수취계좌</th>
                <th>보낸분정보</th>
                <th>예정금액(USD or KRW)</th>
                <th>실수령액(USD or KRW)</th>
                <th>원화환산액(KRW) 한화일때만</th>
                <th>상대회사담당자</th>
                <th>항목</th>
                <th>날짜</th>
                <th>송금증</th>
            </tr></thead>
            <tbody>
            <tr>
                <td>1000100</td>
                <td>511520</td>
                <td>china bank</td>
                <td>100-2-1555-55</td>
                <td>
                    <button class="ui button" id="detail">상세</button>
                </td>
                <td>750.00</td>
                <td>650.00</td>
                <td>800,000</td>
                <td>750.00</td>
                <td>650.00</td>
                <td>650.00</td>
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
</body>
</html>