<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="UTF-8">

  <style>
        .far fa-heart{
            color: red;
        }
        
        .comment {
        white-space: normal;
        width: 300px;
        overflow: hidden;
        line-height: 1.2;
        height: 3.6em;
        text-overflow: ellipsis;
        display: -webkit-box;
         -webkit-line-clamp : 3;
         -webkit-box-orient: vertical;
    	}
    	
    	.search-area1 {
		  display: flex;
		  justify-content: flex-end;
		}
		
	
    </style>
    
   <head>
	<jsp:include page="/WEB-INF/views/inc/head.jsp"/>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>  
  
<body id="body" class="up-scroll">

  

<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg7.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">DIY List</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	BOOKING SECTION
===================================== -->

<section class="py-9 py-md-10">
  <div class="container">
    
      <!-- 오른쪽 위치 
     <div class="col-lg-4 col-xl-3 offset-lg-8 offset-xl-9 "></div> -->
      <div class="col-md-6 col-lg-12 diy_ser">
         <form action="<c:url value="/diy/diy_list"/>" method="GET" class="search-area">
            <div class="rounded mb-4">
               <select class="sel-base" name="column" >
                  <option value="diy_title">제목</option>
                  <option value="diy_content">내용</option>
                    <option value="diy_loc" >지역</option>
               </select>
            </div>
            
            <div class="input-group-sm rounded mb-4">
               <input class="inp-base" type="text" name="keyword" placeholder="검색어를 입력하세요">
               <button class="input-group-text border-0 btn bg-primary" type="submit" style="padding: 9px 20px; margin-top: -2px;">
                      <i class="fa fa-search text-white" aria-hidden="true"></i>
                    </button>
                   <a href="${pageContext.request.contextPath}/diy/diy_list" class="btn btn-secondary btn-sm" style="padding: 8px 20px;margin-top: -2px;">
                      초기화
                    </a>
            </div>
            
            <div style="text-align:right;">
              <button class="btn btn-secondary btn-sm" name="type" value="recently" type="submit" style="padding: 9px 20px; margin-top: -18px;">
                    최신순
                  </button>
                  <button class="btn btn-secondary btn-sm" name="type" value="love" type="submit" style="padding: 9px 20px; margin-top: -18px;" >
                    인기순
                  </button>
                </div>
            
         </form>   
      </div><!-- //bord_search //diy_ser-->
     <!-- //bord_search -->

	  
				
                    

         
      <div class="container">
       <div class="row">
       
         
          <c:choose>
       	    <c:when test="${empty(diyList.diyList) }">
 		      <tr align="center">
			    <td colspan="5">작성된 글이 없습니다.</td>
		      </tr>	
 			</c:when>
    			
    	    <c:otherwise>
          	  <c:forEach var="diyList" items="${diyList.diyList}" varStatus="status">
                <div class="col-md-6 col-lg-4">
                  <div class="card card-transparent mb-7">
                    
                    <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="position-relative">
                      <!-- <img class="card-img-top rounded lazyestload" src="<c:url value='/assets/img/upload/${diyList.diyThumbnail}' />" alt="diyThumbnail"> -->
                      <img class="card-img-top rounded lazyestload" width="250" height="300" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyThumbnail}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyThumbnail}" alt="image"> 
                    </a>

                      <div class="card-body py-6">
                        <h3 class="mb-4">
                          <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="text-capitalize text-dark hover-text-primary">${diyList.diyTitle}</a>
                        </h3>
                            
        					

                        <div class="meta-post-sm mb-4">
                          <ul class="list-unstyled d-flex flex-wrap mb-0">
                            <li class="meta-tag me-4 mb-1">
                              <i class="fa fa-user text-gray-color" aria-hidden="true"></i>
                                <a class="text-gray-color hover-text-primary">
                                  <span class="ms-1 text-capitalize">${diyList.diyPeople}명</span>
                                </a>
                            </li>
                                  
                            <li class="meta-tag text-gray-color me-4 mb-1">
			                  <i class="fas fa-calendar-alt" aria-hidden="true"></i>
			                  <span class="ms-1 text-capitalize">${diyList.diyStartdate}~${diyList.diyEnddate}</span>
			                </li>
			
			                <li class="meta-tag text-gray-color me-4 mb-1">
			                  <i class="fa fa fa-tags" aria-hidden="true"></i>
			                  <span class="ms-1 text-capitalize">${diyList.diyLoc}</span>
			                </li>
			                
			                <li class="meta-tag text-gray-color me-4 mb-1">
			                  <i class="fa fa-envelope" aria-hidden="true"></i>
			                  <span class="ms-1 text-capitalize">1</span>
			                </li>
                                    
                          </ul>
                        </div>

                            <p class="comment">${diyList.diyIntroduction}</p>
                            <input name="userinfoId" value="${userinfo.id}">
						    <input type="hidden" name="diyIdx" value="${diyList.diyIdx }">
                      </div>
                      
                     	  
                    <c:if test="${!empty(userinfo.id)}">
                      <c:if test="${diyLove.loveStatus eq null}">
                        <div class="card-footer px-5">
		              	  <a href="javascript: " class="btn btn-xs btn-outline-secondary"> 
			              <i id="heartIcon" class="far fa-heart" aria-hidden="false"> ${diyList.loveCount}</i>
			              </a>
		              	  <input type="hidden" name="userinfoId" value="${userinfo.id }">
		     		      <input type="hidden" name="diyIdx" value="${diyList.diyIdx }">
		                  <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
		                </div>
                      </c:if>
                      
                      <c:if test="${diyLove.loveStatus ne null}">
                        <div class="card-footer px-5">
		                  <a href="javascript: " class="btn btn-xs btn-outline-secondary"> 
			              <i id="heartIcon" class="far fa-heart" aria-hidden="false"> ${diyList.loveCount}</i>
			              </a>
		              	  <input type="hidden" name="userinfoId" value="${userinfo.id }">
		     		      <input type="hidden" name="diyIdx" value="${diyList.diyIdx }">
		                  <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
		                </div>
                      </c:if>
                    </c:if>
                    
                    
                    <c:if test="${empty(userinfo.id)}">
                      <div class="card-footer px-5">
			   	        <a href="javascript: " class="btn btn-xs btn-outline-secondary"> 
			            <i id="heartIcon" class="far fa-heart" aria-hidden="false"> ${diyList.loveCount}</i>
			            </a>
			            <input type="hidden" name="userinfoId" value="${userinfo.id }">
		     		    <input type="hidden" name="diyIdx" value="${diyList.diyIdx }">
			            <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
			          </div>
                    </c:if>
			            
					  <%-- <!-- 로그인 상태일때 하트 클릭 이벤트 처리 -->
					  <c:choose>
				   	    <c:when test="${!empty(userinfo.id)}">
				   	      <c:choose>
					     	<c:when test="${empty(loveStatus.loveStatus)}">
					    	  <div class="card-footer px-5">
				              	 <a href="javascript: loveCheck_func();" class="btn btn-xs btn-outline-secondary" id="btn_love">
				                 <i id="heartIcon" class="far fa-heart" aria-hidden="false">${diyList.loveCount}</i>
				                 </a>
				              	 <input type="hidden" name="userinfoId" value="${userinfo.id }">
				     		     <input type="hidden" name="diyIdx" value="${diyList.diyIdx }">
				                 <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
				               </div>
					     	 </c:when>
					    	
					    	 <c:otherwise>
					    	   <div class="card-footer px-5">
				                 <a href="javascript: loveCancle_func();" class="btn btn-xs btn-outline-secondary">
				                 <i id="heartIcon" class="fas fa-heart" aria-hidden="false"> ${diyList.loveCount}</i>
				                 </a>
				              	 <input type="hidden" name="userinfoId" value="${userinfo.id }">
				     		     <input type="hidden" name="diyIdx" value="${diyList.diyIdx }">
				                 <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
				               </div>
					    	 </c:otherwise>
						   </c:choose>
				   	    </c:when>
				   	  
				   	    <c:otherwise>
				   	      <div class="card-footer px-5">
				   	        <a href="javascript: Login();" class="btn btn-xs btn-outline-secondary"> 
				            <i id="heartIcon" class="far fa-heart" aria-hidden="false"> ${diyList.loveCount}
				            </i>
				            </a>
				            <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
				          </div>
				   	    </c:otherwise>
				   	  </c:choose> --%>
			           
                      
                  </div>
                </div>
         	  </c:forEach>
            </c:otherwise>
          </c:choose>
        </div>
   	  </div>
   	  
   	  <c:choose>
   	    <c:when test="${userinfo.id ne null}">
   	      <div class="text-center text-md-start text-lg-end">
            <a href="${pageContext.request.contextPath}/diy/diy_add" class="btn btn-primary text-uppercase">작성하기</a>
          </div>
   	    </c:when>
   	  
   	    <c:otherwise>
   	      <div class="text-center text-md-start text-lg-end">
            <a class="btn btn-primary text-uppercase" onclick="Login()">작성하기</a>
          </div>  
   	    </c:otherwise>
   	  </c:choose>
           
  

  <!-- ====================================
