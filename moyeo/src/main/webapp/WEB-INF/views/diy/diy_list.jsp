<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    </style>
    
   <head>
<jsp:include page="/WEB-INF/views/inc/head.jsp"/>

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
    <div class="row">
    
      <div class="col-lg-4 col-xl-3 offset-lg-8 offset-xl-9">
        <div class="">
          <div class="row">
            <div class="col-md-6 col-lg-12">
              <div class="bg-smoke border border-light-gray rounded p-3 mb-4">
                  <select class="select-option" name="searchType">
					<option value="title">제목</option>
					<option value="content">내용</option>
			        <option value="loc" >지역</option>
			      </select>
                  
                  <div class="input-group input-group-sm">
                    <input type="text" name= "keyWord" class="form-control form-control-sm border-0" placeholder="">
                      <button class="input-group-text border-0 btn bg-primary" type="submit" name="btnSearch" id="btnSearch">
                        <i class="fa fa-search text-white" aria-hidden="true"></i>
                      </button>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>







         
      <div class="container">
       <div class="row">
       
       
         <!-- <div class="col-md-6 col-lg-12">
			<div class="bg-smoke border border-light-gray rounded p-3 mb-4">	
				<div class="search_area">
					<select class="select-option" id="schKeyword">
						<option value="both" >제목+내용</option>
						<option value="title">제목</option>
						<option value="contents">내용</option>
					</select>
				</div>
				
				<div class="inp-search">
					<input  type="text" class="form-control form-control-sm border-0" id="schValue" placeholder="검색어를 입력하세요">
					<button class="input-group-text border-0 btn bg-primary" id="btnSearch">검색</button>
				</div>
			</div>
	     </div> -->
        
          <c:choose>
       	    <c:when test="${empty(diyList) }">
 		      <tr align="center">
			    <td colspan="5">작성된 글이 없습니다.</td>
		      </tr>	
 			</c:when>
    			
    	    <c:otherwise>
          	  <c:forEach var="diyList" items="${diyList}">
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
                                  <span class="ms-1 text-capitalize">${diyList.diyPeople}</span>
                                </a>
                            </li>
                                  
                            <li class="meta-tag text-gray-color me-4 mb-1">
			                  <i class="fas fa-calendar-alt" aria-hidden="true"></i>
			                  <span class="ms-1 text-capitalize">${diyList.diyStartdate}</span>
			                </li>
			
			                <li class="meta-tag text-gray-color me-4 mb-1">
			                  <i class="fa fa fa-tags" aria-hidden="true"></i>
			                  <span class="ms-1 text-capitalize">${diyList.diyLoc}</span>
			                </li>
			                
			                <li class="meta-tag text-gray-color me-4 mb-1">
			                  <i class="fa fa-envelope" aria-hidden="true"></i>
			                  <span class="ms-1 text-capitalize">${diyList.diyRegdate}</span>
			                </li>
			                
			
			                <li class="meta-tag text-gray-color me-4 mb-1">
			                  <i class="fa fa-envelope" aria-hidden="true"></i>
			                  <span class="ms-1 text-capitalize">0</span>
			                </li>
                                    
                          </ul>
                        </div>

                            <p class="comment">${diyList.diyIntroduction}</p>
                      </div>
                      
                     	   <%-- <div class="card-footer px-5">
			                 <a href="javascript:" class="btn btn-xs btn-outline-secondary" onclick="Login()">
			                   <i id="heartIcon" class="fas fa-heart" aria-hidden="false"> ${diyList.loveCount}</i>
			                 </a>
	                         <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
	                       </div> --%>
                       
	                  <%--  <!-- 좋아요 버튼 기능 구현 -->      
	                   <c:choose>
					     <!-- 로그인 상태일때 하트 클릭 이벤트 처리 -->
					     <c:when test="${sessionScope.userinfo ne null}">
					       <c:choose>
					       <!-- 좋아요 체크 아닐떄 -->
					     	 <c:when test="${empty loveStatus.loveStatus}">
					    	   <div class="card-footer px-5">
			               	     <a href="javascript: loveCheck_func();" class="btn btn-xs btn-outline-secondary" id="btn_love">
			                       <i id="heartIcon" class="fas fa-heart" aria-hidden="false" > ${diyList.loveCount}
			               	         <input type="hidden" name="userinfoId" value="${userinfo }">
	        					     <input type="hidden" name="diyIdx" value="${diyList.diyIdx }">
			                       </i>
			                     </a>
	                             <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
	                           </div>
					     	 </c:when>
					    	
					    	 <!-- 좋아요 상태일때 -->
					    	 <c:otherwise>
					    	   <div class="card-footer px-5">
			               	     <a href="javascript: loveCancle_func();" class="btn btn-xs btn-outline-secondary">
			                       <i id="heartIcon" class="far fa-heart" aria-hidden="false"> ${diyList.loveCount}
			               	         <input type="hidden" name="userinfoId" value="${userinfo }">
	        				         <input type="hidden" name="diyIdx" value="${diyList.diyIdx }">
			                       </i>
			                     </a>
	                             <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
	                           </div>
					    	 </c:otherwise>
						   </c:choose>	
			             </c:when>
			            
			             <!-- 비로그인 상태일때 -->
			             <c:otherwise>
			               <div class="card-footer px-5">
			                 <a href="javascript:" class="btn btn-xs btn-outline-secondary" onclick="Login()">
			                   <i id="heartIcon" class="fas fa-heart" aria-hidden="false"> ${diyList.loveCount}</i>
			                 </a>
	                         <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
	                       </div>
			             </c:otherwise>
			           </c:choose>
			            --%>
			           
	  <c:choose>
   	    <c:when test="${sessionScope.userinfo ne null}">
   	      <div class="card-footer px-5">
	     <a href="javascript: loveCheck_func();" class="btn btn-xs btn-outline-secondary" id="btn_love">
	       <i id="heartIcon" class="fas fa-heart" aria-hidden="false" > ${diyList.loveCount}
	         <input type="hidden" name="userinfoId" value="${userinfo }">
	<input type="hidden" name="diyIdx" value="${diyList.diyIdx }">
	       </i>
	     </a>
	           <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
	         </div>
   	    </c:when>
   	  
   	    <c:otherwise>
   	      <div class="card-footer px-5">
   	     <a href="javascript: loveCancle_func();" class="btn btn-xs btn-outline-secondary">
           <i id="heartIcon" class="far fa-heart" aria-hidden="false"> ${diyList.loveCount}
   	         <input type="hidden" name="userinfoId" value="${userinfo }">
       <input type="hidden" name="diyIdx" value="${diyList.diyIdx }">
           </i>
         </a>
               <a href="${pageContext.request.contextPath}/diy/diy_detail/${diyList.diyIdx}" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
             </div>
   	    </c:otherwise>
   	  </c:choose>
			           
			           
                      
                  </div>
                </div>
         	  </c:forEach>
            </c:otherwise>
          </c:choose>
        </div>
   	  </div>
   	  
   	  <c:choose>
   	    <c:when test="${sessionScope.userinfo ne null}">
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
   		   
           
    </div>
  </div>

  <!-- ====================================
