<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>   
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
    
     /* 탭 스타일 */
.tab-container ul {
    list-style-type: none;
    padding: 0;
    display: flex; /* 탭을 가로로 정렬 */
    justify-content: center; /* 가운데 정렬 */
}

.tab-container ul li {
    font-size: 40px;
    margin-right: 40px;
    position: relative; /* 탭에 그림자를 추가하기 위해 position 설정 */
}

.tab-container ul li a {
    text-decoration: none;
    color: #555;
    padding: 10px 20px;
    border: 2px solid transparent; /* 초기 테두리 투명 */
    border-radius: 5px;
    background-color: #f8f8f8;
    transition: all 0.3s ease; /* 호버 효과 부드럽게 적용 */
}

.tab-container ul li.active a {
    background-color: #007bff;
    color: #fff;
    border-color: #007bff; /* 활성화된 탭의 테두리 색상 설정 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
}

.tab-container ul li a:hover {
    background-color: #007bff;
    color: #fff;
    border-color: #007bff; /* 호버 시 테두리 색상 설정 */
}

.tab-container ul li.active a {
    background-color: #007bff;
    color: #fff;
}
        /* 가로로 이벤트 목록 나열하기 */
        .event_con ul {
            display: inline-block;
            margin: 10px;
            vertical-align: top; /* 위 정렬 */
            width: calc(33.33% - 30px); /* 가로 여백 제외한 33.33% 너비 */
            box-sizing: border-box; /* 여백을 너비에 포함 */
            text-align: center; /* 가운데 정렬 */
        }

        /* 이벤트 탭 버튼 스타일 */
        .tab-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }

        /* 선택된 탭 버튼 스타일 */
        .tab-button.selected {
            background-color: #0056b3; /* 선택된 탭 색상 */
        }

        /* 이벤트 목록 컨테이너 스타일 */
        .event_con {
            text-align: center;
        }

        /* 이벤트 목록 탭 컨테이너 스타일 */
        #eventTabs {
            text-align: center;
            margin-bottom: 20px;
        }

        /* 페이지 번호 스타일 */
        .page_t a, .page_t span {
            display: inline-block;
            margin-right: 5px;
            text-decoration: none;
            padding: 5px 10px;
            background-color: #f2f2f2;
            color: #333;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .page_t a:hover {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>
<body id="body" class="up-scroll">
<div class="main-wrapper packages-grid">

    <!-- ====================================
    ———    PAGE TITLE
    ===================================== -->
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

    <!-- ====================================
    ———    event SECTION
    ===================================== -->
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
        <!-- 진행 중인 이벤트만을 출력합니다. -->
        <ul>
            <li class="li_1">
                <a href="<c:url value='/event/detail/'/>${event.eventIdx}">
                    <img class="card-img-top rounded lazyestload" width="250" height="300" data-src="${pageContext.request.contextPath}/assets/img/upload/${event.eventPreviewimg}" alt="Card image cap">
                </a>
            </li>
            <li class="li_2">${event.eventTitle}</li>
            <li class="li_2">기간: ${event.eventStartdate.substring(0, 10)} ~ ${event.eventEnddate.substring(0, 10)}</li> <!-- 시간 정보 제외 -->
        </ul>
    </c:forEach>
</div>
 <div class="sel-search">
                    <form action="<c:url value="/event/close"/>" method="post" class="search-area">
                        <div class="sel-search">
        			<select class="sel-base" id="schKeyword" name="type">
            			<!-- <option value="TC">제목+내용</option> -->
            			<option value="event_title">제목</option>
        			</select> 
        			</div>
        			
        			<div class="inp-search">
        			<input type="text" class="inp-base" id="schValue" name="keyword" placeholder="검색어를 입력하세요">
        			<button type="submit" class="btn-type-s search" id="btnSearch" >검색</button>
    			</div> 
    			<sec:csrfInput/>     
    			</form>   	

<div class="page_t">
                        <div class="page_t">
                        <%-- 페이지 번호 출력 --%>
                        <c:choose>
                           <c:when test="${result1.pager.startPage > result1.pager.blockSize }">
                              <a
                                 href="<c:url value="/event/close"/>?pageNum=${result1.pager.prevPage}&type=${search1.type}&keyword=${search1.keyword}">
                                 [이전]
                              </a>
                           </c:when>
                           <c:otherwise>
                               [이전]
                           </c:otherwise>
                        </c:choose>

                        <c:forEach var="i" begin="${result1.pager.startPage }" end="${result1.pager.endPage }" step="1">
                           <c:choose>
                              <c:when test="${result1.pager.pageNum != i  }">
                                 <a href="<c:url value="/event/close"/>?pageNum=${i}&type=${search1.type}&keyword=${search1.keyword}"><span class="p_num">${i }</span></a>
                              </c:when>
                              <c:otherwise>
                                 <span class="p_num">${i }</span>
                              </c:otherwise>
                           </c:choose>
                        </c:forEach>

                        <c:choose>
                           <c:when test="${result1.pager.endPage != result1.pager.totalPage }">
                              <a
                                 href="<c:url value="/event/close"/>?pageNum=${result1.pager.nextPage}&type=${search1.type}&keyword=${search1.keyword}"><span class="p_next">
                                    [다음]
                              </span></a>
                           </c:when>
                           <c:otherwise>
                               [다음] 
                           </c:otherwise>
                        </c:choose>
                     </div>
            </div>

                </div><!-- /diy_content -->
            </div> <!-- /py-10 -->
        </div> <!-- /container -->
    </section>

    <script>
        
        
    </script>
</body>
</html>



  </body>
</html>    


                </div><!-- /diy_content -->
            </div> <!-- /py-10 -->
        </div> <!-- /container -->
    </section>

    <script>
        
        
    </script>
</body>
</html>



  </body>
</html>