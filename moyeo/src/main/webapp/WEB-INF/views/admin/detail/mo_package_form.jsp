<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<style>
    .admin_content_wrap{
        max-width: 1200px;
        margin: 0 auto;
        height: 1200px;
    }
    
    .admin_content_subject{
        text-align: center;
        font-size: 1.9em;
        padding: 40px;
        margin-top: -50px;
    }
    
    .admin_content_main{
        width: 500px;
        margin: 0 auto;
    }
    
    .form_section{
        margin: 35px;
        position: relative
    }
    
    .form_section_title{
        font-size: 1em;
        width: 170px;
        height: 20px;
        line-height: 31px;
        text-align: center;
    }
    
    .form_section_content{
        position: absolute;
        right: 0;
        top: 0;
    }
    
    .form_section_content input{
        width: 190px;
        height: 25px;
        border: 1px solid #8d8d8d;
        font-size: 0.6em;
        padding: 1px 5px;
    }
    
    .aihocf{
       font-size: 0.3px;
        display: block;
        position: absolute;
        left: 245px;
        top: 30px;
        width: 300px;
        color: #7d7d7d;
    }
    
    .cate_wrap{
        margin-left: -185px;
    }
    
    .cate_wrap span{
        font-size: 0.8em;
        margin-right: 30px;
    }
    
    .cate1{
        font-size: 0.7em;
        width: 60px;
        height: 25px;
        padding: 0px 5px;
        border-radius: 4px;
    }
    
    .btn_section{
       text-align: center;
       margin-top: 70px;
   }
    
   .btn_section button{
      width: 130px;
      padding: 8px;
        border: none;
        font-size: 0.9em;
        letter-spacing: 2px;
        cursor: pointer;
   }
    
   .btn_section .btn{
      background: #eee;
      margin-right: 5px;
   }
    
   .btn_section .enroll_btn{
      background:#000;
      color:#fff;
   }


</style>

<body id="body" class="up-scroll">

   <div class="main-wrapper packages-grid">


      <!-- ====================================
———   PAGE TITLE
===================================== -->
      <section class="page-title">
         <div class="page-title-img bg-img bg-overlay-darken"
            style="background-image: url(assets/img/pages/page-title-bg13.jpg);">
            <div class="container">
               <div class="row align-items-center justify-content-center"
                  style="height: 200px;">
                  <div class="col-lg-6">
                     <div class="page-title-content">
                        <div class="">
                           <h2 class="text-uppercase text-white font-weight-bold">패키지
                              여행</h2>
                        </div>
                        <p class="text-white mb-0"></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <div class="pack_detail_title">
         <p></p>
      </div>

      <!-- ====================================
