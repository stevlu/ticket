package com.stevlu.common;

import org.springframework.security.core.context.SecurityContextHolder;

import com.stevlu.bean.Hr;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public class HrUtils {
	public static Hr getCurrentHr() {
		return (Hr) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
}
