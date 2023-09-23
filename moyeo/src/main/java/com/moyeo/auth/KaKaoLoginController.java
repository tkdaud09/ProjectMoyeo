package com.moyeo.auth;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.moyeo.dto.UserinfoSecurity;
import com.moyeo.dto.UserinfoSecurityAuth;
import com.moyeo.security.CustomUserDetails;
import com.moyeo.security.KakaoLoginBean;
import com.moyeo.service.UserinfoSecurityService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/kakao") 
@RequiredArgsConstructor
public class KaKaoLoginController {
	private final KakaoLoginBean kakaoLoginBean;
	private final UserinfoSecurityService userinfoSecurityService;
	
	//카카오 로그인 페이지를 요청하기 위한 요청 처리 메소드
	@RequestMapping("/login")
	public String login(HttpSession session) throws UnsupportedEncodingException {
		String kakaoAuthUrl=kakaoLoginBean.getAuthorizationUrl(session);
		return "redirect:"+kakaoAuthUrl;
	}
	
	@RequestMapping("/callback")
	public String login(@RequestParam(value = "code", required = false) String code, @RequestParam(value = "state", required = false) String state
			, HttpSession session) throws IOException, ParseException {
		OAuth2AccessToken accessToken=kakaoLoginBean.getAccessToken(session, code, state);
		
		String apiResult=kakaoLoginBean.getUserProfile(accessToken);
		System.out.println("apiResult : " +apiResult);
		
		//JSONParser 객체 : JSON 형식의 문자열을 JSON 객체로 변환하는 기능을 제공하는 객체
		JSONParser parser=new JSONParser();
		//JSONParser.parse(String json) : JSON 형식의 문자열을 Object 객체로 변환하는 메소드
		Object object=parser.parse(apiResult);
		//Object 객체로 JSONObject 객체로 변환하여 저장
		JSONObject jsonObject=(JSONObject)object;
		
		//JSON 객체에 저장된 값을 제공받아 저장 - 파싱(Parsing)
		//JSONObject.get(String name) : JSONObject 객체에 저장된 값(객체)을 반환하는 메소드
		// => Object 타입으로 값(객체)를 반환하므로 반드시 형변환하여 저장
		// String id=(String)jsonObject.get("id");
		String id=Long.toString((long) jsonObject.get("id"));
		String name=(String)jsonObject.get("name");
		String email=(String)jsonObject.get("email");
		
		//반환받은 카카오 사용자 프로필의 값을 사용하여 Java 객체의 필드값으로 저장
		UserinfoSecurityAuth auth=new UserinfoSecurityAuth();
		auth.setId("kakao_"+id);
		auth.setAuth("ROLE_USER");
		
		List<UserinfoSecurityAuth> authList=new ArrayList<UserinfoSecurityAuth>();
		authList.add(auth);
		
		UserinfoSecurity userinfo=new UserinfoSecurity();
		userinfo.setId("kakao_"+id);
		userinfo.setPw(UUID.randomUUID().toString());
		userinfo.setName(name);
		userinfo.setEmail(email);
		userinfo.setEnabled("1");
		userinfo.setUserinfoSecurityAuthList(authList);
		
		
		//카카오 로그인 사용자의 정보를 userinfo_security 테이블과 userinfo_security_auth 테이블에 저장
		// 네이버 로그인 사용자의 정보를 SECURITY_USERS 테이블과 SECURITY_AUTH 테이블에 저장
		userinfoSecurityService.addUserinfoSecurity(userinfo);
		userinfoSecurityService.addUserinfoSecurityAuth(auth);
	    
		/*
		//카카오 로그인 사용자 정보를 사용하여 UserDetails 객체(로그인 사용자)를 생성하여 저장
		CustomUserDetails customUserDetails=new CustomUserDetails(userinfo);
		
		//UsernamePasswordAuthenticationToken 객체를 생성하여 Spring Security가 사용 가능한 인증 사용자로 등록 처리
		//UsernamePasswordAuthenticationToken 객체 : 인증 성공한 사용자를 Spring Security가 사용 가능한 인증 사용자로 등록 처리하는 객체
		Authentication authentication=new UsernamePasswordAuthenticationToken
				(customUserDetails, null, customUserDetails.getAuthorities());
		
		//SecurityContextHolder 객체 : 인증 사용자의 권한 관련 정보를 저장하기 위한 객체
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		System.out.println("name : "+userinfo.getName());
		*/
		
		return "redirect:/";
	}
	
