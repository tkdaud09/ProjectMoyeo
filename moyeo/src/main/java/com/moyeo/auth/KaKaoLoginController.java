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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.moyeo.dto.UserinfoSecurity;
import com.moyeo.dto.UserinfoSecurityAuth;
import com.moyeo.security.KakaoLoginBean;
import com.moyeo.service.UserinfoSecurityService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/kakao")
@RequiredArgsConstructor
public class KaKaoLoginController {
	private final KakaoLoginBean kakaoLoginBean;
	private final UserinfoSecurityService userinfoSecurityService;
	
	//移댁뭅�삤 濡쒓렇�씤 �럹�씠吏�瑜� �슂泥��븯湲� �쐞�븳 �슂泥� 泥섎━ 硫붿냼�뱶
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
		
		//JSONParser 媛앹껜 : JSON �삎�떇�쓽 臾몄옄�뿴�쓣 JSON 媛앹껜濡� 蹂��솚�븯�뒗 湲곕뒫�쓣 �젣怨듯븯�뒗 媛앹껜
		JSONParser parser=new JSONParser();
		//JSONParser.parse(String json) : JSON �삎�떇�쓽 臾몄옄�뿴�쓣 Object 媛앹껜濡� 蹂��솚�븯�뒗 硫붿냼�뱶
		Object object=parser.parse(apiResult);
		//Object 媛앹껜濡� JSONObject 媛앹껜濡� 蹂��솚�븯�뿬 ���옣
		JSONObject jsonObject=(JSONObject)object;
		
		//JSON 媛앹껜�뿉 ���옣�맂 媛믪쓣 �젣怨듬컺�븘 ���옣 - �뙆�떛(Parsing)
		//JSONObject.get(String name) : JSONObject 媛앹껜�뿉 ���옣�맂 媛�(媛앹껜)�쓣 諛섑솚�븯�뒗 硫붿냼�뱶
		// => Object ���엯�쑝濡� 媛�(媛앹껜)瑜� 諛섑솚�븯誘�濡� 諛섎뱶�떆 �삎蹂��솚�븯�뿬 ���옣
		// String id=(String)jsonObject.get("id");
		String id=Long.toString((long) jsonObject.get("id"));
		String name=(String)jsonObject.get("name");
		String email=(String)jsonObject.get("email");
		
		//諛섑솚諛쏆� 移댁뭅�삤 �궗�슜�옄 �봽濡쒗븘�쓽 媛믪쓣 �궗�슜�븯�뿬 Java 媛앹껜�쓽 �븘�뱶媛믪쑝濡� ���옣
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
		
		
		//移댁뭅�삤 濡쒓렇�씤 �궗�슜�옄�쓽 �젙蹂대�� userinfo_security �뀒�씠釉붽낵 userinfo_security_auth �뀒�씠釉붿뿉 ���옣
		// �꽕�씠踰� 濡쒓렇�씤 �궗�슜�옄�쓽 �젙蹂대�� SECURITY_USERS �뀒�씠釉붽낵 SECURITY_AUTH �뀒�씠釉붿뿉 ���옣
		userinfoSecurityService.addUserinfoSecurity(userinfo);
		userinfoSecurityService.addUserinfoSecurityAuth(auth);
	    
		/*
		//移댁뭅�삤 濡쒓렇�씤 �궗�슜�옄 �젙蹂대�� �궗�슜�븯�뿬 UserDetails 媛앹껜(濡쒓렇�씤 �궗�슜�옄)瑜� �깮�꽦�븯�뿬 ���옣
		CustomUserDetails customUserDetails=new CustomUserDetails(userinfo);
		
		//UsernamePasswordAuthenticationToken 媛앹껜瑜� �깮�꽦�븯�뿬 Spring Security媛� �궗�슜 媛��뒫�븳 �씤利� �궗�슜�옄濡� �벑濡� 泥섎━
		//UsernamePasswordAuthenticationToken 媛앹껜 : �씤利� �꽦怨듯븳 �궗�슜�옄瑜� Spring Security媛� �궗�슜 媛��뒫�븳 �씤利� �궗�슜�옄濡� �벑濡� 泥섎━�븯�뒗 媛앹껜
		Authentication authentication=new UsernamePasswordAuthenticationToken
				(customUserDetails, null, customUserDetails.getAuthorities());
		
		//SecurityContextHolder 媛앹껜 : �씤利� �궗�슜�옄�쓽 沅뚰븳 愿��젴 �젙蹂대�� ���옣�븯湲� �쐞�븳 媛앹껜
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		System.out.println("name : "+userinfo.getName());
		*/
		
