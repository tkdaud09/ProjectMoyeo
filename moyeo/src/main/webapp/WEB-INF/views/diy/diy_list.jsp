<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="UTF-8">
  
   <head>
<jsp:include page="/WEB-INF/views/inc/head.jsp"/>

  </head>  
  
<body id="body" class="up-scroll">

  

<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(assets/img/pages/page-title-bg7.jpg);">
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
    <!-- ============================================================================== -->
        <div class="container">
        <div class="row">
        
          <c:choose>
          		<c:when test="${empty(diyList) }">
    				<tr align="center">
						<td colspan="5">글정보가 없습니다.</td>
					</tr>	
    			</c:when>
    			
    		<c:otherwise>
          	  <c:forEach var="diyList" items="${diyList}">
                <div class="col-md-6 col-lg-4">
                    <div class="card card-transparent mb-7">
                        <a href="" class="position-relative">
                            <img class="card-img-top rounded lazyestload" data-src="${pageContext.request.contextPath}/assets/img/blog/blog-01.jpg" src="${pageContext.request.contextPath}/assets/img/blog/blog-01.jpg" alt="thumbnail">
                            <!-- <div class="card-img-overlay card-hover-overlay rounded"></div> -->
                        </a>

                        <div class="card-body py-6">
                            <h3 class="mb-4">
                               <a class="text-capitalize text-dark hover-text-primary">${diyList.diyTitle}</a>
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
					                  <span class="ms-1 text-capitalize">${diyList.loveIdx}</span>
					                </li>
                                    
                                    <!-- Other meta tags... -->
                                </ul>
                            </div>

                            <p class="mb-0">${diyList.diyIntroduction}</p>
                        </div>

                        <div class="card-footer px-5">
                            <a href="${pageContext.request.contextPath}/diy/diy_detail" class="btn btn-sm btn-outline-secondary text-uppercase">자세히보기</a>
                        </div>
                   	 </div>
             	   </div>
         	   	  </c:forEach>
         	 	 </c:otherwise>
        	   </c:choose>
        	 </div>
   		   </div>
   		   <div class="text-center text-md-start text-lg-end">
            <a href="${pageContext.request.contextPath}/diy/diy_add" class="btn btn-primary text-uppercase">작성하기</a>
           </div>
  	   	</div>
	 </div>

  <!-- ====================================
———	PAGINATION
===================================== -->
<section class="pt-5 pt-md-7">
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

</section>



  </div><!-- element wrapper ends -->


  <!-- ====================================
    ——— FOOTER SECTION
    ===================================== -->
    <jsp:include page="/WEB-INF/views/inc/footer.jsp"/>
   
  
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