package com.moyeo.dto;

import org.springframework.lang.Nullable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserinfoSecurityAuth {
	@Nullable
	private String id;
	@Nullable
	private String auth;

}