		return "redirect:/";
	}
	
	/*
	//移댁뭅�삤 濡쒓렇�씤 �꽦怨듭떆 Callback URL �럹�씠吏�瑜� 泥섎━�븯湲� �쐞�븳 �슂泥� 泥섎━ 硫붿냼�뱶
	@RequestMapping("/callback")
	public String login(@RequestParam String code, @RequestParam String state
			, HttpSession session) throws IOException, ParseException {
		OAuth2AccessToken accessToken=kakaoLoginBean.getAccessToken(session, code, state);
		
		String apiResult=kakaoLoginBean.getUserProfile(accessToken);
		System.out.println(apiResult);
		
		//JSONParser 媛앹껜 : JSON �삎�떇�쓽 臾몄옄�뿴�쓣 JSON 媛앹껜濡� 蹂��솚�븯�뒗 湲곕뒫�쓣 �젣怨듯븯�뒗 媛앹껜
		JSONParser parser=new JSONParser();
		//JSONParser.parse(String json) : JSON �삎�떇�쓽 臾몄옄�뿴�쓣 Object 媛앹껜濡� 蹂��솚�븯�뒗 硫붿냼�뱶
		Object object=parser.parse(apiResult);
		//Object 媛앹껜濡� JSONObject 媛앹껜濡� 蹂��솚�븯�뿬 ���옣
		JSONObject jsonObject=(JSONObject)object;
		
		//JSON 媛앹껜�뿉 ���옣�맂 媛믪쓣 �젣怨듬컺�븘 ���옣 - �뙆�떛(Parsing)
		//JSONObject.get(String name) : JSONObject 媛앹껜�뿉 ���옣�맂 媛�(媛앹껜)�쓣 諛섑솚�븯�뒗 硫붿냼�뱶
		// => Object ���엯�쑝濡� 媛�(媛앹껜)瑜� 諛섑솚�븯誘�濡� 諛섎뱶�떆 �삎蹂��솚�븯�뿬 ���옣
		JSONObject responseObject=(JSONObject)jsonObject.get("response");
		String id=(String)responseObject.get("id");
		String name=(String)responseObject.get("name");
		String email=(String)responseObject.get("email");
		
		//諛섑솚諛쏆� 移댁뭅�삤 �궗�슜�옄 �봽濡쒗븘�쓽 媛믪쓣 �궗�슜�븯�뿬 Java 媛앹껜�쓽 �븘�뱶媛믪쑝濡� ���옣
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
		
		//移댁뭅�삤 濡쒓렇�씤 �궗�슜�옄�쓽 �젙蹂대�� userinfo_security �뀒�씠釉붽낵 userinfo_security_auth �뀒�씠釉붿뿉 ���옣
		if(userinfoSecurityService.getUserinfoSecurity("kakao_"+id) == null) {
			userinfoSecurityService.addUserinfoSecurity(userinfo);
			userinfoSecurityService.addUserinfoSecurityAuth(auth);
		}
	    
		//移댁뭅�삤 濡쒓렇�씤 �궗�슜�옄 �젙蹂대�� �궗�슜�븯�뿬 UserDetails 媛앹껜(濡쒓렇�씤 �궗�슜�옄)瑜� �깮�꽦�븯�뿬 ���옣
		CustomUserDetails customUserDetails=new CustomUserDetails(userinfo);
		
		//UsernamePasswordAuthenticationToken 媛앹껜瑜� �깮�꽦�븯�뿬 Spring Security媛� �궗�슜 媛��뒫�븳 �씤利� �궗�슜�옄濡� �벑濡� 泥섎━
		//UsernamePasswordAuthenticationToken 媛앹껜 : �씤利� �꽦怨듯븳 �궗�슜�옄瑜� Spring Security媛� �궗�슜 媛��뒫�븳 �씤利� �궗�슜�옄濡� �벑濡� 泥섎━�븯�뒗 媛앹껜
		Authentication authentication=new UsernamePasswordAuthenticationToken
				(customUserDetails, null, customUserDetails.getAuthorities());
		
		//SecurityContextHolder 媛앹껜 : �씤利� �궗�슜�옄�쓽 沅뚰븳 愿��젴 �젙蹂대�� ���옣�븯湲� �쐞�븳 媛앹껜
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		System.out.println("name : "+userinfo.getName());
		
		return "redirect:/";
	}
	*/
}