———	PAGINATION
===================================== -->
    <div class="page_t">
      <c:choose>
        <c:when test="${diyList.pager.startPage > diyList.pager.blockSize }">
          <a href="<c:url value="/diy/diy_list"/>?pageNum=${pager.prevPage}&column=${search.column}&keyword=${search.keyword}">[이전]</a>
          <i class="fas fa-long-arrow-alt-left d-none d-md-inline-block me-md-1" aria-hidden="true"></i>
        </c:when>
        <c:otherwise>
        <!-- [이전] -->
        </c:otherwise>
      </c:choose>	
    
      <c:forEach var="i" begin="${diyList.pager.startPage }" end="${diyList.pager.endPage }" step="1">
        <c:choose>
          <c:when test="${diyList.pager.pageNum != i  }">
            <a href="<c:url value="/diy/diy_list"/>?pageNum=${i}&column=${search.column}&keyword=${search.keyword}&type=${search.type}"><span class="p_num">${i }</span></a>
          </c:when>
          <c:otherwise>
            <span class="p_num">${i }</span>
          </c:otherwise>
        </c:choose>	
      </c:forEach>
    
      <c:choose>
        <c:when test="${diyList.pager.endPage != diyList.pager.totalPage }">
          <a href="<c:url value="/diy/diy_list"/>?pageNum=${pager.nextPage}&column=${search.column}&keyword=${search.keyword}">[다음]</a>
          <i class="fas fa-long-arrow-alt-right d-none d-md-inline-block ms-md-1" aria-hidden="true"></i>
        </c:when>
        <c:otherwise>
        <!-- [다음] -->
        </c:otherwise>
      </c:choose>	
    </div>
  </div>
</section>
  
      <!-- Javascript -->
    <script>
	function Login() {
		 if (confirm("로그인 후 이용 가능합니다. 로그인하시겠습니까?")) {
		    	
		        window.location.href = "${pageContext.request.contextPath}/user/login"; 
		    } else {
		        
		    }
	}
	</script>
	
   
    <script src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/menuzord/js/menuzord.js"></script>
    
    <script src='${pageContext.request.contextPath}/assets/plugins/fancybox/jquery.fancybox.min.js'></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/lazyestload/lazyestload.js"></script>
    
    <script src='${pageContext.request.contextPath}/assets/plugins/selectric/jquery.selectric.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/moment.min.js'></script>
    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/daterangepicker.min.js'></script>
    
    <script src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
    
    <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>
  </body>
</html>