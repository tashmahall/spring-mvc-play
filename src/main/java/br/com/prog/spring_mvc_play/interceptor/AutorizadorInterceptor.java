package br.com.prog.spring_mvc_play.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)	throws Exception {
		
		String uri = request.getRequestURI();
		if(uri.endsWith("loginForm") || uri.endsWith("efetuarLogin") || uri.contains("resources")) {
			return true;
		}
		
		if(request.getSession().getAttribute("usuarioLogado")!=null) {
			return true;
		} else {
			response.sendRedirect("/spring-mvc-play/loginForm");
			return false;
		}
		
	}
}
