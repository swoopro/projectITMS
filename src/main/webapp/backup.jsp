<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


////////////// 모달창에서 필터 기능 ////////////////////
	
		// 모달창에서 필터 기능(단가입력 내림차순)
        $("#down").click(function(){ 
/*             var up = $("#up").children().text();
            console.log("up : " + up); */
            /* var code = $("#checkbox").parent().parent().parent().parent().parent().children().children().children().eq(1).text(); */
			var checkbox = $("input[name=checkbox]:checked"); // 체크 된(checked) 레코드의 값을 가져옴
            var code = checkbox.parent().parent().parent().parent().parent().children().children().children().eq(1).text();
			console.log(code);
            
	        $.ajax({
				url : "priceHistory", // url: 가져올 페이지(controller에서 받아줄 @RequestMapping 주소)
				data : {
					code : code
				},
				
				// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					console.log(result);
					$("#content").empty();
					$(result).each(function(index, data){
						console.log(index + " ~~~~~ " + data);
						$("#content").append('<tr><td>'+data.code
								+'</td><td>'+data.name
								+'</td><td>'+data.spec
								+'</td><td>'+data.price
								+'</td><td>'+dateTimeFormat('/Date('+data.date+')/')
								+'</td></tr>');
					})
					$(".ui.modal").modal("show");
/* 					$(".ui.dropdown").dropdown({
						placeholder : 'false'
					}) */
				} // success
			}); // ajax end     
        }); // click end
        
        
        // 모달창에서 필터 기능(단가입력 오름차순)
        $("#up").click(function(){ 
/*             var up = $("#up").children().text();
            console.log("up : " + up); */
            /* var code = $("#checkbox").parent().parent().parent().parent().parent().children().children().children().eq(1).text(); */
			var checkbox = $("input[name=checkbox]:checked"); // 체크 된(checked) 레코드의 값을 가져옴
            var code = checkbox.parent().parent().parent().parent().parent().children().children().children().eq(1).text();
			console.log(code);
            
	        $.ajax({
				url : "priceHistoryUp", // url: 가져올 페이지(controller에서 받아줄 @RequestMapping 주소)
				data : {
					code : code
				},
				
				// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
				success : function(result) {
					console.log(result);
					$("#content").empty();
					$(result).each(function(index, data){
						console.log(index + " ~~~~~ " + data);
						$("#content").append('<tr><td>'+data.code
								+'</td><td>'+data.name
								+'</td><td>'+data.spec
								+'</td><td>'+data.price
								+'</td><td>'+dateTimeFormat('/Date('+data.date+')/')
								+'</td></tr>');
					})
					$(".ui.modal").modal("show");
				} // success
			}); // ajax end     
        }); // click end
        
        
        
        
        
        
        /////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        
        
                $("#down").click(function() {
	   		var down = $("#down").val();
	        console.log("down : " + down);
		}); // click end (#down)
			
		$("#up").click(function() {
	    	var up = $("#up").val();
	        console.log("up : " + up);		
		}); // click end (#up) */
			
			
/*             var down = $("#down").val();
	        console.log("down : " + down);
	        var up = $("#up").val();
            console.log("up : " + up); */
            
             
			var flag = 0;
            var filter;
            
            if (flag == 0) {
				filter = down;
		        $.ajax({
					url : "priceHistory", // url: 가져올 페이지(controller에서 받아줄 @RequestMapping 주소)
					data : {
						code : code,
						filter : filter
					},
					
					// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
					success : function(result) {
						console.log(result);
						$("#content").empty();
						$(result).each(function(index, data){
							/* console.log(index + " ~~~~~ " + data); */
							$("#content").append('<tr><td>'+data.code
									+'</td><td>'+data.name
									+'</td><td>'+data.spec
									+'</td><td>'+data.price
									+'</td><td>'+dateTimeFormat('/Date('+data.date+')/')
									+'</td></tr>');
						})
					} // success
				}); // ajax end 
				flag = 1;
			}else if(flag == 1){
				filter = up;
		        $.ajax({
					url : "priceHistory", // url: 가져올 페이지(controller에서 받아줄 @RequestMapping 주소)
					data : {
						code : code,
						filter : filter
					},
					
					// 전송 완료 시 function(가져올 페이지의 결과값 result)을 실행
					success : function(result) {
						console.log(result);
						$("#content").empty();
						$(result).each(function(index, data){
							/* console.log(index + " ~~~~~ " + data); */
							$("#content").append('<tr><td>'+data.code
									+'</td><td>'+data.name
									+'</td><td>'+data.spec
									+'</td><td>'+data.price
									+'</td><td>'+dateTimeFormat('/Date('+data.date+')/')
									+'</td></tr>');
						})
					} // success
				}); // ajax end     
				flag = 0;
			}
            console.log(filter);







///////////////////////////////////////////////////////////////////////////////////////////////////


		 			b_type : b_type,
		 			b_name : b_name,
		 			b_ceo : b_ceo,
		 			b_addr : b_addr,
		 			b_tel : b_tel,
		 			b_country_code : b_country_code,
		 			a_name : a_name,
		 			a_tel : a_tel,
		 			a_c_key : a_c_key,
		 			a_c_value : a_c_value



















</body>
</html>