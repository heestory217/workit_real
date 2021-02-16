package com.it.workit.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("userId");
          
        if ( obj == null ){
        	response.setContentType("text/html;charset=utf-8");
        	PrintWriter out = response.getWriter();
        	out.print("<script>");
			out.print("alert('로그인 후 이용가능한 서비스입니다.');");
			out.print("location.href='"+request.getContextPath()+"/users/login.do';");
			out.print("</script>");
            return false;
        }
        return true;
    }
  
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub
        super.postHandle(request, response, handler, modelAndView);
    }
}