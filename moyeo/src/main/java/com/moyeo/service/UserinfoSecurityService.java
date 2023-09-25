package com.moyeo.service;

import com.moyeo.dto.SecurityAuth;
import com.moyeo.dto.Userinfo;


public interface UserinfoSecurityService {
	void addUserinfoSecurity(Userinfo userinfo);
	void addSecurityAuth(SecurityAuth auth);
	Userinfo getUserinfoSecurity(String id);

}
