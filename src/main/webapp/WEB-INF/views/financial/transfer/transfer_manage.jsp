<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
>>>>>>> Stashed changes
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
		$("#update").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/transfer/transfer_update";
			var name = "update";
			var option = "width=1000, height=240, top=100, left=200, location=no";
			window.open(url, name, option);
		});
	});	
</script>
</head>
<body>

<div class="content_body">

<div class="ui form segment">

    <h1>입출금내역</h1>
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
                <th>날짜</th>
                <th>입금/출금</th>
                <th>내용</th>
                <th>금액(USD or KRW)</th>
                <th>잔액</th>
                <th>비고</th>
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
    <h1>입출금내역등록</h1>

    <div class="field">
        <table class="ui celled table" id="statement">
            <thead>
            <tr>
                <th>전표번호</th>
                <th >날짜</th>
                <th>입금/출금</th>
                <th >적요</th>
                <th >금액(USD or KRW)</th>
                <th >비고</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td ><div class="ui icon input"><input placeholder="전표번호" type="text"></div></td>
                <td ><div class="ui icon input"><input placeholder="날짜" type="text"></div></td>
                <td ><div class="ui icon input"><input placeholder="입금/출금" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="적요" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="금액" type="text"></div></td>
                <td><div class="ui icon input"><input placeholder="비고" type="text"></div></td>
            </tr>
        <div class="ui left floated icon buttons">
            <button class="ui button" id="btn-add-row"><i class="plus icon"></i></button>
            <button class="ui button" id="btn-del-row"><i class="minus icon"></i></button>
        </div>
            </tbody>
        <tfoot>
</div>

        <div class="field">
            <table class="ui definition table">
                <tbody>
                <tr>
                    <td colspan="4">합계</td>
                    <td colspan="1">현재잔액(KRW): 수식(한화)</td>
                    <td colspan="1">현재잔액(USD): 수식(달러)</td>
                </tr>
                </tbody>
        </div>
     
        <div class="ui right floated small primary labeled icon button">
            <i class="pencil alternate icon"></i>입출금내역등록
        </div>
        </tfoot>
        </table>
    </div>
</div>


<script>
	$('#btn-add-row').click(function () {
	    var time = new Date().toLocaleTimeString();
	    $('#statement> tbody:last').append(' <tr>\n' +
	        '                <td><div class="ui icon input"><input placeholder="전표번호" type="text"></div></td>\n' +
	        '                <td><div class="ui icon input"><input placeholder="날짜" type="text"></div></td>\n' +
	        '                <td><div class="ui icon input"><input placeholder="입금/출금" type="text"></div></td>\n' +
	        '                <td><div class="ui icon input"><input placeholder="내용" type="text"></div></td>\n' +
	        '                <td><div class="ui icon input"><input placeholder="금액" type="text"></div></td>\n' +
	        '                <td><div class="ui icon input"><input placeholder="비고" type="text"></div></td>\n' +
	        '            </tr>');
	});
	$('#btn-del-row').click(function () {
	    $('#statement > tbody:last > tr:last').remove();
	});

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
<<<<<<< Updated upstream
=======
=======
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
		var count = 0;
		
		
		$("#insertBtn").click(function() {
			for (var i = 0; i < count+1; i++) {
				console.log("ajax");
				console.log($("#finance_id"+i).val());
				console.log($("#action_type"+i).val());
				console.log($("#item"+i).val());
				console.log($("#amount_krw"+i).val());
				console.log($("#amount_hdc"+i).val());
				console.log($("#note"+i).val());
					$.ajax({
						url:"${pageContext.request.contextPath}/financialMng/transfer/insertAll",
						async:false,
						type: "POST",
						data:{
							finance_id : $("#finance_id"+i).val(),
							action_type : $("#action_type"+i).val(),
							item : $("#item"+i).val(),
							amount_krw : $("#amount_krw"+i).val(),
							amount_hdc : $("#amount_hdc"+i).val(),
							note : $("#note"+i).val()
						},
						success:function(){
							console.log("ajax success!!!!!")
						}
					}); //ajax end
			} //for end
			
			
 		});//insertBtn end
		
		
		$('#btn-add-row').click(function () {
			count = count + 1;
			
			
		    var time = new Date().toLocaleTimeString();
		    $('#statement> tbody:last').append(' <tr>\n' +
		        '                <td><div class="input"><input id="finance_id'+count+'" placeholder="재무고요번호" type="text"></div></td>\n' +
		        '                <td><select class="ui search dropdown" id="action_type'+count+'">\n'+
	    		'						<option value="">입금/출금</option>\n'+
	    		'						<option value="1">입금</option>\n'+
	    		'						<option value="2">출금</option>\n'+
	    		'					</select></td>\n' +
		        '                <td><select class="ui search dropdown" id="item'+count+'">\n'+
		        '       				<option value="">적요</option>\n'+
		        '        				<option value="1">수입물품대금</option>\n'+
		        '        				<option value="2">관세</option>\n'+
		        '        				<option value="3">물류비</option>	\n'+
		        '        				<option value="4">관리물류비</option>\n'+
		        '        				<option value="5">기타</option>\n'+
		        '       		</select></td>\n' +
		        '                <td><div class="input"><input id="amount_krw'+count+'" placeholder="금액" type="text"></div></td>\n' +
		        '                <td><div class="input"><input id="amount_hdc'+count+'" placeholder="수수료" type="text"></div></td>\n' +
		        '                <td><div class="input"><input id="note'+count+'" placeholder="비고" type="text"></div></td>\n' +
		        '            </tr>');
		});
		$('#btn-del-row').click(function () {
			count = count - 1;
		    $('#statement > tbody:last > tr:last').remove();
		});

	    $("#open_menu").click(function () {
	        $('.ui.sidebar').sidebar('setting','transition','overlay').sidebar('toggle');
	    });
	    $('.ui.dropdown').dropdown({
	        direction:'auto',
	        duration:100,
	        onChange:function(value, text, $choice){

	        }
	    });
		
		
		$("#update").click(function () {
			var url = "${pageContext.request.contextPath}/financialMng/transfer/transfer_update";
			var name = "update";
			var option = "width=1000, height=240, top=100, left=200, location=no";
			window.open(url, name, option);
		});
	});	
