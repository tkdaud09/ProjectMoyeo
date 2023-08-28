<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
  
<head>
</head>     
  
<body id="body" class="up-scroll">

  <div class="main-wrapper packages-grid"></div>


<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg6.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">공지사항</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	DIY SECTION
===================================== -->



    <h1>공지사항 목록</h1>
    
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <tr th:each="notice : ${noticeList}">
                <td th:text="${notice.noticeNum}"></td>
                <td><a th:href="@{/notice/view/{noticeIdx}(noticeIdx=${notice.noticeNum})}" th:text="${notice.noticeTitle}"></a></td>
                <td th:text="${notice.noticeRegdate}"></td>
            </tr>
        </tbody>
    </table>
    
    <!-- 생성, 수정, 삭제 등의 링크를 추가하세요 -->
    <a th:href="@{/notice/create}">새로운 공지사항 작성</a>
    
    <div th:if="${message}">
        <p th:text="${message}" style="color: green;"></p>
    </div>
    
</body>
</html>












<!-- ----------------------------------------------- -->


  </body>
</html>
