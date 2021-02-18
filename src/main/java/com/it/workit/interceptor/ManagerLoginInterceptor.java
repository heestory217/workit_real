package com.it.workit.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ManagerLoginInterceptor extends HandlerInterceptorAdapter {
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("managerId");
          
        if ( obj == null ){
        	response.setContentType("text/html;charset=utf-8");
        	PrintWriter out = response.getWriter();
        	out.print("<script>");
			out.print("alert('관리자 로그인 후 이용가능한 서비스입니다.');");
			out.print("location.href='"+request.getContextPath()+"/managers/login.do';");
			out.print("</script>");
            return false;
        }
        return true;
    }
  
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}
