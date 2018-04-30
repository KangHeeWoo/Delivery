package com.jhta.delivery.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest requ = (HttpServletRequest)req;
		
		String[] getUrl = requ.getRequestURL().toString().split("/delivery");
		String requestMapping = getUrl[1];

		if(requestMapping != null) {
			boolean checkLogin = false;
			
			if(requestMapping.startsWith("/menu/cart")) checkLogin = true;
			if(requestMapping.startsWith("/mypage")) checkLogin = true;			
			//원하는 RequestMapping 경로 추가
			
			if(checkLogin) {
				loginCheck(req, resp, chain);
			}else {
				chain.doFilter(req, resp);
			}
		}else {
			chain.doFilter(req, resp);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

	private void loginCheck (ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		boolean login = false;

		HttpServletRequest request = (HttpServletRequest) req;
		HttpSession session = request.getSession();

		if (session != null) {
			if (session.getAttribute("email") != null) {
				login = true;
			}
		}

		if (login) {
			chain.doFilter(req, resp);
		} else {
			HttpServletResponse response = (HttpServletResponse) resp;
			response.sendRedirect(request.getContextPath() + "/?loginCheck=loginCheck");
		}
	}
}
