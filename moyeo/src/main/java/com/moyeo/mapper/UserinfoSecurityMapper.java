package com.moyeo.mapper;

import com.moyeo.dto.SecurityAuth;
import com.moyeo.dto.Userinfo;

public interface UserinfoSecurityMapper {
	int insertUserinfoSecurity(Userinfo userinfo);
	int insertSecurityAuth(SecurityAuth auth);
	Userinfo selectUserinfoSecurityByUserid(String id);
}
