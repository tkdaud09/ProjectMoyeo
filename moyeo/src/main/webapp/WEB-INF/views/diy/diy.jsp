<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <!-- 페이지 타이틀 설정 -->
    <title>나만의 DIY 여행</title>
</head>
<body id="body" class="up-scroll">
    <div class="main-wrapper packages-grid">
        <!-- 페이지 타이틀 섹션 -->
        <section class="page-title">
            <div class="page-title-img bg-img bg-overlay-darken" style="background-image: url(${pageContext.request.contextPath}/assets/img/pages/page-title-bg6.jpg);">
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

        <!-- DIY 섹션 -->
        <section>
            <div class="container">
                <div class="py-10">
                    <div class="diy_content">
                        <div class="diy_form_title diy_spp">
                            DIY 안내
                        </div>

                        <div class="div_con1">
                            <p class="p1"><img src="${pageContext.request.contextPath}/assets/img/diy_main.png"></p>

                            <!-- 공식 패키지 정보 -->
                            <!--
                            <div class="div_title">공식패키지</div>
                            <div class="div_p">
                                <div class="div_pack1 sp">
                                    <div class="div_pack1_img"></div>
                                    <div class="div_pack1_text af">
                                        <p class="t1">공식패키지 제목이 들어갈 공간입니다</p>
                                        <p class="t2">공식패키지 텍스트 공간...</p>
                                        <div class="t_left">
                                            <p class="t1">출발가</p>
                                            <p class="t2">300,000원~</p>
                                        </div>
                                        <div class="t_right">
                                            <a href="#"><button>자세히보기</button></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="div_pack1">
                                    <div class="div_pack1_img"></div>
                                    <div class="div_pack1_text af">
                                        <p class="t1">공식패키지 제목이 들어갈 공간입니다</p>
                                        <p class="t2">공식패키지 텍스트 공간...</p>
                                        <div class="t_left">
                                            <p class="t1">출발가</p>
                                            <p class="t2">300,000원~</p>
                                        </div>
                                        <div class="t_right">
                                            <a href="#"><button>자세히보기</button></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            -->

                            <c:choose>
					   	    <c:when test="${userinfo.id ne null}">
					   	      <div class="div_btn1">
					            <a href="${pageContext.request.contextPath}/diy/diy_add"><button>참여하기</button></a>
					          </div>
					   	    </c:when>
					   	  
					   	    <c:otherwise>
					   	      <div class="div_btn1">
					            <a onclick="Login()"><button>참여하기</button></a>
					          </div>  
					   	    </c:otherwise>
					   	  </c:choose>
                        </div>

                        <!-- DIY 패키지 리스트 샘플 -->
                        <div class="div_con2">
                            <div class="div_list_sample">
                                <div class="dls_left"></div>
                                <div class="dls_right">
                                    <ul>
                                        <a href="#"><li class="l1">DIY 패키지 상품 전체 리스트 샘플 제목이 들어갈 공간</li></a>
                                        <li class="l2">텍스트가 들어갈 공간입니다.텍스트가 들어갈 공간입니다.텍스트가 들어갈 공간입니다.텍스트</li>
                                        <li class="l3">김*아 &nbsp;&nbsp;&nbsp; 2023-08-17</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="div_list_sample">
                                <div class="dls_left"></div>
                                <div class="dls_right">
                                    <ul>
                                        <a href="#"><li class="l1">DIY 패키지 상품 전체 리스트 샘플 제목이 들어갈 공간</li></a>
                                        <li class="l2">텍스트가 들어갈 공간입니다.텍스트가 들어갈 공간입니다.텍스트가 들어갈 공간입니다.텍스트가 들어갈 공간입니다.텍스트 간입니다.텍스트가 들어갈 공간입니다.텍스트간입니다.텍스트가 들어갈 공간입니다.텍스트</li>
                                        <li class="l3">김*아 &nbsp;&nbsp;&nbsp; 2023-08-17</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="div_list_sample">
                                <div class="dls_left"></div>
                                <div class="dls_right">
                                    <ul>
                                        <a href="#"><li class="l1">DIY 패키지 상품 전체 리스트 샘플 제목이 들어갈 공간</li></a>
                                        <li class="l2">텍스트가 들어갈 공간입니다.텍스트가 들어갈 공간입니다.텍스트가 들어갈 공간입니다.텍스트 간입니다.텍스트가 들어갈 공간입니다.텍스트간입니다.텍스트가 들어갈 공간입니다.텍스트'
                                        텍스트가 들어갈 공간입니다.텍스트가 들어갈 공간입니다.텍스트가 들어갈 공간입니다.텍스트 간입니다.텍스트가 들어갈 공간입니다.텍스트간입니다.텍스트가 들어갈 공간입니다.텍스트</li>
                                        <li class="l3">김*아 &nbsp;&nbsp;&nbsp; 2023-08-17</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="div_btn2">
                                <a href="${pageContext.request.contextPath}/diy/diy_list" ><button>더보기</button></a>
                            </div>
                        </div>
                    </div>
                </div><!-- py-10 -->
            </div><!-- /container -->
        </div><!-- /diy_content -->
    </section>
    
    <script>
	function Login() {
		 if (confirm("로그인 후 이용 가능합니다. 로그인하시겠습니까?")) {
		    	
		        window.location.href = "${pageContext.request.contextPath}/user/login"; 
		    } else {
		        
		    }
	}
	</script>
</body>
</html>