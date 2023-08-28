<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html lang="utf-8">
  
  <head>

 

<style> 
    .my{
        max-width: 1200px;
        padding: 1%;
        margin:0 auto;
    }
    
    .my h1{
        font-size: 3.5em;
        font-weight: 100;
        margin-top: 5%;
    }
    
    .my h1:nth-child(1){
    	text-align: center;
    }
    
    .my h4{
        font-size: 1.5em;
        font-weight: 400;
    }
    
    .quick_menu{
        width: 50%;
        height: 190px;
        margin-top: 5%;
    }
    
    .quick_menu ul{
        margin: 0;
        padding: 0;
        list-style: none;
        margin-top: 3%;
    }
    
    .quick_menu ul li input{
        width: 20%;
        height: 50px;
        background: #fff;
        float: left;
        margin-right: 1.5%;
        border: 1px solid #a1a1a1;
        font-size: 0.85em;
        border-radius: 5px;
    }

    .my #mypage{
        width: 100%;
        height: 500px;
        position: relative;
    }
    
    .my #mypage p{
        position: absolute;
        right: 0;
        top: 0;
        font-size: 1.2em;
        font-weight: 100;
    }
    
    .my #mypage a{
    	color: #000;
    }
    
    .my #mypage div{
        width: 100%;
        height: 350px;
        border: 1px solid #a1a1a1;
        border-radius: 10px;
        margin-top: 2%;
    }
    

</style>
</head>     

<body id="body" class="up-scroll">  


<div class="my">
	<h1>마이페이지</h1>

	<h1><u>${userinfo.name}</u>님, 안녕하세요!</h1>

    <section class="quick_menu">
        <h4>서비스 바로가기</h4>
        <ul>
            <li>
                <input type="button" value="회원정보변경"
                    onclick="location.href='/moyeo/user/pwCheck';">
            </li>

            <li>
                <input type="button" value="찜한 내역"
                    onclick="location.href='#';">
            </li>

            <li>
                <input type="button" value="1:1 문의 내역"
                    onclick="location.href='#';">
            </li>

            <li>
                <input type="button" value="탈퇴하기"
                    onclick="location.href='/moyeo/user/removePwCheck';">
            </li>
        </ul>
    </section>

    <section id="mypage">
        <h4>예약 내역</h4>
        <p><a href="#">더보기 &nbsp;→</a></p>
        <div></div>
    </section>
    
    <section id="mypage">
        <h4>후기 내역</h4>
        <p><a href="#">더보기 &nbsp;→</a></p>
        <div></div>
    </section>
</div>

	
	
	<script>
		function removeMember() {
			if (window.confirm("탈퇴하시겠습니까?")) {
				location.href = "/user/remove";//수정필요
			}
		}
	</script>
	
	 <!-- Javascript -->
		    <script src="${pageContext.request.contextPath}/assets/plugins/jquery/jquery-3.4.1.min.js"></script>
		    <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		    <script src="${pageContext.request.contextPath}/assets/plugins/menuzord/js/menuzord.js"></script>
		    
		    <script src='${pageContext.request.contextPath}/assets/plugins/isotope/isotope.min.js'></script>
		    <script src='${pageContext.request.contextPath}/assets/plugins/images-loaded/js/imagesloaded.pkgd.min.js'></script>
		    <script src='${pageContext.request.contextPath}/assets/plugins/fancybox/jquery.fancybox.min.js'></script>
		    
		    <script src='${pageContext.request.contextPath}/assets/plugins/selectric/jquery.selectric.min.js'></script>
		    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/moment.min.js'></script>
		    <script src='${pageContext.request.contextPath}/assets/plugins/daterangepicker/js/daterangepicker.min.js'></script>
		    
		    <script src="${pageContext.request.contextPath}/assets/plugins/lazyestload/lazyestload.js"></script>
		    <script src='${pageContext.request.contextPath}/assets/plugins/dzsparallaxer/dzsparallaxer.js'></script>
		    
		    
		    
		    
		    
		    <script src='${pageContext.request.contextPath}/assets/plugins/revolution/js/jquery.themepunch.tools.min.js'></script>
		    <script src='${pageContext.request.contextPath}/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js'></script>
		    <script src="${pageContext.request.contextPath}/assets/plugins/smoothscroll/SmoothScroll.js"></script>
		    
		    <script src="${pageContext.request.contextPath}/assets/js/star.js"></script>
</body>
</html>