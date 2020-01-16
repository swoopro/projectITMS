<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.css">
    <script src="${pageContext.request.contextPath}/resources/include/Semantic-Master/semantic.js"></script>
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
    });
</script>
<div><div id="nav_html">
    <div class="ui sidebar inverted vertical menu">
        <div class="item">
            <div class="header">업무관리</div>
            <div class="menu">
                <a class="item" href="${pageContext.request.contextPath}/operation/customer/customerRead">
                거래처관리
                </a>
                <a class="item" href="${pageContext.request.contextPath}/operation/product/productRead.do">
                    제품관리
                </a>
                <a class="item" href="${pageContext.request.contextPath}/operation/price/priceRead">
                    단가이력관리
                </a>
            </div>
        </div>
        <div class="item">
            <div class="header">수출관리</div>
        </div>
        <div class="item">
            <div class="header">수입관리</div>
        </div>
        <div class="item">
            <div class="header">재무관리</div>
            <div class="menu">
                <a class="item">
                    결제요청관리
                </a>
                <a class="item">
                    입금요청관리
                </a>
                <a class="item">
                    입출금관리
                </a>
            </div>
        </div>
        <div class="item">
            <div class="header">종합보고</div>
            <div class="menu">
                <a class="item">
                    월별집계표
                </a>
                <a class="item">
                    수출입관리대장
                </a>
                <a class="item">
                    개별보고작성
                </a>
            </div>
        </div>
    </div>
</div>
<div class="ui stackable menu">
    <a class="active item" id="open_menu">
        <i class="align justify icon"></i>
    </a>

    <div class="right menu">
    	<a href="${pageContext.request.contextPath}/logout"><div class="item"><i class="power off icon"></i></div></a>
        <a href="${pageContext.request.contextPath}"><div class="item">
            <i class="home icon"></i>
        </div></a>
        <c:choose>
        	<c:when test="${id eq null}">
		        <a href="${pageContext.request.contextPath}/user/corporate/corporateInfo"><div class="item">
		            <i class="user icon"></i>
		        </div></a>
		        <div class="item">
		            <div class="ui dropdown"><i class="users icon"></i>
		                <div class="menu">
		                    <a class="item" href="${pageContext.request.contextPath}/user/division/deptInfo?curPage=1&key=&value=">
		                    	부서관리
		                    </a>
		                    <a class="item" href="${pageContext.request.contextPath}/user/usermanage/authority?curPage=1&key=&value=">권한관리</a>
		                    <a class="item" href="${pageContext.request.contextPath}/user/account/accountInfo?curPage=1&key=&value=">법인계좌관리</a>
		                </div>
		            </div>
		        </div>
        	</c:when>
        	<c:otherwise>
		        <a href="${pageContext.request.contextPath}/user/usermanage/userInfo"><div class="item">
		            <i class="user icon"></i>
		        </div></a>
        	</c:otherwise>
        </c:choose>
    </div>
</div>
</div>