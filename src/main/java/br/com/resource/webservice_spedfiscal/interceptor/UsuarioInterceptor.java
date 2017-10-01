package br.com.resource.webservice_spedfiscal.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.com.resource.webservice_spedfiscal.beans.Usuario;

@Component
public class UsuarioInterceptor extends HandlerInterceptorAdapter {

	protected static final String INDEX_PATH = "/SpedFiscal/";
	protected static final String REGISTRA_USUARIO_PATH = "registraUsuario";
	protected static final String INSERE_USUARIO_PATH = "insereUsuario";
	protected static final String VERIFICA_ACESSO_PATH = "verificaAcesso";
	protected static final String LOGOFF_PATH = "fazerLogoff";
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
 	
		System.out.println("UsuarioInterceptor: REQUEST Intercepted for URI: " + request.getRequestURI());
		 
        if(request.getSession().getAttribute("usuario") == null) {
        	response.sendRedirect(request.getContextPath() + "/expirada");  
            return false;
        }

		return true;
	}
	
	
}
