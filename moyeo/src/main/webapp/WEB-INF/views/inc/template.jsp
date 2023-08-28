<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 템플릿 페이지 --%>    
<%-- TilesView 기능의 태그를 제공받기 위한 tags-tiles 태그 라이브러리를 JSP 문서에 포함 --%>    
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>    
<!DOCTYPE html>
<html>
<head>
	<tiles:insertAttribute name="head" />
</head>
<body>
	
	<div id="header">
		<%-- insertAttribute 태그 : TilesView 프로그램의 환경설정파일에서 put-attribute 엘리먼트로
		제공된 JSP 문서의 실행결과를 제공받아 삽입하기 위한 태그 --%>
		<tiles:insertAttribute name="header"/>
	</div>
	
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
	
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>