	/*
	//카카오 로그인 성공시 Callback URL 페이지를 처리하기 위한 요청 처리 메소드
	@RequestMapping("/callback")
	public String login(@RequestParam String code, @RequestParam String state
			, HttpSession session) throws IOException, ParseException {
		OAuth2AccessToken accessToken=kakaoLoginBean.getAccessToken(session, code, state);
		
		String apiResult=kakaoLoginBean.getUserProfile(accessToken);
		System.out.println(apiResult);
		
		//JSONParser 객체 : JSON 형식의 문자열을 JSON 객체로 변환하는 기능을 제공하는 객체
		JSONParser parser=new JSONParser();
		//JSONParser.parse(String json) : JSON 형식의 문자열을 Object 객체로 변환하는 메소드
		Object object=parser.parse(apiResult);
		//Object 객체로 JSONObject 객체로 변환하여 저장
		JSONObject jsonObject=(JSONObject)object;
		
		//JSON 객체에 저장된 값을 제공받아 저장 - 파싱(Parsing)
		//JSONObject.get(String name) : JSONObject 객체에 저장된 값(객체)을 반환하는 메소드
		// => Object 타입으로 값(객체)를 반환하므로 반드시 형변환하여 저장
		JSONObject responseObject=(JSONObject)jsonObject.get("response");
		String id=(String)responseObject.get("id");
		String name=(String)responseObject.get("name");
		String email=(String)responseObject.get("email");
		
		//반환받은 카카오 사용자 프로필의 값을 사용하여 Java 객체의 필드값으로 저장
		UserinfoSecurityAuth auth=new UserinfoSecurityAuth();
		auth.setId("kakao_"+id);
		auth.setAuth("ROLE_USER");
		
		List<UserinfoSecurityAuth> authList=new ArrayList<UserinfoSecurityAuth>();
		authList.add(auth);
		
		UserinfoSecurity userinfo=new UserinfoSecurity();
		userinfo.setId("kakao_"+id);
		userinfo.setPw(UUID.randomUUID().toString());
		userinfo.setName(name);
		userinfo.setEmail(email);
		userinfo.setEnabled("1");
		userinfo.setUserinfoSecurityAuthList(authList);
		
		//카카오 로그인 사용자의 정보를 userinfo_security 테이블과 userinfo_security_auth 테이블에 저장
		if(userinfoSecurityService.getUserinfoSecurity("kakao_"+id) == null) {
			userinfoSecurityService.addUserinfoSecurity(userinfo);
			userinfoSecurityService.addUserinfoSecurityAuth(auth);
		}
	    
		//카카오 로그인 사용자 정보를 사용하여 UserDetails 객체(로그인 사용자)를 생성하여 저장
		CustomUserDetails customUserDetails=new CustomUserDetails(userinfo);
		
		//UsernamePasswordAuthenticationToken 객체를 생성하여 Spring Security가 사용 가능한 인증 사용자로 등록 처리
		//UsernamePasswordAuthenticationToken 객체 : 인증 성공한 사용자를 Spring Security가 사용 가능한 인증 사용자로 등록 처리하는 객체
		Authentication authentication=new UsernamePasswordAuthenticationToken
				(customUserDetails, null, customUserDetails.getAuthorities());
		
		//SecurityContextHolder 객체 : 인증 사용자의 권한 관련 정보를 저장하기 위한 객체
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		System.out.println("name : "+userinfo.getName());
		
		return "redirect:/";
	}
	*/
}
