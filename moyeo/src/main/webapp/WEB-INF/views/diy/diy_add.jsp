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
					<form action="diy_add" id="scrollableContainer" method="post" enctype="multipart/form-data">
						<input type="hidden" name="userinfoId" value="${userinfo }">

						<div class="diy_con1 ">
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
			                	<input type="text" class="form-control border-0 bg-smoke" name="diyLoc" placeholder="ex) 서울">
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
				    		<label for="imgUpload">DAY 1 사진 & 여행정보</label>
				    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase diy_f" id="diyContent1Img" name="diyContent1ImgFile">
				            <textarea class="form-control border-0 bg-smoke" name="diyContent1" rows="7"></textarea>
						</div>

						<div class="diy_con4 form-group">  
					  		<label for="imgUpload">DAY 2 사진 & 여행정보</label>
					  		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase diy_f" id="diyContent2Img" name="diyContent2ImgFile">
				            <textarea class="form-control border-0 bg-smoke" rows="7" name="diyContent2" ></textarea>
				        </div> 
				            
						<div class="diy_con4 form-group"> 
				    		<label for="imgUpload">DAY 3 사진 & 여행정보</label>
				    		<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase diy_f" id="diyContent3Img" name="diyContent3ImgFile">
				            <textarea class="form-control border-0 bg-smoke" rows="7" name="diyContent3" ></textarea>
				            </div> 
				            
						<div class="diy_con4 form-group">	
							<label for="imgUpload">DAY 4 사진 & 여행정보</label>
							<input type="file" class="btn btn-xs btn-outline-secondary text-uppercase diy_f" id="diyContent4Img" name="diyContent4ImgFile">
							<textarea class="form-control border-0 bg-smoke" rows="7" name="diyContent4" ></textarea>
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
				</div><!-- //write_form -->
				
				
				
				
				
				
				
				
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
				 
				<script>
				const addButton = document.getElementById('addButton');
				const deleteButton = document.getElementById('deleteButton');
				const elementContainer = document.getElementById('elementContainer');
				
				// Counter for unique IDs
				let counter = 5;
				let addDayCount = 0;
				
				// Function to add new elements
				function addDay() {
				    if (addDayCount >= 3) {
				        // Do nothing if the function has been called 3 times
				        return;
				    }
				
				    const dayDiv = document.createElement('div');
				    dayDiv.classList.add('form-group');
				    const label = document.createElement('label');
				    label.textContent = "DAY " + counter + " 사진 & 여행정보";
				
				    const uploadInput = document.createElement('input');
				    uploadInput.type = 'file';
				    uploadInput.classList.add('btn', 'btn-xs', 'btn-outline-secondary', 'text-uppercase', 'diy_f');
				    uploadInput.id = "diyContent" + counter + "Img";
				    uploadInput.name = "diyContent" + counter + "ImgFile";
				
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


   
    
 