package com.moyeo.service;

import org.springframework.stereotype.Service;

import com.moyeo.dto.UserinfoSecurity;
import com.moyeo.dto.UserinfoSecurityAuth;
import com.moyeo.repository.UserinfoSecurityRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserinfoSecurityServiceImpl implements UserinfoSecurityService{
	private final UserinfoSecurityRepository userinfoSecurityRepository;
	
	@Override
	public void addUserinfoSecurity(UserinfoSecurity userinfo) {
		userinfoSecurityRepository.insertUserinfoSecurity(userinfo);
	}

	@Override
	public void addUserinfoSecurityAuth(UserinfoSecurityAuth auth) {
		userinfoSecurityRepository.insertUserinfoSecurityAuth(auth);
	}

	@Override
	public UserinfoSecurity getUserinfoSecurity(String id) {
		// TODO Auto-generated method stub
		return userinfoSecurityRepository.selectUserinfoSecurityByUserid(id);
	}

}
