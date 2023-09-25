package com.moyeo.repository;

import com.moyeo.dto.SecurityAuth;
import com.moyeo.dto.Userinfo;

public interface UserinfoSecurityRepository {
	int insertUserinfoSecurity(Userinfo userinfo);
	int insertSecurityAuth(SecurityAuth auth);
	Userinfo selectUserinfoSecurityByUserid(String id);
}
