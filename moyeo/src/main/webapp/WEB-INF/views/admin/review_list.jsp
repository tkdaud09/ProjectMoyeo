<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html lang="en">
  
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>     

<body id="body" class="up-scroll">
  <div class="main-wrapper packages-grid">

<!-- ====================================
——— PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg6.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">여행후기</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ====================================
——— DIY SECTION
===================================== -->
<section class="">
   <div class="container">
      <div class="py-10">
         <div class="review_content border_con">
            <div class="diy_form_title">여행 후기</div>
            <div class="bord_search">
               
               <form action="<c:url value="/review/list"/>" method="post" class="search-area">
                  <div class="sel-search">
                     <select class="sel-base" name="column" >
                        <option value="userinfo_id">작성자</option>
                        <option value="review_title">제목</option>
                        <option value="review_content">내용</option>
                     </select>
                  </div>
                  
                  <div class="inp-search">
                     <input class="inp-base" type="text" name="keyword" placeholder="검색어를 입력하세요">
                     <button class="btn-type-s search" type="submit">검색</button>
                  </div>
                  <sec:csrfInput/>
               </form>   
                     
            </div><!-- //bord_search -->
            <div class="review_list border_list">   
               <table>
                  <colgroup>
                       <col width="10%">
                       <col width="60%">
                       <col width="10%">
                       <col width="15%">
                       <col width="5%">
                   </colgroup>
                   
                  <tr>
                     <td class="t1" >글번호</td>
                     <td class="t1" >제목</td>
                     <td class="t1" >작성자</td>
                     <td class="t1" >작성일</td>
                     <td class="t1" >조회수</td>
                  </tr>
                  
                  <c:choose>
                     <c:when test="${empty result.reviewList}">
                        <tr>
                           <td colspan="5">게시글이 없습니다.</td>
                        </tr>   
                     </c:when>      
   
                     <c:otherwise>
                        <c:forEach var="review" items="${result.reviewList}">
                           <tr>
                              <td class="t2">${review.reviewIdx}</td>
                              <td class="t2"><a href="<c:url value="/review/view"/>?reviewIdx=${review.reviewIdx}&pageNum=${search.pageNum}&column=${search.column}&keyword=${search.keyword}">${review.reviewTitle}</a></td>
                              <td class="t2">${review.userinfoId}</td>
                              <td class="t2"><fmt:formatDate var="formattedDate" value="${review.reviewRegdate}" pattern="yyyy-MM-dd" />${formattedDate}</td>
                              <td class="t2">${review.reviewViewcnt}</td>
                           </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
               </table>
            </div>
            
            <c:choose>
                   <c:when test="${userinfo.id ne null}">
                     <div class="btn_right">
                     <button class="btn" type="button" onclick="location.href='<c:url value="/review/write"/>';">글쓰기</button>
                   </div>
                   </c:when>
                 
                   <c:otherwise>
                     <div class="btn_right">
                       <button class="btn" type="button" onclick="Login()">글쓰기</button>
                   </div>  
                   </c:otherwise>
                 </c:choose>
                 
                 
                 <!--  <input type="text" name="userinfoId" value="${userinfo.id }">-->
            
            <div class="page_t">
               <c:choose>
                  <c:when test="${result.pager.startPage > result.pager.blockSize }">
                     <a href="<c:url value="/review/list"/>?pageNum=${pager.prevPage}&column=${search.column}&keyword=${search.keyword}"><!-- [이전] --></a>
                  </c:when>
                  <c:otherwise>
                     <!-- [이전]  -->
                  </c:otherwise>
               </c:choose>   
               <c:forEach var="i" begin="${result.pager.startPage }" end="${result.pager.endPage }" step="1">
                  <c:choose>
                     <c:when test="${result.pager.pageNum != i  }">
                        <a href="<c:url value="/review/list"/>?pageNum=${i}&column=${search.column}&keyword=${search.keyword}"><span class="p_num">${i }</span></a>
                     </c:when>
                     <c:otherwise>
                        <span class="p_num">${i }</span>
                     </c:otherwise>
                  </c:choose>   
               </c:forEach>
               <c:choose>
                  <c:when test="${result.pager.endPage != result.pager.totalPage }">
                     <a href="<c:url value="/review/list"/>?pageNum=${pager.nextPage}&column=${search.column}&keyword=${search.keyword}"><!-- [다음] --></a>
                  </c:when>
                  <c:otherwise>
                     <!-- [다음] -->
                  </c:otherwise>
               </c:choose>   
            </div>
         </div>
      </div>
   </div>
</section>
   </div>

   <script>
   function Login() {
       if (confirm("로그인 후 이용 가능합니다. 로그인하시겠습니까?")) {
             
              window.location.href = "${pageContext.request.contextPath}/user/login"; 
          } else {
              
          }
   }
   </script>
   
</body>
</html>