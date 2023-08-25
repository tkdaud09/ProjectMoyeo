package com.moyeo.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.moyeo.dto.Userinfo;
import com.moyeo.exception.BadRequestException;



//Intercepter 클래스

//관리자 권한 관련 처리를 위해 작성된 인터셉터 클래스
// => 요청 처리 메소드 호출 전에 비로그인 사용자이거나 관리자가 아닌 사용자가 페이지를 요청한 
//경우 인위적으로 예외 발생
public class AdminAuthInterceptor implements HandlerInterceptor {
	
	//요청 처리 메소드가 호출되기 전에 실행될 명령을 작성하기 위한 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		
		Userinfo loginUserinfo=(Userinfo)session.getAttribute("loginUserinfo");
		
		//비로그인 사용자이거나 관리자가 아닌 사용자인 경우
		if(loginUserinfo == null || loginUserinfo.getStatus() != 9) {
			//1)
			//response.sendError(HttpServletResponse.SC_FORBIDDEN);//403 에러코드 전달
			//return false;//요청 처리 메소드 미호출
			
			//2)
			//request.getRequestDispatcher("usrinfo/user_error.jsp").forward(request, response);
			//return false;//요청 처리 메소드 미호출
			
			//3) ExceptionHandler 사용
			throw new BadRequestException("비정상적인 요청입니다.");
		}
		return true;//요청 처리 메소드 호출
	}
	
	//요청 처리 메소드가 호출되어 뷰(View)가 생성되기 전에 실행될 명령을 작성하기 위한 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	
	//요청 처리 메소드가 호출되어 뷰가 생성된 후에 실행될 명령을 작성하는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}