———	PAGINATION
===================================== -->
  <div class="page_t">
  <%-- 페이지 번호 출력 --%>
    <c:choose>
      <c:when test="${pager.startPage > pager.blockSize }"> 
        <a href="<c:url value="/diy/diy_list"/>?pageNum=${pager.prevPage}">
         [이전]
        </a>
    </c:when>
    
    <c:otherwise>
      [이전]
    </c:otherwise>
    
    </c:choose>
   	  <c:forEach var="i" begin="${pager.startPage }" end="${pager.endPage }" step="1">
	    <c:choose>
	      <c:when test="${pager.pageNum != i  }">
	        <a href="<c:url value="/diy/diy_list"/>?pageNum=${i}"><span class="p_num">${i }</span></a>
	      </c:when>
	    
	      <c:otherwise>
	        <span class="p_num">${i }</span>
	      </c:otherwise>
	    </c:choose>
	  </c:forEach>
	
	  <c:choose>
	    <c:when test="${pager.endPage != pager.totalPage }">
	    <a href="<c:url value="/diy/diy_list"/>?pageNum=${pager.nextPage}">
	      <span class="p_next">
	        [다음]
	      </span>
	    </a>
	    </c:when>
	    <c:otherwise>
	     [다음]
	    </c:otherwise>
	  </c:choose>
  </div>
