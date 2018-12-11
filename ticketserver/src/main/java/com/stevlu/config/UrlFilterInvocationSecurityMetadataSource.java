package com.stevlu.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import com.stevlu.bean.Menu;
import com.stevlu.bean.Role;
import com.stevlu.service.MenuService;

import java.util.Collection;
import java.util.List;

/**
 * Created by Steven Lu on 2018/11/21.
 */
@Component
public class UrlFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
	@Autowired
	MenuService menuService;
	AntPathMatcher antPathMatcher = new AntPathMatcher();

	@Override
	public Collection<ConfigAttribute> getAttributes(Object o) throws IllegalArgumentException {
		return SecurityConfig.createList("ROLE_LOGIN");
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

	@Override
	public boolean supports(Class<?> aClass) {
		return FilterInvocation.class.isAssignableFrom(aClass);
	}
}
