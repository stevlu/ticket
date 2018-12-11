package com.stevlu.config;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Steven Lu on 2018/11/21.
 */
@Component
public class AuthenticationAccessDeniedHandler implements AccessDeniedHandler {
	@Override
	public void handle(HttpServletRequest httpServletRequest, HttpServletResponse resp, AccessDeniedException e)
			throws IOException, ServletException {
		resp.setStatus(HttpServletResponse.SC_FORBIDDEN);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.write("{\"status\":\"error\",\"msg\":\"权限不足，请联系管理员!\"}");
		out.flush();
		out.close();
	}
}