</section>

<!-- <section class="pt-5 pt-md-7">
  <div class="container">
    <nav aria-label="Page navigation">
      <ul class="pagination justify-content-center align-items-center">
        <li class="page-item">
          <a class="page-link" href="javascript:void(0)" tabindex="-1">
            <i class="fas fa-long-arrow-alt-left d-none d-md-inline-block me-md-1" aria-hidden="true"></i> Previous
          </a>
        </li>
    
        <li class="page-item">
          <a class="page-link active" href="javascript:void(0)">1</a>
        </li>
    
        <li class="page-item">
          <a class="page-link" href="javascript:void(0)">2</a>
        </li>
    
        <li class="page-item">
          <a class="page-link" href="javascript:void(0)">3</a>
        </li>
    
        <li class="page-item">
          <a class="page-link" href="javascript:void(0)">...</a>
        </li>
    
        <li class="page-item">
          <a class="page-link" href="javascript:void(0)">9</a>
        </li>
    
        <li class="page-item">
          <a class="page-link" href="javascript:void(0)">Next
            <i class="fas fa-long-arrow-alt-right d-none d-md-inline-block ms-md-1" aria-hidden="true"></i>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</section>

</section> -->


  <!-- ====================================
    ——— FOOTER SECTION
    ===================================== -->
  
    <!-- ====================================
    ——— MODAL SECTION
    ===================================== -->
    <!-- Signup Modal -->
    <div class="modal fade" id="signup" tabindex="-1" role="dialog" aria-label="signupModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header rounded">
            <h3 class="modal-title text-uppercase font-weight-bold">Create your account</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body">
            <form class="" action="index.html" method="post">
              <div class="mb-3">
                <input type="text" class="form-control bg-smoke" required="" placeholder="Full Name">
              </div>

              <div class="mb-3">
                <input type="email" class="form-control bg-smoke" required="" placeholder="Email">
              </div>
    
              <div class="mb-3">
                <input type="password" class="form-control bg-smoke" required="" placeholder="Password">
              </div>
    
              <div class="mb-3 form-check mb-0">
                <input type="checkbox" class="form-check-input" id="exampleCheck4">
                <label class="form-check-label text-gray-color mb-3" for="exampleCheck4">
                  I agree to the terms of use and privacy.
                </label>
              </div>

              <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Login</button>
              </div>

              <div class="text-uppercase text-center py-3">Or</div>

              <div class="d-grid">
                <button type="submit" class="btn btn-facebook btn-block text-uppercase text-white">Login with facebook</button>
              </div>
            </form>
          </div>
    
          <div class="modal-footer justify-content-center">
            <p class="mb-1">Don’t have an Account? <a href="javascript:void(0)">Sign up</a></p>
          </div>
        </div>
      </div>
    </div>

    <!-- Login Modal -->
    <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-label="loginModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header rounded">
            <h3 class="modal-title text-uppercase font-weight-bold">Log in to your account</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body">
            <form class="" action="index.html" method="post">
              <div class="mb-3">
                <input type="email" class="form-control bg-smoke" required="" placeholder="Email">
              </div>

              <div class="mb-3">
                <input type="password" class="form-control bg-smoke" required="" placeholder="Password">
              </div>

              <div class="mb-3 form-check mb-0">
                <input type="checkbox" class="form-check-input" id="exampleCheck5">
                <label class="form-check-label text-gray-color mb-3" for="exampleCheck5">
                  Remember me
                </label>
                <a class="pull-right" href="javascript:void(0)">Fogot Password?</a>
             </div>

             <div class="d-grid">
              <button type="submit" class="btn btn-primary text-uppercase">Login</button>
             </div>

              <div class="text-uppercase text-center py-3">Or</div>

              <div class="d-grid">
                <button type="submit" class="btn btn-facebook text-uppercase text-white">Login with facebook</button>
               </div>
            </form>
          </div>

          <div class="modal-footer justify-content-center">
            <p class="mb-1">Don’t have an Account? <a href="javascript:void(0)">Sign up</a></p>
          </div>
        </div>
      </div>
    </div>

    <!-- INQUIRY IN MODAL -->
    <div class="modal fade" id="inquiry" tabindex="-1" role="dialog" aria-label="inquiryModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header rounded">
            <h3 class="modal-title text-uppercase font-weight-bold">Inquiry about tour</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body pb-3">
            <form class="" action="index.html" method="post">
              <div class="mb-3">
                <input type="text" class="form-control bg-smoke" required="" placeholder="Your Name">
              </div>

              <div class="mb-3">
                <input type="email" class="form-control bg-smoke" required="" placeholder="Your Email">
              </div>
    
              <div class="mb-3">
                <input type="number" class="form-control bg-smoke" required="" placeholder="Phone Number">
              </div>

              <div class="mb-3">
                <textarea class="form-control bg-smoke" rows="6" placeholder="Message"></textarea>
              </div>
    
              <button type="submit" class="btn btn-primary text-uppercase">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>

      <!-- Javascript -->
    <script>
	function Login() {
		 if (confirm("로그인 후 이용 가능합니다. 로그인하시겠습니까?")) {
		    	
		        window.location.href = "${pageContext.request.contextPath}/user/login"; 
		    } else {
		        
		    }
	}
	</script>
	   
	<script>

    var i = 0;
    $('far fa-heart').on('click',function(){
        if(i==0){
            $(this).removeClass('fas fa-heart');
            $(this).addClass('far fa-heart');
            i++;
        }else if(i==1){
            $(this).removeClass('far fa-heart');
            $(this).addClass('fas fa-heart');
            i--;
        }
        
    });

	</script>   
	      
	      
	      
	      
      
      <!-- <script>
      var userinfoId = ${userinfoId};
      var diyIdx = ${diyIdx};
       
      var btn_love = document.getElementById("btn_love");
      btn_love.onclick = function(){ loveCheck(); }
       
      // 게시글 하트를 처음으로 눌렀을때 
       function loveCancle_func(){ 
           $.ajax({
                  url : "/loveCancel.do",       
                  type : "GET",  
                  dataType : "json",   
                  data : "userinfoId="+userinfoId+"&diyIdx="+diyIdx,
                  
                  error : function(){
                      Rnd.alert("통신 에러","error","확인",function(){});
                  },
                  
                  success : function(jdata) {
                      if(jdata.resultCode == -1){
                          Rnd.alert("좋아요 오류","error","확인",function(){});
                      }
                      else{
                          if(jdata.likecheck == 1){
                              $("#btn_like").attr("src","/home/img/ico_like_after.png");
                              $("#likecnt").empty();
                              $("#likecnt").append(jdata.likecnt);
                          }
                          else if (jdata.likecheck == 0){
                              $("#btn_like").attr("src","/home/img/ico_like_before.png");
                              $("#likecnt").empty();
                              $("#likecnt").append(jdata.likecnt);
                              
                          }
                      }
                  }
              });
       }
      
       function loveCheck_func(){ 
           $.ajax({
                  url : "/loveCheck.do",       
                  type : "GET",  
                  dataType : "json",   
                  data : "userinfoId="+userinfoId+"&diyIdx="+diyIdx,
                  
                  error : function(){
                      Rnd.alert("통신 에러","error","확인",function(){});
                  },
                  
                  success : function(jdata) {
                      if(jdata.resultCode == -1){
                          Rnd.alert("좋아요 오류","error","확인",function(){});
                      }
                      else{
                          if(jdata.likecheck == 1){
                              $("#btn_like").attr("src","/home/img/ico_like_after.png");
                              $("#likecnt").empty();
                              $("#likecnt").append(jdata.likecnt);
                          }
                          else if (jdata.likecheck == 0){
                              $("#btn_like").attr("src","/home/img/ico_like_before.png");
                              $("#likecnt").empty();
                              $("#likecnt").append(jdata.likecnt);
                              
                          }
                      }
                  }
              });
       }

      </script> -->
   
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