———   PACKAGES SECTION
===================================== -->
         <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>패키지 등록</span></div>
                    <div class="admin_content_main">
                    
                       <form action="addPackage" method="post" id="enrollForm"  enctype="multipart/form-data">
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>제목</label>
                             </div>
                             <div class="form_section_content">
                                <input name="packTitle" placeholder="ex) 강아지와 함께하는 2박3일 제주도 여행">
                    
                             </div>
                          </div>
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>패키지 시작일자</label>
                             </div>
                             <div class="form_section_content">
                                <input type="date" name="packStartDate" id="fundingStart" 
                                class="form-control festival-form-control">
                       
                             </div>
                          </div>
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>패키지 종료일자</label>
                             </div>
                             <div class="form_section_content">
                                <input type="date" name="packEndDate" id="fundingEnd" 
                                class="form-control festival-form-control">
                             </div>
                          </div>
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>패키지 종류</label>
                             </div>
                             <div class="form_section_content">
                                <div class="cate_wrap">
                                   <span>분류</span>
                                    <select class="cate1" name="packKind">
                                     <option value="A">A</option> 
                                     <option value="I">I</option>
                                     <option value="H">H</option>
                                     <option value="P">P</option>
                                     <option value="C">C</option>
                                     <option value="F">F</option>
                                    </select>
                                </div>
                             </div>
                                <span class="aihocf">A : 혼자, I : 아이, H : 배려, P : 동물, C : 연인, F : 친구</span>
                          </div>          
                          
                       
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>인원수</label>
                             </div>
                             <div class="form_section_content">
                                <input name="packPeople" placeholder="ex) 50">
                    
                             </div>
                          </div>       
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>성인 1인 가격</label>
                             </div>
                             <div class="form_section_content">
                                <input name="packAdultPrice" placeholder="ex) 150000">
                    
                             </div>
                          </div>      
                          
                          <div class="form_section">
                             <div class="form_section_title">
                                <label>소인 1인 가격</label>
                             </div>
                             <div class="form_section_content">
                                <input name="packChildPrice" placeholder="ex) 50000">
                    
                             </div>
                          </div>                 

                        
                      
                             <div class="form_section">
                                <div class="form_section_title">
                                   <label>패키지 미리보기 이미지</label>
                                </div>
                                <div class="form_section_content">
                              <input type="file" id ="packPreviewImgFile" name="packPreviewImgFile" style="height: 25px;line-height: 15px;margin-left: 200px;">
                              <div id="uploadResult">                  
                              </div>
                                </div>
                             </div>         
                             
                             <div class="form_section">
                                <div class="form_section_title">
                                   <label>패키지 슬라이드 이미지1</label>
                                </div>
                                <div class="form_section_content">
                              <input type="file" id ="packSlideImg1File" name="packSlideImg1File" style="height: 25px;line-height: 15px;margin-left: 200px">
                              <div id="uploadResult">                  
                              </div>
                                </div>
                             </div> 
                             
                              <div class="form_section">
                                <div class="form_section_title">
                                   <label>패키지 슬라이드 이미지2</label>
                                </div>
                                <div class="form_section_content">
                              <input type="file" id ="packSlideImg2File" name="packSlideImg2File" style="height: 25px;line-height: 15px;margin-left: 200px">
                              <div id="uploadResult">                  
                              </div>
                                </div>
                             </div>   
                             
                             <div class="form_section">
                                <div class="form_section_title">
                                   <label>패키지 슬라이드 이미지3</label>
                                </div>
                                <div class="form_section_content">
                              <input type="file" id ="packSlideImg3File" name="packSlideImg3File" style="height: 25px;line-height: 15px;margin-left: 200px">
                              <div id="uploadResult">                  
                              </div>
                                </div>
                             </div> 

                             <div class="form_section">
                                <div class="form_section_title">
                                   <label>패키지 설명 이미지1</label>
                                </div>
                                <div class="form_section_content">
                              <input type="file" id ="packContentImg1File" name="packContentImg1File" style="height: 25px;line-height: 15px;margin-left: 200px">
                              <div id="uploadResult">                  
                              </div>
                                </div>
                             </div>     
                             
                             <div class="form_section">
                                <div class="form_section_title">
                                   <label>패키지 설명 이미지2</label>
                                </div>
                                <div class="form_section_content">
                              <input type="file" id ="packContentImg2File" name="packContentImg2File" style="height: 25px;line-height: 15px;margin-left: 200px">
                              <div id="uploadResult">                  
                              </div>
                                </div>
                             </div>
                             
                             <div class="form_section">
                                <div class="form_section_title">
                                   <label>패키지 설명 이미지3</label>
                                </div>
                                <div class="form_section_content">
                              <input type="file" id ="packContentImg3File" name="packContentImg3File" style="height: 25px;line-height: 15px;margin-left: 200px">
                              <div id="uploadResult">                  
                              </div>
                                </div>
                             </div>      
                             
                             <div class="form_section">
                                <div class="form_section_title">
                                   <label>패키지 달력 이미지</label>
                                </div>
                                <div class="form_section_content">
                              <input type="file" id ="packCalendarImgFile" name="packCalendarImgFile" style="height: 25px;line-height: 15px;margin-left: 200px">
                              <div id="uploadResult">                  
                              </div>
                                </div>
                             </div>         
                
                   <div class="btn_section">
                               <button id="cancelBtn" class="btn">취 소</button>
                             <button id="enrollBtn" class="btn enroll_btn">등 록</button>
                          </div> 
                         </form>
                    </div>                    
                </div>


      <!-- ====================================
