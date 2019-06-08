package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("login")==null) {
			saveUri(request);
			response.sendRedirect("../user/login");
			return false;
		}
		return true;
	}

	private void saveUri(HttpServletRequest request) {
		String uri=request.getRequestURI();		
		String query=request.getQueryString();
		
		if(query==null || query.equals("null")) {
			query="";
		}else {
			query="?"+query;
		}
		if(request.getMethod().equals("GET")) {
			request.getSession().setAttribute("dest", uri+query);
		}
	}

}
