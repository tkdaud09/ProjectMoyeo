<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>
<hr>



   성공
    <br>

    <br>
 <input type="button" value="로그아웃"
  onclick="location.href='${pageContext.request.contextPath}/user/logout';">
  
   <input type="button" value="마지막 로그인"
  onclick="lastlogin();">
  
   <input type="button" value="마이페이지" id="idInput"
  onclick="gomypage('${id}');">
  
  <script>
  
  
  
   function lastlogin() {
       // user.jsp로 이동
       location.href = '${pageContext.request.contextPath}/user/user';
}
   
   function gomypage(id) {
	   // id 입력값 가져오기
	   var idValue = '<%= request.getParameter("id") %>';
	   
       // main.jsp로 이동
	   location.href = '${pageContext.request.contextPath}/user/mypage?id=' + idValue;
}

</script>
</body>
</html>