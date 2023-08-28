<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moyeo</title>
</head>
<style>
    .admin{
        max-width: 1200px;
        margin: 0 auto;
        height: 600px;
    }
    
    .admin h1{
        text-align: center;
        margin-top: 15%;
    }
    
    .admin ul{
        width: 40%;
        height: auto;
        list-style: none;
        margin: 0px auto;
        margin-top: 50px;
    }
    
    .admin ul li{
        float: left;
        width: 30%;
        height: 130px;
        margin-right: 2%;
        margin-bottom: 2%;

    }
    
    .admin ul li input{
        width: 100%;
        height: 100%;
        font-size: 1em;
        background: #fff;
        border: 1px solid #000;
        color: #000;
        cursor: pointer;
        line-height: 100px;
    }
</style>

<body>
<div class="admin">
    <h1>관리자 페이지</h1>
    <ul>
         <li><input type="button" value="패키지 등록"
                    onclick="location.href='${pageContext.request.contextPath}/package/form';"></li>
         <li><input type="button" value="패키지 관리"
                    onclick="location.href='#"></li>
	     <li><input type="button" value="이벤트 등록"
	                onclick="location.href='#"></li>
	     <li><input type="button" value="DIY 관리"
	                onclick="location.href='#"></li>
         <li><input type="button" value="공지사항 관리"
	                onclick="location.href='#"></li> 	
	     <li><input type="button" value="1:1 문의 관리"
	                onclick="location.href='#"></li> 	        
    </ul>
</div>
</body>
</html>