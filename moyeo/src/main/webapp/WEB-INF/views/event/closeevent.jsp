<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="utf-8">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body id="body" class="up-scroll">
    <div class="main-wrapper packages-grid">
    
        <!-- 페이지 제목 -->
        <section class="page-title">
            <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg6.jpg);">
                <div class="container">
                    <div class="row align-items-center justify-content-center" style="height: 200px;">
                        <div class="col-lg-6">
                            <div class="page-title-content">
                                <div class="title-border">
                                    <h2 class="text-uppercase text-white font-weight-bold">이벤트</h2>
                                </div>
                                <p class="text-white mb-0"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 이벤트 섹션 -->
        <section class="">
            <div class="container">
                <div class="py-10">
                    <div class="diy_content">
                        <div class="diy_form_title">
                            <div class="tab-container">
                                <ul>
                                    <li><a href="/moyeo/event/">진행 중인 이벤트</a></li>
                                    <li class="active"><a href="/moyeo/event/close">종료된 이벤트</a></li>
                                </ul>
                            </div>
                        </div>
                        
                        <!-- 진행 중인 이벤트 목록 -->
                        <div id="ongoingEvents" class="event_con">
                            <c:forEach items="${result1.closeEventList}" var="event">
                                <!-- 진행 중인 이벤트 목록 -->
                                <ul>
                                    <li class="li_1">
                                        <a href="<c:url value='/event/detail/'/>${event.eventIdx}">
                                            <img class="card-img-top rounded lazyestload" width="250" height="300" data-src="${pageContext.request.contextPath}/assets/img/upload/${event.eventPreviewimg}" alt="Card image cap">
                                        </a>
                                    </li>
                                    <li class="li_2">${event.eventTitle}</li>
                                    <li class="li_3">${event.eventStartdate.substring(0, 10)} ~ ${event.eventEnddate.substring(0, 10)}</li> <!-- 시간 정보 제외 -->
                                </ul>
                            </c:forEach>
                        </div>
                        
                        <!-- 검색 양식 -->
                        <div class="sel-search">
                            <form action="<c:url value="/event/close"/>" method="post" class="search-area">
                                <div class="sel-search">
                                    <select class="sel-base" id="schKeyword" name="type">
                                        <!-- <option value="TC">제목+내용</option> -->
                                        <option value="event_title">제목</option>
                                    </select> 
                                </div>
                                
                                <div class="inp-search2">
                                    <input type="text" class="inp-base" id="schValue" name="keyword" placeholder="검색어를 입력하세요">
                                    <button type="submit" class="btn-type-s search" id="btnSearch">검색</button>
                                </div>      
                            </form>
                        </div>
                        
                        <!-- 페이지네이션 -->
                        <div class="page_t">
                            <div class="page_t">
                                <!-- 페이지 번호 -->
                                <c:choose>
                                   <c:when test="${result1.pager.startPage > result1.pager.blockSize }">
                                      <a href="<c:url value="/event/close"/>?pageNum=${result1.pager.prevPage}&type=${search1.type}&keyword=${search1.keyword}">
                                         [이전]
                                      </a>
                                   </c:when>
                                   <c:otherwise>
                                       [이전]
                                   </c:otherwise>
                                </c:choose>

                                <c:forEach var="i" begin="${result1.pager.startPage}" end="${result1.pager.endPage}" step="1">
                                   <c:choose>
                                      <c:when test="${result1.pager.pageNum != i  }">
                                         <a href="<c:url value="/event/close"/>?pageNum=${i}&type=${search1.type}&keyword=${search1.keyword}">
                                            <span class="p_num">${i}</span>
                                         </a>
                                      </c:when>
                                      <c:otherwise>
                                         <span class="p_num">${i}</span>
                                      </c:otherwise>
                                   </c:choose>
                                </c:forEach>

                                <c:choose>
                                   <c:when test="${result1.pager.endPage != result1.pager.totalPage }">
                                      <a href="<c:url value="/event/close"/>?pageNum=${result1.pager.nextPage}&type=${search1.type}&keyword=${search1.keyword}">
                                         <span class="p_next">[다음]</span>
                                      </a>
                                   </c:when>
                                   <c:otherwise>
                                       [다음] 
                                   </c:otherwise>
                                </c:choose>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script>
            // 자바스크립트 코드
        </script>
    </div>
</body>
</html>
