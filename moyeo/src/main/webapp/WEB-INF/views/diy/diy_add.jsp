<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  

<!DOCTYPE html>
<html lang="utf-8">

<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
</head>


<body id="body" class="up-scroll">	

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
              <h2 class="text-uppercase text-white font-weight-bold">DIY 참여하기</h2>
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
<section class="">
	<div class="container">
		<div class="py-10">
			<div class="review_content border_con">
								
				<div class="diy_form_title">내맘대로 투어 만들기 </div>
				<div class="diy_tit_t">나만의 특별한 투어를 만들어 이벤트에 참여해보세요!</div>
				
				<div class="write_form diyy_form">
					<form action="diy_add" id="scrollableContainer" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
						<input name="userinfoId" value="${userinfo.id }">

						<div class="diy_con1">
		               		 <label for="diyStartdate">출발일
		                 	 	<input type="date" class="form-control border-0 bg-smoke" id="diyStartdate" name="diyStartdate" data-placeholder="날짜 선택" required aria-required="true">
	               			</label>
			                <label for="diyEnddate">도착일
			               	 	<input type="date"  class="form-control border-0 bg-smoke" id="diyEnddate" name="diyEnddate"  data-placeholder="날짜 선택" required aria-required="true">
							</label>
						</div>
						
						<div class="diy_con2">
			                <label for="diyPeople">인원
			                 	<input type="text" class="form-control border-0 bg-smoke" id= "diyPeople"name="diyPeople" placeholder="ex) 3">
				  			</label>
			                <label for="diyLoc">지역
			                	<input type="text" class="form-control border-0 bg-smoke" id="diyLoc" name="diyLoc" placeholder="ex) 서울">
			                </label>
			                <label for="diyPrice">비용
			                	<input type="text" class="form-control border-0 bg-smoke" id="diyPrice" name="diyPrice" placeholder="ex) 10">
			                </label>
						</div>
		
						<div class="diy_con3">
				    		<label for="diyThumbnailimage">메인 썸네일 올리기
				    			<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase diy_f" id="diyThumbnail" name="diyThumbnailFile">
				    		</label>
	
			                <label for="diyTitle">제목
			                	<input type="text" class="form-control border-0 bg-smoke" name="diyTitle" placeholder="ex) 3박 4일 강릉여행 후기!!">
			                </label>
              
			                <label for="inputName">간단한 소개글
			                	<textarea class="form-control border-0 bg-smoke" rows="2" name="diyIntroduction" placeholder="ex) 여행을 간단하게 소개해주세요"></textarea>
			                </label>
			            </div>   
			                
						<div class="diy_con4 form-group">   
				    		<label for="imgUpload">DAY 1 사진  여행정보</label>
				    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase diy_f" id="diyContent1Img" name="diyContent1ImgFile">
				            <textarea class="form-control border-0 bg-smoke" name="diyContent1" rows="7"></textarea>
						</div>
						
						<div class="diy_con4 form-group">  
						<label for="imgUpload">DAY 2 사진  여행정보</label>
					  		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase diy_f" id="diyContent2Img" name="diyContent2ImgFile">
				            <textarea class="form-control border-0 bg-smoke" rows="7" name="diyContent2" ></textarea>
				        </div>
							
						<div id="elementContainer" class="mt-3"> </div>
	    	
							
						<div class="container mt-5">
					        <button type="button" id="addButton" class="btn btn-hover btn-outline-secondary text-uppercase">
					           일정 더 추가하기
					        </button>
					        
					        <button type="button" id="deleteButton" class="btn btn-hover btn-outline-secondary text-uppercase">
					           일정 삭제하기
					        </button>
					    </div>


						 <div class="text-center text-md-start text-lg-end">
				             <a href="diy_list"><button type="button" class="btn btn-primary text-uppercase" >취소</button></a>
				             <button type="submit" id="enrollBtn" class="btn btn-primary text-uppercase" >작성완료</button>
				         </div>
						      
						<sec:csrfInput/>
					</form>
				</div>
				
				
				
				
				<script>
				    // 폼 제출 전에 실행되는 함수
				    function validateForm() {
				        const diyStartdate = document.getElementById('diyStartdate').value.trim();
				        const diyEnddate = document.getElementById('diyEnddate').value.trim();
				        const diyPeople = document.getElementById('diyPeople').value.trim();
				        const diyLoc = document.getElementById('diyLoc').value.trim();
				        const diyPrice = document.getElementById('diyPrice').value.trim();
				
				        const diyTitle = document.getElementById('diyTitle').value.trim();
				        const diyThumbnail = document.getElementById('diyThumbnail');
				        const diyIntroduction = document.getElementById('diyIntroduction').value.trim();
				        const diyContent1 = document.getElementById('diyContent1').value.trim();
				        const diyContent1Img = document.getElementById('diyContent1Img');
				        const diyContent2 = document.getElementById('diyContent2').value.trim();
				        const diyContent2Img = document.getElementById('diyContent2Img');
				        
				        const numberPattern = /^\d+$/;
				
				        if (diyStartdate === '') {
				            alert('출발일을 작성해주세요.');
				            return false;
				        } else if (diyEnddate === '') {
				            alert('도착일을 작성해주세요.');
				            return false;
				        } else if (diyPeople === '') {
				            alert('인원수를 작성해주세요.');
				            return false;
				        } else if (diyLoc === '') {
				            alert('지역을 작성해주세요.');
				            return false;
				        } else if (diyPrice === '') {
				            alert('가격을 작성해주세요.');
				            return false;
				        } else if (!numberPattern.test(diyPeople)) {
				            alert('가격을 숫자로 작성해주세요.');
				            return false;
				        } else if (!numberPattern.test(diyPrice)) {
				            alert('인원수를 숫자로 작성해주세요.');
				            return false;
				        } else if (diyTitle === '') {
				            alert('제목을 작성해주세요.');
				            return false;
				        } else if (!diyThumbnail.files || diyThumbnail.files.length === 0) {
				            alert('썸네일 사진을 올려주세요.');
				            return false;
				        } else if (diyIntroduction === '') {
				            alert('소개글을 작성해주세요.');
				            return false;
				        } else if (!diyContent1Img.files || diyContent1Img.files.length === 0) {
				            alert('1일차 사진을 올려주세요.');
				            return false;
				        } else if (diyContent1 === '') {
				            alert('1일차 내용을 작성해주세요.');
				            return false;
				        } else if (!diyContent2Img.files || diyContent2Img.files.length === 0) {
				            alert('2일차 사진을 올려주세요.');
				            return false;
				        } else if (diyContent2 === '') {
				            alert('2일차 내용을 작성해주세요.');
				            return false;
				        } else {
				        	
					        return true;
				        }
				
				    }
				</script>
				
				 
				<script>
				const addButton = document.getElementById('addButton');
				const deleteButton = document.getElementById('deleteButton');
				const elementContainer = document.getElementById('elementContainer');
				
				// Counter for unique IDs
				let counter = 3;
				let addDayCount = 0;
				
				// Function to add new elements
				function addDay() {
				    if (addDayCount >= 5) {
				        // Do nothing if the function has been called 3 times
				        return;
				    }
				
				    const dayDiv = document.createElement('div');
				    dayDiv.classList.add('form-group');
				    const label = document.createElement('label');
				    label.textContent = "DAY " + counter + " 사진  여행정보    "+"("+(3+addDayCount)+"/7)" ;
				
				    const uploadInput = document.createElement('input');
				    uploadInput.type = 'file';
				    uploadInput.classList.add('btn', 'btn-xs', 'btn-outline-secondary', 'text-uppercase', 'diy_f');
				    uploadInput.id = "diyContent" + counter + "Img";
				    uploadInput.name = "diyContent" + counter + "ImgFile    "+"("+(3+addDayCount)+"/7)";
				
				    const textarea = document.createElement('textarea');
				    textarea.classList.add('form-control', 'border-0', 'bg-smoke');
				    textarea.rows = 7;
				    textarea.name = "diyContent" + counter;
				
				    dayDiv.appendChild(label);
				    dayDiv.appendChild(uploadInput);
				    dayDiv.appendChild(textarea);
				
				    elementContainer.appendChild(dayDiv);
				
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
				
				// Add event listener to the "Delete DAY" button
				deleteButton.addEventListener('click', deleteDay);
				</script>
				

				
			</div>
		</div>	
	</div>
</section>	


</body>
</html>


   
    
 