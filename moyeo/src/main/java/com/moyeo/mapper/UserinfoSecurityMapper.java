package com.moyeo.mapper;

import com.moyeo.dto.UserinfoSecurity;
import com.moyeo.dto.UserinfoSecurityAuth;

public interface UserinfoSecurityMapper {
	int insertUserinfoSecurity(UserinfoSecurity userinfo);
	int insertUserinfoSecurityAuth(UserinfoSecurityAuth auth);
	UserinfoSecurity selectUserinfoSecurityByUserid(String id);
}
