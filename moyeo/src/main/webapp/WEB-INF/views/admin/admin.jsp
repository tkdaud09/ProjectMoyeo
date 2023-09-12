<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
                                    <li><button class="btn"
                                            onclick="showContent('userinfoList')">전체회원목록</button></li>
                                    <li><button class="btn"
                                            onclick="showContent('userinfoModify')">회원정보수정</button></li>
                                    <li><button class="btn"
                                            onclick="showContent('userinfoDetail')">회원상세정보</button></li>
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
            <!-- Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div id="content" class="border rounded p-4">
                    <!-- 내용이 여기에 나옵니다. -->
                </div>
                <div id="userinfoListPopup" style="display: none;">
                    <!-- 팝업으로 회원 목록을 표시할 내용 -->
                </div>
            </main>
        </div>
    </div>

    <script>
    function showContent(contentType) {
        if (contentType === 'userinfoList') {
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/userinfo-list',
                type: 'GET',
                data: {
                    pageNum: 1, // 원하는 페이지 번호
                    pageSize: 10, // 원하는 페이지 크기
                    selectKeyword: '' // 검색 키워드 (원하는 키워드로 수정)
                },
                success: function (data) {
                    const userinfoList = data.userinfoList; // 서버에서 받아온 회원 리스트
                    let html = '<table class="table table-bordered">';
                    html += '<thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th></tr></thead><tbody>';

                    for (const user of userinfoList) {
                        html += '<tr>';
                        html += `<td>${user.id}</td>`;
                        html += `<td>${user.name}</td>`;
                        html += `<td>${user.email}</td>`;
                        html += `<td>${user.phone}</td>`;
                        html += '</tr>';
                    }

                    html += '</tbody></table>';
                    $('#userinfoListPopup').html(html); // 팝업에 회원 목록 표시
                    $('#userinfoListPopup').show(); // 팝업 표시
                },
                error: function () {
                    alert('회원 목록을 가져오는데 실패했습니다.');
                }
            });
        }
        // 다른 contentType에 대한 처리는 여기에 추가하세요.
    }
    </script>
</body>
</html>
