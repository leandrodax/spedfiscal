package br.com.resource.webservice_spedfiscal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.com.resource.webservice_spedfiscal.beans.Usuario;

@Component
public class FreeSecurityInterceptor extends HandlerInterceptorAdapter {

	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("FreeSecurityInterceptor: REQUEST Intercepted for URI: "
				+ request.getRequestURI());
		if(!("SpedFiscal/verificaAcesso").equals(request.getRequestURI())){
        	response.sendRedirect(request.getContextPath() + "/expirada");  
			return false;
		}
		return true;
	}
}
