<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<jsp:include page="/WEB-INF/views/inc/head.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>    
   
<style>
input[type='date']::before {
  content: attr(data-placeholder);
  width: 100%;
  color: gray;
}

input[type='date']:focus::before,
input[type='date']:valid::before {
  display: none;
  
}				
</style>

<body id="body" class="up-scroll">	
  <!-- ====================================
  ——— HEADER
  ===================================== -->


<!-- ====================================
———	PAGE TITLEß
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url( ${pageContext.request.contextPath}/assets/img/pages/page-title-bg7.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">DIY 작성 페이지</h2>
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
<section class="py-8 py-md-10">
  <div class="container">
    <div class="mb-8"></div>
      <div class="row progress-wizard">
      
        
      
        <div class="col-4 progress-wizard-step incomplete">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <a href="diy_add" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fas fa-dollar-sign" aria-hidden="true"></i>
              <span class="d-block">DIY 작성</span>
            </div>
          </a>
        </div>
      
        <div class="col-4 progress-wizard-step incomplete">
          <div class="progress">
            <div class="progress-bar"></div>
          </div>
      
          <a href="diy_list" class="progress-wizard-dot">
            <div class="progress-wizard-content">
              <i class="fa fa-check" aria-hidden="true"></i>
              <span class="d-block">목록으로</span>
            </div>
          </a>
        </div>
        
       </div>
    
    
    <div class="row">
      <div class="col-md-7 col-lg-8 order-1 order-md-0">
        <h3 class="text-capitalize mb-5">여행 정보!</h3>

        <form action="diy_add" id="scrollableContainer" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="userinfoId" value="${userinfo }">
        
     	   <div class="row">
     	   
              <div class="col-lg-6">
                <label for="diyStartdate">출발일</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <input type="date" class="form-control border-0 bg-smoke" id="diyStartdate" name="diyStartdate" data-placeholder="날짜 선택" required aria-required="true">
                </div>
              </div>
    
             <div class="col-lg-6">
                <label for="diyEnddate">도착일</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <input type="date"  class="form-control border-0 bg-smoke" id="diyEnddate" name="diyEnddate"  data-placeholder="날짜 선택" required aria-required="true">
                </div>
              </div>
        

    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyPeople">인원</label>
                <input type="text" class="form-control border-0 bg-smoke" id= "diyPeople"name="diyPeople" placeholder="ex) 3">
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyLoc">지역</label>
                <input type="text" class="form-control border-0 bg-smoke" name="diyLoc" placeholder="ex) 서울">
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyPrice">비용</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyPrice" name="diyPrice" placeholder="ex) 10">
              </div>
            </div>
    
          <div class="form-group mb-5">
    		<label for="diyThumbnailimage">썸네일 올리기</label>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyThumbnail" name="diyThumbnailFile">
    		<div id="diyThumbnail"  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
		  </div>
		  
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyTitle">제목</label>
                <input type="text" class="form-control border-0 bg-smoke" name="diyTitle" placeholder="ex) 3박 4일 강릉여행 후기!!">
              </div>
            </div>
           
           <div class="col-lg-6">
              <div class="form-group">
                <label for="inputName">간단한 소개글</label>
                <textarea class="form-control border-0 bg-smoke" rows="2" name="diyIntroduction" placeholder="ex) 여행을 간단하게 소개해주세요"></textarea>
              </div>
            </div>
           
          <div class="form-group mb-5">
    		<label for="imgUpload">DAY 1 사진올리기</label>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent1Img" name="diyContent1ImgFile">
    		<div id="" style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
		  </div>
          
          <div class="form-group mb-5">
            <label for="exampleFormControlTextarea1">DAY 1</label>
            <textarea class="form-control border-0 bg-smoke" name="diyContent1" rows="7"></textarea>
          </div>
            
          <div class="form-group mb-5">
    		<label for="imgUpload">DAY 2 사진올리기</label>
    		<div id=""  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent2Img" name="diyContent2ImgFile">
		  </div>
            
           <div class="form-group mb-5">
            <label for="exampleFormControlTextarea1">DAY 2</label>
            <textarea class="form-control border-0 bg-smoke" rows="7" name="diyContent2" ></textarea>
          </div>
          
          <div class="form-group mb-5">
    		<label for="imgUpload">DAY 3 사진올리기</label>
    		<div id=""  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent3Img" name="diyContent3ImgFile">
		  </div>
          
           <div class="form-group mb-5">
            <label for="exampleFormControlTextarea1">DAY 3</label>
            <textarea class="form-control border-0 bg-smoke" rows="7" name="diyContent3" ></textarea>
          </div>
          
          <div class="form-group mb-5">
    		<label for="imgUpload">DAY 4 사진올리기</label>
    		<div id=""  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent4Img" name="diyContent4ImgFile">
		  </div>
		  
		  <div class="form-group mb-5">
            <label for="exampleFormControlTextarea1">DAY 4</label>
            <textarea class="form-control border-0 bg-smoke" rows="7" name="diyContent4" ></textarea>
          </div>
          
          <div id="elementContainer" class="mt-3">
	    	 </div>
		
          <div class="container mt-5">
	        <button type="button" id="addButton" class="btn btn-hover btn-outline-secondary text-uppercase">
	            Add DAY
	        </button>
	        
	        <button type="button" id="deleteButton" class="btn btn-hover btn-outline-secondary text-uppercase">
	            Delete DAY
	        </button>
	      </div>
	      
           
           <div class="text-center text-md-start text-lg-end">
            <button type="submit" id="enrollBtn" class="btn btn-primary text-uppercase" >
              작성하기</button>
           </div>
           
		</div>
	  </form>
           
      </div>
    </div>
</section>

    <!-- ====================================
    ——— MODAL SECTION
    ===================================== -->
    <!-- Signup Modal -->
    

    <!-- Login Modal -->
    
    <!-- INQUIRY IN MODAL -->
    <script>
function validateForm() {
    const startDateField = document.getElementById('diyPeople');
    const startDateValue = startDateField.value.trim();

    if (startDateValue === '') {
        alert('Please select a start date for your DIY.');
    } else {
        document.getElementById('scrollableContainer').submit();
    }
}
</script>

<script>
document.querySelector('#scrollableContainer').addEventListener('submit', function(event) {
    // Clear previous error messages
    document.querySelector('#diyPeopleError').textContent = '';

    // Perform validation for the 'diyStartdate' field (you should do this for other fields as well)
    const diyStartdate = document.querySelector('#diyPeople').value;
    if (diyStartdate === '') {
        document.querySelector('#diyPeopleError').textContent = '출발일을 입력하세요.';
        event.preventDefault(); // Prevent form submission
    }
    
    // Perform similar checks for other fields
    
    // Check if image uploads are valid (you may need to write custom logic for this)
    if (!areImagesValid()) {
        event.preventDefault(); // Prevent form submission
    }
});
</script>
 
<script >

const addButton = document.getElementById('addButton');
const deleteButton = document.getElementById('deleteButton');
const elementContainer = document.getElementById('elementContainer');

// Counter for unique IDs
let counter = 5;
let addDayCount = 0;


// Function to add new elements
function addDay() {
 if (addDayCount >= 3) {
     // Do nothing if the function has been called 10 times
     return;
   }
	 
    const dayDiv = document.createElement('div');
    dayDiv.classList.add('form-group', 'mb-5');

    const dayLabel = document.createElement('label');
    dayLabel.textContent = "DAY "+counter+"   "+"("+(5+addDayCount)+"/7)";

    const textarea = document.createElement('textarea');
    textarea.classList.add('form-control', 'border-0', 'bg-smoke');
    textarea.name = "diyContent"+counter;
    textarea.rows = 7;

    const uploadLabel = document.createElement('label');
    uploadLabel.textContent = "DAY " +counter+ " 사진올리기     ("+(5+addDayCount)+"/7)";

    const uploadInput = document.createElement('input');
    uploadInput.type = 'file';
    uploadInput.classList.add('btn', 'btn-xs', 'btn-outline-secondary', 'text-uppercase');
    uploadInput.id = "diyContent"+counter+"Img";
    uploadInput.name = "diyContent"+counter+"ImgFile";

    dayDiv.appendChild(uploadLabel);
    dayDiv.appendChild(uploadInput);
    dayDiv.appendChild(dayLabel);
    dayDiv.appendChild(textarea);
    
    elementContainer.appendChild(dayDiv, dayLabel);

	counter++;
	addDayCount++;
	}

addButton.addEventListener('click', addDay);

function deleteDay() {
 const elementContainer = document.getElementById('elementContainer');

    if (elementContainer.children.length >= 1) {
        elementContainer.removeChild(elementContainer.lastChild);
        // Decrement the tag count
        counter -= 1;
        addDayCount = Math.max(0, addDayCount - 1);
  	  }
 
	}
// Add event listener to the "Add DAY" button
deleteButton.addEventListener('click', deleteDay);
</script>	
    
   
    
    

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