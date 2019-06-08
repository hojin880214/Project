package com.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN="login";
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		if(session.getAttribute(LOGIN) != null){
			session.removeAttribute(LOGIN);
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session=request.getSession();
		ModelMap modelMap=modelAndView.getModelMap();
		Object uvo=modelMap.get("uvo");
		
		if(uvo != null) {
			session.setAttribute(LOGIN, uvo);
			//response.sendRedirect("/");
			Object dest=session.getAttribute("dest");
			response.sendRedirect((dest!=null) ? (String)dest : "/Project");
			
		}
	}	
}
