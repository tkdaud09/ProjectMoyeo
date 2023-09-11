<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* Sidebar */
#sidebarMenu {
	background-color: #343a40;
	color: white;
	min-height: 100vh;
}

#sidebarMenu .nav-item {
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

#sidebarMenu .btn {
	width: 100%;
	text-align: left;
	color: white;
	padding: 15px;
}

#sidebarMenu .btn i {
	margin-right: 10px;
}

#sidebarMenu .btn:hover, #sidebarMenu .btn:focus {
	background-color: #495057;
	color: white;
}

/* Content */
#content {
	padding: 20px;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<!-- Sidebar -->
		<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block">
			<div class="position-sticky pt-3">
				<ul class="nav flex-column">
					<li class="nav-item">
						<button class="btn" data-bs-toggle="collapse"
							data-bs-target="#userManagementSubmenu">
							<i class="fas fa-user"></i> 회원 관리
						</button>
						<div class="collapse" id="userManagementSubmenu">
							<ul class="nav flex-column">
								<li><button class="btn" onclick="showContent('allUsers')">전체회원목록</button></li>
								<li><button class="btn" onclick="showContent('editUser')">회원정보수정</button></li>
								<li><button class="btn" onclick="showContent('userDetails')">회원상세정보</button></li>
							</ul>
						</div>
					</li>
					<li class="nav-item">
						<button class="btn" onclick="showContent('packageManagement')">
							<i class="fa-solid fa-plane-departure"></i> 패키지 관리
						</button>
					</li>
					<li class="nav-item">
						<button class="btn" onclick="showContent('diyManagement')">
							<i class="fa-solid fa-map-location-dot"></i> DIY 관리
						</button>
					</li>
					<li class="nav-item">
						<button class="btn" onclick="showContent('noticeManagement')">
							<i class="fas fa-bullhorn"></i> 공지사항 관리
						</button>
					</li>
					<li class="nav-item">
						<button class="btn" onclick="showContent('inquiryManagement')">
							<i class="fas fa-question"></i> 1:1문의 관리
						</button>
					</li>
					<li class="nav-item">
						<button class="btn" onclick="showContent('paymentManagement')">
							<i class="fas fa-dollar-sign"></i> 결제 및 주문 관리
						</button>
					</li>
				</ul>
			</div>
		</nav>
		<!-- /Sidebar -->
		<div class="row">
	            <div class="col-sm-12 content-area">
	                <!-- 페이지 당 출력 갯수를 출력하는 태그 -->
	                <select id="pageSizeSelect" ></select>
	
		            <!-- 버튼 추가 -->
		            <div id="viewSelect" class="nav nav-pills text-right"></div>
		            
					<br>	            
	
	                <!-- 게시글 목록을 출력하는 태그 -->
	                <div id="infoListDiv"></div>
	
	                <!-- 페이지 번호를 출력하는 태그 -->
	                <div id="pageNumDiv"></div>
	                
	                <!-- 검색 창을 출력하는 태그 -->
	                <div id="searchDiv"></div>
	            </div>
        </div><!-- / row -->
		
		
		<!-- Content -->
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<div id="content" class="border rounded p-4">
				<!-- 내용이 여기에 나옵니다. -->
			</div>
		</main>
	</div>
</div>

<script type="text/javascript">
	var page = 1; // 기본 페이지 번호 설정
	var size = 20; // 기본 페이지 크기 설정
	var keyword = ''; // 기본 검색어 = NULL String
	var infoType = ''; // 기본 검색 타입 = NULL String(userinfo / package / qa / notice)
	var viewType = 'list'; // 기본 보기 설정 = 목록으로 보기
	
	// 회원 정보 리스트 출력 함수
	function userinfoListDisplay(pageNum, pageSize, selectKeyword) {
		$("#viewSelect").show();
		$("#pageSizeSelect").show();
		$("#pageNumDiv").show();
		$("#searchDiv").show();
	   page=pageNum;
	   size=pageSize;
	   keyword=selectKeyword;
	
		$.ajax({
			method: "GET",
			url: "<c:url value ="/admin/userinfo_list"/>",
	        data: {"pageNum": pageNum, "pageSize": pageSize, "selectKeyword": selectKeyword},
	        dataType: "json",
		})
	
	}	
	
	
</script>

</body>
</html>
