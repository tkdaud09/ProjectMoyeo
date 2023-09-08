<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  
<head>
</head>     

<body id="body" class="up-scroll">
  <div class="main-wrapper packages-grid">


<!-- ====================================
———   PAGE TITLE
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
———   DIY SECTION
===================================== -->

<section class="">
  <div class="container">
         <div class="py-10">
         <div class="review_content border_con">
            
            <div class="diy_form_title">
               공지사항
            </div>
            
            <div class="bord_search">
               
               <div class="search-area">   
                  <div class="sel-search">
                     <select class="sel-base" id="schKeyword">
                        <option value="both">제목+내용</option>
                        <option value="sub">제목</option>
                        <option value="cont">내용</option>
                     </select>
                  </div>
                  
                  <div class="inp-search">
                     <input  type="text" class="inp-base" id="schValue" placeholder="검색어를 입력하세요">
                     <button class="btn-type-s search" id="btnSearch">검색</button>
                  </div>
               </div><!-- search-area -->

            </div>
            
            
            
            
            <div class="review_list border_list">

                     <table>
                        <colgroup>
                           <col width="10%">
                           <col width="65%">
                           <col width="10%">
                           <col width="15%">
                        </colgroup>
                        <tr>
                           <td class="t1">번호</td>
                           <td class="t1">제목</td>
                           <td class="t1">작성자</td>
                           <td class="t1">작성일</td>
                           <td class="t1">조회수</td>
                        </tr>

                        
                        <c:forEach var="notice" items="${noticeList }">
                           <tr>
                              <td class="t2">${notice.noticeIdx }</td>
                              <td class="t2"><a href="${pageContext.request.contextPath}/notice/view/${notice.noticeIdx}" >${notice.noticeTitle}</a></td>

                              <td class="t2">${notice.userinfoId }</td>
                              <td class="t2">${notice.noticeRegDate }</td>
                              <td class="t2">${notice.noticeViewcnt }</td>
                           </tr>

                        </c:forEach>

                     </table>

                     <div class="page_t">
                        <%-- 페이지 번호 출력 --%>
                        <c:choose>
                           <c:when test="${pager.startPage > pager.blockSize }">
                              <a
                                 href="<c:url value="/notice/"/>?pageNum=${pager.prevPage}">
                                 [이전]
                              </a>
                           </c:when>
                           <c:otherwise>
                               [이전]
                           </c:otherwise>
                        </c:choose>

                        <c:forEach var="i" begin="${pager.startPage }"
                           end="${pager.endPage }" step="1">
                           <c:choose>
                              <c:when test="${pager.pageNum != i  }">
                                 <a href="<c:url value="/notice/"/>?pageNum=${i}"><span
                                    class="p_num">${i }</span></a>
                              </c:when>
                              <c:otherwise>
                                 <span class="p_num">${i }</span>
                              </c:otherwise>
                           </c:choose>
                        </c:forEach>

                        <c:choose>
                           <c:when test="${pager.endPage != pager.totalPage }">
                              <a
                                 href="<c:url value="/notice/"/>?pageNum=${pager.nextPage}"><span
                                 class="p_next">
                                    [다음]
                              </span></a>
                           </c:when>
                           <c:otherwise>
                               [다음] 
                           </c:otherwise>
                        </c:choose>
                     </div>




                     <a href="${pageContext.request.contextPath}/notice/write"; class="btn_right">
                  <button class="btn">글쓰기</button>
               </a>
            
            
            
            
            
            
            </div>
            
            
            
            
            
            


         </div><!-- /notice_content -->
      </div>   <!-- /py-10 -->
    </div>   <!-- /container -->
</section>


 </div>
    <script>
       let enrollForm = $("#enrollForm");

       // Enroll button
       $("#enrollBtn").click(function(e) {
           e.preventDefault();
           console.log("Enroll button clicked");
           enrollForm.submit();
       });
   </script>
  



  </body>
</html>