———   PACKAGES LIKE SECTION
===================================== -->
      <!-- <section class="pb-10">
  <div class="container">
    <div class="text-uppercase mb-4">
      <h2 class="mb-0">you may also like</h2>
    </div>
    <div class="row">
      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
        <div class="card card-bg">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="assets/img/home/deal/deal-01.jpg" src="assets/img/home/deal/deal-01.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">
                <span class="d-block">
                  45%<br>off
                </span>
              </div>

              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>

              <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                <li class="border-right border-white pe-2">7 days</li>
                <li class="border-right border-white px-2">15 hrs</li>
                <li class="ps-2">15 min</li>
              </ul>
            </div>
          </a>

          <div class="card-body">
            <h5>
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">France / Paris</a>
            </h5>

            <p class="mb-7">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt
              labore dolore.</p>

            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$299</h3>
              </div>

              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-4">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
        <div class="card card-bg">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="assets/img/home/deal/deal-02.jpg" src="assets/img/home/deal/deal-02.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">
                <span class="d-block">
                  50%<br>off
                </span>
              </div>

              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>

              <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                <li class="border-right border-white pe-2">7 days</li>
                <li class="border-right border-white px-2">15 hrs</li>
                <li class="ps-2">15 min</li>
              </ul>
            </div>
          </a>

          <div class="card-body">
            <h5>
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Australia / Canberra</a>
            </h5>

            <p class="mb-7">Integer purus ex, dictum nec elementum eu, tristique vel lectus. Donec rutrum lectus et
              pharetra
              egestas.</p>

            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$299</h3>
              </div>

              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-4">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 col-lg-4">
        <div class="card card-bg">
          <a href="single-package-right-sidebar.html" class="position-relative">
            <img class="card-img-top lazyestload" data-src="assets/img/home/deal/deal-03.jpg" src="assets/img/home/deal/deal-03.jpg" alt="Card image cap">
            <div class="card-img-overlay card-hover-overlay rounded-top d-flex flex-column">
              <div class="badge bg-primary badge-rounded-circle">
                <span class="d-block">
                  40%<br>off
                </span>
              </div>

              <ul class="list-unstyled d-flex mt-auto text-warning mb-0">
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star me-1" aria-hidden="true"></i>
                </li>
                <li>
                  <i class="fa fa-star" aria-hidden="true"></i>
                </li>
              </ul>

              <ul class="list-unstyled d-flex text-white font-weight-bold mb-0">
                <li class="border-right border-white pe-2">7 days</li>
                <li class="border-right border-white px-2">15 hrs</li>
                <li class="ps-2">15 min</li>
              </ul>
            </div>
          </a>

          <div class="card-body">
            <h5>
              <a href="single-package-right-sidebar.html" class="card-title text-uppercase">Jarmani / Berlin</a>
            </h5>

            <p class="mb-7">Donec lacus felis, dapibus males uada massa non, ferm entum tincidunt quam. Orci varius
              natoque.</p>

            <div class="d-flex justify-content-between align-items-center">
              <div>
                <p class="mb-0 text-capitalize">Start from</p>
                <h3 class="text-primary">$299</h3>
              </div>

              <div>
                <a href="single-package-fullwidth.html" class="btn btn-xs btn-outline-secondary text-uppercase">Details</a>
                <a href="" class="btn btn-xs btn-outline-secondary px-4">
                  <i class="fas fa-map-marker-alt" aria-hidden="true"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
 —>


   </div>
   <!— element wrapper ends —>

   
















   <!-- Javascript -->
   <script
      src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-3.4.1.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/plugins/menuzord/js/menuzord.js"></script>

   <script
      src='${pageContext.request.contextPath}/assets/plugins/fancybox/jquery.fancybox.min.js'></script>

   <script
      src='${pageContext.request.contextPath}/assets/plugins/selectric/jquery.selectric.min.js'></script>
      
      
   <script
      src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/moment.min.js'></script>
   <script
      src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/daterangepicker.min.js'></script>
   <script
      src='${pageContext.request.contextPath}/assets/plugins/rateyo/jquery.rateyo.min.js'></script>
   <script
      src="${pageContext.request.contextPath}/assets/plugins/lazyestload/lazyestload.js"></script>

   <script
      src='${pageContext.request.contextPath}/assets/plugins/owl-carousel/owl.carousel.min.js'></script>


   <script
      src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
   <script
      src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDU79W1lu5f6PIiuMqNfT1C6M0e_lq1ECY'></script>
   <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>


<script>
    let enrollForm = $("#enrollForm");

    /* 취소 버튼 */
    $("#cancelBtn").click(function(){
        location.href = "${pageContext.request.contextPath}/package/";
    });

    /* 상품 등록 버튼 */
    $("#enrollBtn").on("click", function(e){
        e.preventDefault();
        enrollForm.submit();
    });
   </script>

</body>
</html>