</script>
</head>
<body>

<div class="content_body">

<div class="ui form segment">

    <h1>입출금내역</h1>
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
	                <th>재무고유번호</th>
	                <th>입금/출금</th>
	                <th>적요</th>
	                <th>금액</th>
	                <th>수수료</th>
	                <th>날짜</th>
	                <th>비고</th>
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
    <h1>입출금내역등록</h1>

    <div class="field">
        <table class="ui celled table" id="statement">
            <thead>
	            <tr>
	                <th>재무고유번호</th>
	                <th>입금/출금</th>
	                <th>적요</th>
	                <th>금액</th>
	                <th>수수료</th>
	                <th>비고</th>
	            </tr>
            </thead>
            <tbody>
	            <tr>
	                <td><div class="input"><input id="finance_id0" placeholder="재무고유번호" type="text"></div></td>
	                <td><select class="ui search dropdown" id="action_type0">
	                		<option value="">입금/출금</option>
	                		<option value="1">입금</option>
	                		<option value="2">출금</option>
	                </select></td>
	                <td><select class="ui search dropdown" id="item0">
	                		<option value="">적요</option>
	                		<option value="1">수입물품대금</option>
	                		<option value="2">관세</option>
	                		<option value="3">물류비</option>	
	                		<option value="4">관리물류비</option>
	                		<option value="5">기타</option>
	                </select></td>
	                <td><div class="input"><input id="amount_krw0" placeholder="금액" type="text"></div></td>
					<td><div class="input"><input id="amount_hdc0" placeholder="수수료" type="text"></div></td>
	                <td><div class="input"><input id="note0" placeholder="비고" type="text"></div></td>
	            </tr>
        <div class="ui left floated icon buttons">
            <button class="ui button" id="btn-add-row"><i class="plus icon"></i></button>
            <button class="ui button" id="btn-del-row"><i class="minus icon"></i></button>
        </div>
            </tbody>
        </table>
</div>

        	<tfoot>
            <table class="ui definition table">
                <tbody>
                <tr>
                    <td colspan="4">합계</td>
                    <td colspan="1">현재잔액(KRW): 수식(한화)</td>
                    <td colspan="1">현재잔액(USD): 수식(달러)</td>
                </tr>
                </tbody>
     
        <div class="ui right floated small primary labeled icon button" id="insertBtn">
            <i class="pencil alternate icon"></i>입출금내역등록
        </div>
        </table>
        </tfoot>
    </div>
</div>

</body>
>>>>>>> Stashed changes
>>>>>>> Stashed changes
</html>