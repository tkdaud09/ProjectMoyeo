package com.moyeo.repository;

import com.moyeo.dto.UserinfoSecurity;
import com.moyeo.dto.UserinfoSecurityAuth;

public interface UserinfoSecurityRepository {
	int insertUserinfoSecurity(UserinfoSecurity userinfo);
	int insertUserinfoSecurityAuth(UserinfoSecurityAuth auth);
	UserinfoSecurity selectUserinfoSecurityByUserid(String id);
}
