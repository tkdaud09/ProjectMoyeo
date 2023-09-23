<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css" >
</head>
<body>
	<div id="preloader">
		<div class="spinner spinner-round"></div>
	</div>
<section id="adminpage">
	<div class="container-fluid">
		<div class="row">
			<!-- 사이드바 -->
			<div class="col-sm-2 bg-dark text-white min-vh-100">
			    <!-- 회원 관리 -->
			    <p id="userinfo-menumain"><a href="#"><i class="fas fa-user"></i>회원 관리</a></p>
			    <ul id="userinfo-menu">
			    	<li><a href="javascript:void(0)" id="userinfo-info"><i class="fas fa-user"></i>목록</a></li>
			    </ul>
			    
			    <!-- 패키지 관리 -->
				<p id="package-menumain"><a href="#"><i class="fa-solid fa-plane-departure"></i>패키지 관리</a></p>
				<ul id="package-menu">
				    <li><a href="javascript:void(0)" id="package-info"><i class="fa-solid fa-plane-departure"></i>목록</a></li>
				    <li><a href="${pageContext.request.contextPath}/admin/packageForm" id="add-package"><i class="fa-solid fa-plus"></i>등록</a></li>
				</ul>
			
			    <!-- DIY 관리 -->
			    <p id="diy-menumain"><a href="#"><i class="fa-solid fa-map-location-dot"></i>Diy 관리</a></p>
			    <ul id="diy-menu">
				    <li><a href="javascript:void(0)" id="diy-info"><i class="fa-solid fa-map-location-dot"></i>목록</a></li>
				</ul>
				
			    <!-- 공지사항 관리 -->
			    <p id="notice-menumain"><a href="#"><i class="fas fa-bell"></i>공지사항 관리</a></p>
			    <ul id="notice-menu">
				    <li><a href="javascript:void(0)" id="notice-info"><i class="fas fa-bell"></i>목록</a></li>
			        <li><a href="${pageContext.request.contextPath}/admin/write" id="add-notice"><i class="fa-solid fa-plus"></i>등록</a></li>
				</ul>
				
				<!-- 이벤트 관리 -->
			    <p id="event-menumain"><a href="#"><i class="fas fa-calendar-alt"></i>이벤트 관리</a></p>
			    <ul id="event-menu">
				    <li><a href="javascript:void(0)" id="event-info"><i class="fas fa-calendar"></i>목록</a></li>
			        <li><a href="${pageContext.request.contextPath}/admin/eventForm" id="add-event"><i class="fa-solid fa-plus"></i>등록</a></li>
				</ul>
				
			    <!-- 1:1 문의 관리 -->
			    <p id="qa-menumain"><a href="#"><i class="fas fa-question"></i>1:1문의 관리</a></p>
			    <ul id="qa-menu">
				    <li><a href="javascript:void(0)" id="qa-info"><i class="fas fa-question"></i>목록</a></li>
			  	</ul>
			  	
			    <!-- 결제 및 주문 관리 -->
			    <p id="order-menumain"><a href="#"><i class="fas fa-shopping-cart"></i>주문 및 결제 관리</a></p>
				<ul id="order-menu">
				    <li><a href="javascript:void(0)" id="order-info"><i class="fas fa-shopping-cart"></i> 결제 및 주문 관리</a></li>
			    </ul>
			</div>

			<!-- 본문 -->
			<div class="col-sm-10">
				
				<!-- 페이지 당 출력 갯수를 출력하는 태그 -->
				<select id="pageSizeSelect" class="mb-3"></select>

				<!-- 버튼 추가
				<div id="viewSelect" class="nav nav-pills text-right mb-3"></div>
				
				
				<!-- 게시글 목록을 출력하는 태그 -->
				<div id="infoListDiv" class="mb-3"></div>

				<!-- 페이지 번호를 출력하는 태그 -->
				<div id="pageNumDiv" class="mb-3 page-number-wrapper"></div>

				<!-- 검색 창을 출력하는 태그 -->
				<div id="searchDiv" class="mb-3"></div>
			</div>
		</div>
	</div>
</section>
	
<script type="text/javascript">
//CSRF 토큰 관련 정보를 자바스크립트 변수에 저장
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

