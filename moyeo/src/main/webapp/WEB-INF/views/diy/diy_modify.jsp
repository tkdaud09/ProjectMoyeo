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

<body id="body" class="up-scroll">

  <!-- ====================================
  ——— HEADER
  ===================================== -->


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
<section class="py-10">
  <div class="container">
    <div class="col-md-12"></div>
      <div class="row progress-wizard"></div>
    
    <div class="row">
      <div class="col-md-12">
        <h3 class="text-capitalize mb-5">여행 정보!</h3>


        <form action="diy_update" id="diy_update" method="get" enctype="multipart/form-data">
     	   <div class="row">
     	   
              <div class="col-lg-6">
                <label for="diyStartdate">출발일</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                </div>
                  <input type="text" class="form-control border-0 bg-smoke" id="diyStartdate" name="dateRange" value="${diyModify.diyStartdate }">
                </div>
                
  	  
    
             <div class="col-lg-6">
                <label for="diyEnddate">도착일</label>
                <div class="form-group form-group-icon form-group-icon-default">
                  <i class="far fa-calendar-alt" aria-hidden="true"></i>
                  <input type="text" class="form-control border-0 bg-smoke" id="diyEnddate" name="dateRange" value="${diyModify.diyEnddate }">
                </div>
              </div>
        

    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyPeople">인원</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyPeople" name="diyPeople" value="${diyModify.diyPeople }">
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyLoc">지역</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyLoc" name="diyLoc" value="${diyModify.diyLoc }">
              </div>
            </div>
    
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyPrice">비용</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyPrice" name="diyPrice" value="${diyModify.diyPrice }">
              </div>
            </div>
            
          <div class="form-group mb-5">
    		<label for="diyThumbnailimage">썸네일 올리기</label>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyThumbnail" name="diyThumbnailFile" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyThumbnail}" src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyThumbnail}" alt="image">
    		<div id="diyThumbnail"  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
		  </div>
    
          
            <div class="col-lg-6">
              <div class="form-group">
                <label for="diyTitle">제목</label>
                <input type="text" class="form-control border-0 bg-smoke" id="diyTitle" name="diyTitle" value="${diyModify.diyTitle }">
              </div>
            </div>
           
           
           <!-- 다른것도 태그바꾸기 -->
           <div class="col-lg-6">
              <div class="form-group">
                <label for="diyIntrodution">간단한 소개글</label>
                <p class="form-control border-0 bg-smoke" id="diyIntrodution">${diyModify.diyIntroduction }</p>
              </div>
            </div>
           
				<!-- day 1 사진 -->          
          <div class="form-group mb-5">
    		<label for="imgUpload">DAY 1 사진올리기</label>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent1Img" name="diyContent1ImgFile" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent1Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent1Img}" alt="Day 1 img">
    		<div id="" style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
		  </div>
            
		 	
          <div class="form-group mb-5" id="day1Block">
            <label for="diyContent1">DAY 1</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent1" rows="7">${diyModify.diyContent1 }</textarea>
          </div>
				
          <div class="form-group mb-5">
    		<label for="imgUpload">DAY 2 사진올리기</label>
    		<div id=""  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent2Img" name="diyContent2ImgFile" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent2Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent2Img}" alt="Day 2 img">
		  </div>
            
           <div class="form-group mb-5">
            <label for="diyContent2">DAY 2</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent2" rows="7">${diyModify.diyContent2 }</textarea>
          </div>
          
 		  <div class="form-group mb-5">
    		<label for="imgUpload">DAY 3 사진올리기</label>
    		<div id=""  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent3Img" name="diyContent3ImgFile" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent3Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyModify.diyContent3Img}" alt="Day 3 img">
		  </div>
            
          <div class="form-group mb-5">
            <label for="diyContent3">DAY 3</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent3" rows="7">${diyModify.diyContent3 }</textarea>
          </div>
          
          <div class="form-group mb-5">
    		<label for="imgUpload">DAY 4 사진올리기</label>
    		<div id=""  style="height: 25px;line-height: 15px;margin-left: 200px;"></div>
    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase" id="diyContent4Img" name="diyContent4ImgFile" data-src="${pageContext.request.contextPath}/assets/img/upload/${diyDetail.diyContent4Img}" src="${pageContext.request.contextPath}/assets/img/upload/${diyList.diyContent4Img}" alt="Day 4 img">
		  </div>
          
		  <div class="form-group mb-5">
            <label for="diyContent4">DAY 4</label>
            <textarea class="form-control border-0 bg-smoke" id="diyContent4" rows="7">${diyModify.diyContent4 }</textarea>
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
		  
		  <!--  추가 버튼 글 + 사진 스크립트 작성 -->
    
           <div class="text-center text-md-start text-lg-end">
            <button type="submit" class="btn btn-primary text-uppercase" id="enrollBtn">
              수정하기
            </button>
           </div>
          
		</div>
	  </form>
     </div>
    </div>
  </div>
</section>
    
    
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

    
    
	<script type="text/javascript">
	
	function submitCheck() {
		if(dateRange.value=="") {
			alert("날짜를 입력해주세요.");
			return;
		}
		
		var noReg=/\d{2}/g;
		if(!noReg.test(diyPeople.value)) {
			alert("인원은 숫자로만 입력해주세요.");
			diyPeople.focus();
			return;
		}
		
		if(diyLoc.value=="") {
			alert("지역을 입력해 주세요.");
			diyLoc.focus();
			return;
		}
		
		var noReg=/\d{9}/g;
		if(diyPrice.value=="") {
			alert("비용은 숫자로만 입력해주세요.");
			diyPrice.focus();
			return;
		}
		
		if(diyTitle.value=="") {
			alert("제목을 입력해 주세요.");
			diyTitle.focus();
			return;
		}

		if(diyIntroduction.value=="") {
			alert("소개글을 입력해 주세요.");
			diyIntroduction.focus();
			return;
		}
		
		if(diyContent1.value=="") {
			alert("내용을 입력해 주세요.");
			diyContent1.focus();
			return;
		}

		studentForm.submit();
	} 
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