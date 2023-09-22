package com.moyeo.service;

import com.moyeo.dto.UserinfoSecurity;
import com.moyeo.dto.UserinfoSecurityAuth;

public interface UserinfoSecurityService {
	void addUserinfoSecurity(UserinfoSecurity userinfo);
	void addUserinfoSecurityAuth(UserinfoSecurityAuth auth);
	UserinfoSecurity getUserinfoSecurity(String id);

}