// Ajax 기능을 사용하여 요청하는 모든 웹 프로그램에게 CSRF 토큰 전달 가능
// ▶ Ajax 요청 시 beforeSend 속성을 설정할 필요 없음
$(document).ajaxSend(function(e, xhr){
   xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
});
	
	var page = 1; // 기본 페이지 번호 설정
	var size = 20; // 기본 페이지 크기 설정
	var keyword = ''; // 기본 검색어 = NULL String
	var infoType = ''; // 기본 검색 타입 = NULL String(userinfo / package / diy / notice / qa / )
	var viewType = 'list'; // 기본 보기 설정 = 목록으로 보기
	
	//회원 정보 리스트 출력
	function userinfoListDisplay(pageNum, pageSize, selectKeyword) {
		$("#viewSelect").show();
		$("#pageSizeSelect").show();
		$("#pageNumDiv").show();
		$("#searchDiv").show();
		$("#packageFormDiv").show();
	   page=pageNum;
	   size=pageSize;
	   keyword=selectKeyword;
   
    $.ajax({
        method: "GET",
        url: "<c:url value="/admin/userinfo-list"/>",
        data: {"pageNum": pageNum, "pageSize": pageSize, "selectKeyword": selectKeyword},
        dataType: "json",
        success: function(result) {
            $("#infoListDiv").empty();
            
            var table = $("<table>").attr("id", "userinfoInfoTable");
            var thead = $("<thead>").append(
                "<tr>" +
                "<th style='padding: 10px; white-space: nowrap;'>아이디</th>" +
                "<th style='padding: 10px; white-space: nowrap;'>이름</th>" +
                "<th style='padding: 10px; white-space: nowrap;'>성별</th>" +
                "<th style='padding: 10px; white-space: nowrap;'>이메일</th>" +
                "<th style='padding: 10px; white-space: nowrap;'>생년월일</th>" +
                "<th style='padding: 10px; white-space: nowrap;'>주소</th>" +
                "<th style='padding: 10px; white-space: nowrap;'>전화번호</th>" +
                "<th style='padding: 10px; white-space: nowrap;'>가입일</th>" +
                "<th style='padding: 10px; white-space: nowrap;'>마지막로그인</th>" +
                "<th style='padding: 10px; white-space: nowrap;'>상태</th>" +
                "<th style='padding: 10px; white-space: nowrap;'>권한</th>" +
                "</tr>"
            );

            var tbody = $("<tbody>");

            if (result.userinfoList.length == 0) { // 검색된 게시글이 없을 때
                var row = "<tr>" +
                    "<td colspan='11'>검색된 회원 정보가 없습니다.</td>" +
                    "</tr>";
                tbody.append(row);
            } 
            for (var i = 0; i < result.userinfoList.length; i++) {
                var userinfo = result.userinfoList[i];
                var genderText = userinfo.gender === 'm' ? '남자' : '여자';
                var displayStatus = '';
                switch(userinfo.status) {
                    case 0: displayStatus = '일반회원'; break;
                    case 2: displayStatus = '휴면회원'; break;
                    case 3: displayStatus = '탈퇴회원'; break;
                    case 9: displayStatus = '관리자'; break;
                    default: displayStatus = userinfo.status;
                }
                
                var row = "<tr data-id='" + userinfo.id + "'>" +
                    "<td style='padding: 5px; white-space: nowrap;'>" + userinfo.id + "</td>" +
                    "<td style='padding: 5px; white-space: nowrap;'>" + userinfo.name + "</td>" +
                    "<td style='padding: 5px; white-space: nowrap;'>" + genderText + "</td>" +
                    "<td style='padding: 5px; white-space: nowrap;'>" + userinfo.email + "</td>" +
                    "<td style='padding: 5px; white-space: nowrap;'>" + userinfo.birth.substring(0, 10) + "</td>" +
                    "<td style='padding: 5px;'>" + userinfo.address + "</td>" +
                    "<td style='padding: 5px; white-space: nowrap;'>" + userinfo.phone + "</td>" +
                    "<td style='padding: 5px; white-space: nowrap;'>" + userinfo.regdate.substring(0, 10) + "</td>" +
                    "<td style='padding: 5px; white-space: nowrap;'>" + userinfo.logdate.substring(0, 10) + "</td>" +
                    "<td style='padding: 5px; white-space: nowrap;'>" + displayStatus + "</td>" +
                    "<td style='padding: 5px; white-space: nowrap;'>" + userinfo.enabled + "</td>" +
                    "</tr>";
                tbody.append(row);
           }

            table.append(thead, tbody);
            
            $("#infoListDiv").append(table);
            
            var searchDiv = $("#searchDiv");
           
            // 기존 테이블 및 내용 삭제
            searchDiv.empty();

            searchDiv.append(
            		"<br>"+
        		 	"<input type='text' class='form-control' id='selectKeyword' placeholder='검색어를 입력하세요'>"+
				 	"<br>"+        			
          		 	"<button id='searchButton'>검색</button>"
            )
          
            // 페이지 번호 출력
            pageNumDisplay(result.pager, infoType);
            
            // 페이지 당 출력 갯수를 출력
           pageSizeDisplay();
            
           viewSelect(infoType)
        }, 
        
        error: function(xhr) {
            alert("회원 정보를 불러오는 중에 오류가 발생했습니다. (에러 코드 = " + xhr.status + ")");
        }
    });
}
	
	//패키지 리스트 출력
	function packageListDisplay(pageNum, pageSize, selectKeyword) { 
		$("#viewSelect").show();
		$("#pageSizeSelect").show();
		$("#pageNumDiv").show();
		$("#searchDiv").show();
		$("#packageFormDiv").show();
       page=pageNum;
   	   size=pageSize;
   	   keyword=selectKeyword;
   	   
   	$.ajax({
        method: "GET",
        url: "<c:url value ="/admin/package-list"/>",
        data: {"pageNum": pageNum, "pageSize": pageSize, "selectKeyword": selectKeyword},
        dataType: "json",
        success: function(result) {
			console.log(result);
			$("#infoListDiv").empty();
           
			// 목록으로 보기를 눌렀을 때
			if(viewType === "list") {
				var table = $("<table>").attr("id", "packageInfoTable");
                var thead = $("<thead>").append(
                      "<tr>" +
                       "<th style='min-width:100px; white-space: nowrap;'>번호</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>종류</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>제목</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>시작일</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>종료일</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>등록일</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>인원수</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>성인 가격</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>소인 가격</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>하트수</th>" +
                       "<th style='min-width:100px; white-space: nowrap;'>상태</th>" +
                       "</tr>"
                );
   
                var tbody = $("<tbody>");
   
                if (result.packageList.length == 0) { // 검색된 게시글이 없을 때
                    var row = "<tr>" +
                       "<td colspan='11'>검색된 패키지가 없습니다.</td>" +
                       "</tr>";
                    tbody.append(row);
                }
                for (var i = 0; i < result.packageList.length; i++) {
                    var pack = result.packageList[i];
                    var row = "<tr data-idx='" + pack.packIdx + "'>";
                    
                    if (pack.packStatus == 0) {
                        row += "<td>" + pack.packIdx + "</td>";
                    } else if (pack.packStatus == 1) {
                        row += "<td style='background-color: red;'>" + pack.packIdx + "</td>";
                    } else {
                        row += "<td style='background-color: #87CEEB;'>" + pack.packIdx + "</td>";
                    }
                    row += "<td>" + pack.packKind + "</td>" +
                       	   "<td>" + pack.packTitle + "</td>" +
                       	   "<td>" + pack.packStartDate + "</td>" +
                           "<td>" + pack.packEndDate + "</td>" +
                           "<td>" + pack.packRegDate.substring(0, 10) + "</td>" +
                           "<td>" + pack.packPeople + "</td>" +
                           "<td>" + pack.packChildPrice + "</td>" +
                           "<td>" + pack.packAdultPrice + "</td>" +
                           "<td>" + pack.packHeartCnt + "</td>" +
                           "<td>" + pack.packStatus + "</td>" +
                           "</tr>";
                   tbody.append(row);
               }
               
                table.append(thead, tbody);
               
                $("#infoListDiv").append(table);
           }

           var searchDiv = $("#searchDiv");
            
            // 기존 테이블 및 내용 삭제
            searchDiv.empty();

            searchDiv.append(
            		"<br>"+
        		 	"<input type='text' class='form-control' id='selectKeyword' placeholder='검색어를 입력하세요'>"+
				 	"<br>"+        			
          		 	"<button id='searchButton'>검색</button>"
            )
          
            // 페이지 번호 출력
            pageNumDisplay(result.pager, infoType);
            
            // 페이지 당 출력 갯수를 출력
           pageSizeDisplay();
            
           viewSelect(infoType)
        },
        error: function(xhr) {
            alert("패키지 정보를 불러오는 중에 오류가 발생했습니다. (에러 코드 = " + xhr.status + ")");
        }
      
    });
}
	
	//Diy 목록 출력 함수
	function diyListDisplay(pageNum, pageSize, selectKeyword) {
		$("#viewSelect").show();
		$("#pageSizeSelect").show();
		$("#pageNumDiv").show();
		$("#searchDiv").show();
		$("#packageFormDiv").show();
	   page=pageNum;
	   size=pageSize;
	   keyword=selectKeyword;
	   
	    $.ajax({
	        method: "GET",
	        url: "<c:url value ="/admin/diy-list"/>",
	        data: {"pageNum": pageNum, "pageSize": pageSize, "selectKeyword": selectKeyword},
	        dataType: "json",
	        success: function(result) {
	        	console.log(result);
	           	$("#infoListDiv").empty();
	            
	            var table = $("<table>").attr("id", "diyInfoTable");
	            var thead = $("<thead>").append(
	                "<tr>" +
	                "<th style='padding: 10px; white-space: nowrap;'>번호</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>출발일</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>도착일</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>사람수</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>지역</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>등록일</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>수정일</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>좋아요수</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>제목</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>소개글</th>" +
	                "</tr>"
	            );

	            var tbody = $("<tbody>");

	            if (result.diyList.length == 0) { // 검색된 게시글이 없을 때
	                var row = "<tr>" +
	                    "<td colspan='10'>검색된 Diy가 없습니다.</td>" +
	                    "</tr>";
	                tbody.append(row);
	            } 
	            for (var i = 0; i < result.diyList.length; i++) {
	                var diy = result.diyList[i];
	                var row = "<tr data-idx='" + diy.diyIdx + "'>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyIdx + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyStartdate + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyEnddate + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyPeople + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyLoc + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyRegdate + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyModifydate + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + diy.loveCount + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + diy.diyTitle + "</td>" +
	                    "<td>" + diy.diyIntroduction + "</td>" +
	                    "</tr>";
	                tbody.append(row);
	           }

	            table.append(thead, tbody);
	            
	            $("#infoListDiv").append(table);
	            
	            var searchDiv = $("#searchDiv");
	           
	            // 기존 테이블 및 내용 삭제
	            searchDiv.empty();

	            searchDiv.append(
	            		"<br>"+
	        		 	"<input type='text' class='form-control' id='selectKeyword' placeholder='검색어를 입력하세요'>"+
					 	"<br>"+        			
	          		 	"<button id='searchButton'>검색</button>"
	            )
	          
	            // 페이지 번호 출력
	            pageNumDisplay(result.pager, infoType);
	            
	            // 페이지 당 출력 갯수를 출력
	            pageSizeDisplay();
	            
	            viewSelect(infoType)
	        },
	        
	        error: function(xhr) {
	            alert("Diy를 불러오는 중에 오류가 발생했습니다. (에러 코드 = " + xhr.status + ")");
	        }
	    });
	}
	
	
	//공지 사항 목록 출력 함수
	function noticeListDisplay(pageNum, pageSize, selectKeyword) {
		$("#viewSelect").show();
		$("#pageSizeSelect").show();
		$("#pageNumDiv").show();
		$("#searchDiv").show();
		$("#packageFormDiv").show();
	   page=pageNum;
	   size=pageSize;
	   keyword=selectKeyword;
	   
	    $.ajax({
	        method: "GET",
	        url: "<c:url value ="/admin/notice-list"/>",
	        data: {"pageNum": pageNum, "pageSize": pageSize, "selectKeyword": selectKeyword},
	        dataType: "json",
	        success: function(result) {
	        	console.log(result);
	           	$("#infoListDiv").empty();
	            
	            var table = $("<table>").attr("id", "noticeInfoTable");
	            var thead = $("<thead>").append(
	                "<tr>" +
	                "<th style='padding: 10px; white-space: nowrap;'>번호</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>제목</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>내용</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>작성일</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>조회수</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>상태</th>" +
	                "</tr>"
	            );

	            var tbody = $("<tbody>");

	            if (result.noticeList.length == 0) { // 검색된 게시글이 없을 때
	                var row = "<tr>" +
	                    "<td colspan='6'>검색된 공지 사항이 없습니다.</td>" +
	                    "</tr>";
	                tbody.append(row);
	            } 
	            for (var i = 0; i < result.noticeList.length; i++) {
	                var notice = result.noticeList[i];
	                var row = "<tr data-idx='" + notice.noticeIdx + "'>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + notice.noticeIdx + "</td>" +
	                    "<td>" + notice.noticeTitle + "</td>" +
	                    "<td>" + notice.noticeContent + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + notice.noticeRegDate + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + notice.noticeViewcnt + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + notice.noticeStatus+ "</td>" +
	                    "</tr>";
	                tbody.append(row);
	           }

	            table.append(thead, tbody);
	            
	            $("#infoListDiv").append(table);
	            
	            var searchDiv = $("#searchDiv");
	           
	            // 기존 테이블 및 내용 삭제
	            searchDiv.empty();

	            searchDiv.append(
	            		"<br>"+
	        		 	"<input type='text' class='form-control' id='selectKeyword' placeholder='검색어를 입력하세요'>"+
					 	"<br>"+        			
	          		 	"<button id='searchButton'>검색</button>"
	            )
	          
	            // 페이지 번호 출력
	            pageNumDisplay(result.pager, infoType);
	            
	            // 페이지 당 출력 갯수를 출력
	            pageSizeDisplay();
	            
	            viewSelect(infoType)
	        },
	        
	        error: function(xhr) {
	            alert("공지 사항을 불러오는 중에 오류가 발생했습니다. (에러 코드 = " + xhr.status + ")");
	        }
	    });
	}
	
	//이벤트 목록 출력 함수
	function eventListDisplay(pageNum, pageSize, selectKeyword) {
		$("#viewSelect").show();
		$("#pageSizeSelect").show();
		$("#pageNumDiv").show();
		$("#searchDiv").show();
		$("#packageFormDiv").show();
	   page=pageNum;
	   size=pageSize;
	   keyword=selectKeyword;
	   
	    $.ajax({
	        method: "GET",
	        url: "<c:url value ="/admin/event-list"/>",
	        data: {"pageNum": pageNum, "pageSize": pageSize, "selectKeyword": selectKeyword},
	        dataType: "json",
	        success: function(result) {
	        	console.log(result);
	           	$("#infoListDiv").empty();
	            
	            var table = $("<table>").attr("id", "eventInfoTable");
	            var thead = $("<thead>").append(
	                "<tr>" +
	                "<th style='padding: 10px; white-space: nowrap;'>번호</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>제목</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>내용</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>등록일</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>시작 날짜</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>종료 날짜</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>상태</th>" +
	                "</tr>"
	            );

	            var tbody = $("<tbody>");

	            if (result.eventList.length == 0) { // 검색된 게시글이 없을 때
	                var row = "<tr>" +
	                    "<td colspan='7'>검색된 공지 사항이 없습니다.</td>" +
	                    "</tr>";
	                tbody.append(row);
	            } 
	            for (var i = 0; i < result.eventList.length; i++) {
	                var event = result.eventList[i];
	                var row = "<tr data-idx='" + event.eventIdx + "'>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + event.eventIdx + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + event.eventTitle + "</td>" +
	                    "<td>" + event.eventContent + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + event.eventRegdate + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + event.eventStartdate + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + event.eventEnddate+ "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + event.eventStatus+ "</td>" +
	                    "</tr>";
	                tbody.append(row);
	           }

	            table.append(thead, tbody);
	            
	            $("#infoListDiv").append(table);
	            
	            var searchDiv = $("#searchDiv");
	           
	            // 기존 테이블 및 내용 삭제
	            searchDiv.empty();

	            searchDiv.append(
	            		"<br>"+
	        		 	"<input type='text' class='form-control' id='selectKeyword' placeholder='검색어를 입력하세요'>"+
					 	"<br>"+        			
	          		 	"<button id='searchButton'>검색</button>"
	            )
	          
	            // 페이지 번호 출력
	            pageNumDisplay(result.pager, infoType);
	            
	            // 페이지 당 출력 갯수를 출력
	            pageSizeDisplay();
	            
	            viewSelect(infoType)
	        },
	        
	        error: function(xhr) {
	            alert("이벤트를 불러오는 중에 오류가 발생했습니다. (에러 코드 = " + xhr.status + ")");
	        }
	    });
	}
	
	
	//1:1문의 목록 출력 함수
	function qaListDisplay(pageNum, pageSize, selectKeyword) {
		$("#viewSelect").hide();
		$("#pageSizeSelect").show();
		$("#pageNumDiv").show();
		$("#searchDiv").show();
		$("#packageFormDiv").show();
	   page=pageNum;
	   size=pageSize;
	   keyword=selectKeyword;
	   
	    $.ajax({
	        method: "GET",
	        url: "<c:url value ="/admin/qa-list"/>",
	        data: {"pageNum": pageNum, "pageSize": pageSize, "selectKeyword": selectKeyword},
	        dataType: "json",
	        success: function(result) {
	        	console.log(result);
	            $("#infoListDiv").empty();
	            
	            var table = $("<table>").attr("id", "qaInfoTable");
	            var thead = $("<thead>").append(
	                "<tr>" +
	                "<th style='padding: 10px; white-space: nowrap;'>글번호</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>종류</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>제목</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>내용</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>등록일</th>" +
	                "<th style='padding: 10px; white-space: nowrap;'>답변상태</th>" +
	                "</tr>"
	            );

	            var tbody = $("<tbody>");

	            if (result.qaList.length == 0) { // 검색된 게시글이 없을 때
	                var row = "<tr>" +
	                    "<td colspan='6'>검색된 1:1문의가 없습니다.</td>" +
	                    "</tr>";
	                tbody.append(row);
	            } 
	            for (var i = 0; i < result.qaList.length; i++) {
	                var qa = result.qaList[i];
	                var replyStatusText = qa.qaReplyStatus === 0 ? '답변대기' : '답변완료';
	                var replyStatusColor = qa.qaReplyStatus === 0 ? '' : 'blue';
	                var row = "<tr data-idx='" + qa.qaIdx + "'>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + qa.qaIdx + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + qa.qaOption + "</td>" +
	                    "<td>" + qa.qaTitle + "</td>" +
	                    "<td>" + qa.qaContent  + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap;'>" + qa.qaRegdate + "</td>" +
	                    "<td style='padding: 10px; white-space: nowrap; color: " + replyStatusColor + ";'>" + replyStatusText + "</td>" +
	                    "<td></td>" +
	                    "</tr>";
	                tbody.append(row);
	                /*
	                if(qa.qaReplyStatus != null && qa.qaReplyStatus != '') {
	                   var row2 = "<tr data-idx='" + qa.qaIdx + "' style='background : blue'>" +
	                    "<td></td>" +
	                    "<td></td>" +
	                    "<td> ↳답변: " + qa.qaTitle + "</td>" +
	                    "<td></td>" +
	                    "<td>" + replyStatusText + "</td>" +
	                    "</tr>";
	                tbody.append(row2);
	                }
	                */
	           }

	            table.append(thead, tbody);
	            
	            $("#infoListDiv").append(table);
	            
	            var searchDiv = $("#searchDiv");
	           
	            // 기존 테이블 및 내용 삭제
	            searchDiv.empty();

	            searchDiv.append(
	            		"<br>"+
	        		 	"<input type='text' class='form-control' id='selectKeyword' placeholder='검색어를 입력하세요'>"+
					 	"<br>"+        			
	          		 	"<button id='searchButton'>검색</button>"
	            )
	          
	            // 페이지 번호 출력
	            pageNumDisplay(result.pager, infoType);
	            
	            // 페이지 당 출력 갯수를 출력
	           pageSizeDisplay();
	            
	           viewSelect(infoType)
	        },
	        
	        error: function(xhr) {
	            alert("Q&A 정보를 불러오는 중에 오류가 발생했습니다. (에러 코드 = " + xhr.status + ")");
	        }
	    });
	}
	
	
	//페이지 번호를 출력하는 함수
	function pageNumDisplay(pager, infoType) {
	    var html = "";
	    if (pager.startPage > pager.blockSize) {
	        html += "<a href=\"javascript:" + infoType + "ListDisplay(" + pager.prevPage + ", " + size + ", '" + keyword + "');\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-left'/></a>";
	    } else {
	        html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-left'/></a>";
	    }

	    for (var i = pager.startPage; i <= pager.endPage; i++) {
	        if (pager.pageNum != i) {
	            html += "<a class='btn btn-direction btn-default btn-rounded' href=\"javascript:" + infoType + "ListDisplay(" + i + ", " + size + ", '" + keyword + "');\">" + i + "</a>";
	        } else {
	            html += "<a class='btn btn-direction btn-default btn-rounded' disabled>" + i + "</a>";
	        }
	    }

	    if (pager.endPage != pager.totalPage) {
	        html += "<a href=\"javascript:" + infoType + "ListDisplay(" + pager.prevPage + ", " + size + ", '" + keyword + "');\" class='btn btn-direction btn-default btn-rounded'><i class='fa fa-long-arrow-right'/></a>";
	    } else {
	        html += "<a class='btn btn-direction btn-default btn-rounded' disabled><i class='fa fa-long-arrow-right'/></a>";
	    }

	    $("#pageNumDiv").html(html);
	}
	
	// 페이지 당 출력 갯수를 설정하는 함수
	function pageSizeDisplay() {
	    // 페이지 크기 선택
	    var pageSizeSelect = $("#pageSizeSelect");

	    pageSizeSelect.empty(); // 기존 옵션 초기화

	    var pageSizeOptions = [10, 20, 50, 100];
	    for (var i = 0; i < pageSizeOptions.length; i++) {
	        var optionValue = pageSizeOptions[i];
	        var optionText = optionValue + "개씩 보기";

	        var option = $("<option>").val(optionValue).text(optionText);

	        if (optionValue === size) {
	            option.prop("selected", true);
	        }
	        pageSizeSelect.append(option);
	    }
	}
	
	// 검색하는 함수
	function performSearch() {
	    var selectKeyword = $("#selectKeyword").val();
	    if (infoType == "userinfo") {
	        userinfoListDisplay(1, size, selectKeyword);
	    } else if (infoType == "package") {
	        packageListDisplay(1, size, selectKeyword);
	    } else if (infoType == "diy") {
	        diyListDisplay(1, size, selectKeyword);
	    } else if (infoType == "notice") {
	        noticeListDisplay(1, size, selectKeyword);
	    } else if (infoType == "event") {
	        eventListDisplay(1, size, selectKeyword);
	    } else if (infoType == "qa") {
	        qaListDisplay(1, size, selectKeyword);
	    }
	}
	
	//회원 상세 정보를 열람하기 위한 함수
	function userinfoDetail(id) {
		$("#viewSelect").hide();
		$("#pageSizeSelect").hide();
		$("#pageNumDiv").hide();
		$("#searchDiv").hide();
	    $.ajax({
	        method: "GET",
	        url: "<c:url value='/admin/userinfo-detail'/>",
	        data: {"id": id},
	        dataType: "html",
	        success: function(html) {
	            var userinfoDetailDiv = $("<div>").html(html); // HTML을 DOM 요소로 변환
	            $("#infoListDiv").empty().append(userinfoDetailDiv); // 기존 내용 지우고 새로운 내용 삽입
	        },
	        error: function(xhr) {
	            alert("상세 정보를 불러오는 중에 오류가 발생했습니다. 에러 코드 = (" + xhr.status + ")");
	        }
	    });
	}
	
	// 패키지 상세 정보를 열람하기 위한 함수
	function packageDetail(idx) {
		$("#viewSelect").hide();
		$("#pageSizeSelect").hide();
		$("#pageNumDiv").hide();
		$("#searchDiv").hide();
	    $.ajax({
	        method: "GET",
	        url: "<c:url value='/admin/package-detail'/>",
	        data: {"idx": idx},
	        dataType: "html",
	        success: function(html) {
	            var packageDetailDiv = $("<div>").html(html); // HTML을 DOM 요소로 변환
	            $("#infoListDiv").empty().append(packageDetailDiv); // 기존 내용 지우고 새로운 내용 삽입
	        },
	        error: function(xhr) {
	            alert("상세 정보를 불러오는 중에 오류가 발생했습니다. 에러 코드 = (" + xhr.status + ")");
	        }
	    });
	}

	$(document).ready(
			function() {
				$("#pageSizeSelect").hide();
				$("#viewSelect").hide();

				//회원 목록 버튼 클릭 시
				$("#userinfo-info").off("click").on("click", function() {
					$("#viewSelect").show();
					$("#pageSizeSelect").show();
					$("#pageNumDiv").show();
					$("#searchDiv").show();
					page = 1;
					size = 20;
					keyword = '';
					infoType = "userinfo";
					userinfoListDisplay(page, size, keyword);

					$("#pageSizeSelect").val(size);
				});

				//패키지 목록 버튼 클릭 시
				$("#package-info").click(function() {

					$("#viewSelect").show();
					$("#pageSizeSelect").show();
					$("#pageNumDiv").show();
					$("#searchDiv").show();
					page = 1;
					size = 20;
					keyword = '';
					infoType = "package";
					viewType = "list";
					packageListDisplay(page, size, keyword);

					$("#pageSizeSelect").val(size);
				});

				//diy 목록 버튼 클릭 시
				$("#diy-info").click(function() {

					$("#viewSelect").show();
					$("#pageSizeSelect").show();
					$("#pageNumDiv").show();
					$("#searchDiv").show();
					page = 1;
					size = 20;
					keyword = '';
					infoType = "diy";
					viewType = "list";
					diyListDisplay(page, size, keyword);

					$("#pageSizeSelect").val(size);
				});

				//공지사항 목록 버튼 클릭 시
				$("#notice-info").click(function() {

					$("#viewSelect").show();
					$("#pageSizeSelect").show();
					$("#pageNumDiv").show();
					$("#searchDiv").show();
					page = 1;
					size = 20;
					keyword = '';
					infoType = "notice";
					viewType = "list";
					noticeListDisplay(page, size, keyword);

					$("#pageSizeSelect").val(size);
				});
				
				//이벤트 목록 버튼 클릭 시
				$("#event-info").click(function() {

					$("#viewSelect").show();
					$("#pageSizeSelect").show();
					$("#pageNumDiv").show();
					$("#searchDiv").show();
					page = 1;
					size = 20;
					keyword = '';
					infoType = "event";
					viewType = "list";
					eventListDisplay(page, size, keyword);

					$("#pageSizeSelect").val(size);
				});

				//1:1문의 목록 버튼 클릭 시
				$("#qa-info").click(function() {

					$("#viewSelect").show();
					$("#pageSizeSelect").show();
					$("#pageNumDiv").show();
					$("#searchDiv").show();
					page = 1;
					size = 20;
					keyword = '';
					infoType = "qa";
					viewType = "list";
					qaListDisplay(page, size, keyword);

					$("#pageSizeSelect").val(size);
				});

				//결제주문 목록 버튼 클릭 시
				$("#order-info").click(function() {

					$("#viewSelect").show();
					$("#pageSizeSelect").show();
					$("#pageNumDiv").show();
					$("#searchDiv").show();
					page = 1;
					size = 20;
					keyword = '';
					infoType = "order";
					viewType = "list";
					orderListDisplay(page, size, keyword);

					$("#pageSizeSelect").val(size);
				});

				//한 페이지 당 출력 갯수를 변경햇을 시
				$("#pageSizeSelect").change(function() {
					var functionName = infoType + "ListDisplay";
					var selectedPageSize = parseInt($(this).val());

					// 동적으로 함수 호출
					window[functionName](page, selectedPageSize, keyword);
				});
				
				//검색 버튼 클릭 시
				$("#searchDiv").on("click", "#searchButton", function() {
					performSearch();
				});

				// Enter 키를 눌렀을 때 검색 버튼 클릭과 동일한 기능 실행
				$(document).on("keydown", "#selectKeyword", function(event) {
					if (event.key === "Enter") {
						performSearch();
					}
				});

				//목록으로 보기 버튼 클릭 시
				$("#viewSelect").on("click", "#listViewButton", function() {
					viewType = "list";
					packageListDisplay(page, size, keyword);
				});

				// 회원 tr 태그 클릭 시 상세 정보 보기로 이동
				$("#infoListDiv").on("click", "#userinfoInfoTable tbody tr",function() {
					var id = $(this).data("id");
					userinfoDetail(id);
				});
				
				// 패키지 tr 태그 클릭 시 패키지 수정 페이지 이동
				$("#infoListDiv").on("click", "#packageInfoTable tbody tr", function() {
				    var idx = $(this).data("idx");
				    // 패키지 정보를 가져온 후, 수정 페이지로 이동
				    window.location.href = "/moyeo/admin/packageModify/" + idx; // 수정된 경로
				});
				
				// Diy tr 태그 클릭 시 Diy 상세 페이지 이동
				$("#infoListDiv").on("click", "#diyInfoTable tbody tr", function() {
				    var idx = $(this).data("idx");
				    // 패키지 정보를 가져온 후, 수정 페이지로 이동
				    window.location.href = "/moyeo/diy/diy_detail/" + idx; // 수정된 경로
				});
				
				// 공지사항 tr 태그 클릭 시 공지사항 수정 페이지 이동
				$("#infoListDiv").on("click", "#noticeInfoTable tbody tr", function() {
				    var idx = $(this).data("idx");
				    window.location.href = "/moyeo/admin/modify/" + idx; // 수정된 경로
				});
				
				// 이벤트 tr 태그 클릭 시 공지사항 수정 페이지 이동
				$("#infoListDiv").on("click", "#eventInfoTable tbody tr", function() {
				    var idx = $(this).data("idx");
				    window.location.href = "/moyeo/admin/edit/" + idx; // 수정된 경로
				});
				
				// 1:1 문의 tr 태그 클릭 시 1:1 문의 상세 페이지 이동
				$("#infoListDiv").on("click", "#qaInfoTable tbody tr", function() {
				    var idx = $(this).data("idx");
				    window.location.href = "/moyeo/admin/qaDetail/" + idx; // 수정된 경로
				});

			});
	//회원 메뉴
	$(document).ready(function() {
		// 회원 메뉴를 클릭했을 때 토글 기능 적용
		$('#package-menumain').click(function() {
			$('#package-menu').slideToggle();
		});
	});

	//패키지 메뉴
	$(document).ready(function() {
		// 패키지 메뉴를 클릭했을 때 토글 기능 적용
		$('#userinfo-menumain').click(function() {
			$('#userinfo-menu').slideToggle();
		});
	});

	//diy 메뉴
	$(document).ready(function() {
		// 패키지 메뉴를 클릭했을 때 토글 기능 적용
		$('#diy-menumain').click(function() {
			$('#diy-menu').slideToggle();
		});
	});

	//공지사항 메뉴
	$(document).ready(function() {
		// 패키지 메뉴를 클릭했을 때 토글 기능 적용
		$('#notice-menumain').click(function() {
			$('#notice-menu').slideToggle();
		});
	});
	
	//이벤트 메뉴
	$(document).ready(function() {
		// 패키지 메뉴를 클릭했을 때 토글 기능 적용
		$('#event-menumain').click(function() {
			$('#event-menu').slideToggle();
		});
	});

	//1:1 문의 메뉴
	$(document).ready(function() {
		// 패키지 메뉴를 클릭했을 때 토글 기능 적용
		$('#qa-menumain').click(function() {
			$('#qa-menu').slideToggle();
		});
	});

	//결제 및 주문 메뉴
	$(document).ready(function() {
		// 패키지 메뉴를 클릭했을 때 토글 기능 적용
		$('#order-menumain').click(function() {
			$('#order-menu').slideToggle();
		});
	});
</script>	
</body>
</html>
