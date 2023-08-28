<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
  
 <head>
</head>     
<body id="body" class="up-scroll">
  
  <div class="main-wrapper packages-grid">


<!-- ====================================
———	PAGE TITLE
===================================== -->
<section class="page-title">
  <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(assets/img/pages/page-title-bg6.jpg);">
    <div class="container">
      <div class="row align-items-center justify-content-center" style="height: 200px;">
        <div class="col-lg-6">
          <div class="page-title-content">
            <div class="title-border">
              <h2 class="text-uppercase text-white font-weight-bold">나만의 DIY 여행</h2>
            </div>
            <p class="text-white mb-0"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- ====================================
———	DIY 작성 폼
===================================== -->


<section class="">
  <div class="container">
		<div class="py-10">
			<div class="diy_content">
				
				<div class="diy_form_title">
					DIY 작성
				</div>

				<div class="diy_form_content">
					
					<div class="from_box">
						<table>
							<tr>
								<td>출발/도착</td>
								<td><input type="text" placeholder="출발/도착일" name="date" required></td>
							</tr>
							<tr>
								<td>인원</td>
								<td><input type="text" placeholder="인원" name="people" required></td>
							</tr>
							<tr>
								<td>지역</td>
								<td><input type="text" placeholder="지역" name="loc" required></td>
							</tr>
							<tr>
								<td>경비</td>
								<td><input type="text" placeholder="경비" name="price" required></td>
							</tr>
						</table>
					

					<div class="map_spot">
						<div class="map_spot_left">
							지도 API가 들어갈 공간
						</div>

						<div class="map_spot_right">
							<table>
								<tr>
									<td><input type="radio" name="chk_info" value="1day"></td>
									<td>1일차</td>
									<td><input type="text" placeholder="ex)부산역 > 자갈치 > 광안리 > 해운대" name="price" required></td>
								</tr>
								<tr>
									<td><input type="radio" name="chk_info" value="2day"></td>
									<td>2일차</td>
									<td><input type="text" placeholder="ex)부산역 > 사직 > 남포동" name="price" required></td>
								</tr>
								<tr>
									<td><input type="radio" name="chk_info" value="3day"></td>
									<td>3일차</td>
									<td><input type="text" placeholder="ex)부산역 > 사직 > 남포동" name="price" required></td>
								</tr>
							</table>

						</div>
					</div>

					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" placeholder="제목을 입력해 주세요" name="date" required></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea id="subject" name="subject" placeholder="내용을 입력해 주세요" style="width:100%; height:150px"></textarea></td>
						</tr>
					</table>

					</div><!-- from_box -->

					
					<div class="div_upload_btn">
						<a href="#"><button>올리기</button></a>
					</div>
	
					</table>

				</div>
			</div>
				
				
				

		</div><!-- py-10 -->
    </div>	<!-- /container -->
</section>


  
  
  


  </body>
</html>
