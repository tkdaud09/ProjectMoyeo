<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 빈 템플릿 페이지 --%>
<%-- TilesView 기능의 태그를 제공받지 않는 페이지만 사용 --%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<body>
	<div id="content">
		<tiles:insertAttribute name="content" />
	</div>
</body>
</html>