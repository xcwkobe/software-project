package interceptor;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import pojo.User;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
        String contextPath=session.getServletContext().getContextPath();
        String[] noNeedAuthPage ={"/loginPage","/warningPage",
        		"/adminLogin","/warning","/admin","/registerPage","/register","/checkAccount"};
 
        String uri = request.getRequestURI();
        uri = StringUtils.remove(uri, contextPath);
        System.out.println(uri);
        
        if(!Arrays.asList(noNeedAuthPage).contains(uri)){
            User user =(User) session.getAttribute("user");
            if(null==user){
                response.sendRedirect("warning");
                return false;
            }
        }
        return true;
	}
	
}
