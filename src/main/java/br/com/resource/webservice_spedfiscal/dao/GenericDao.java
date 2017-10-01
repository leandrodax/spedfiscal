package br.com.resource.webservice_spedfiscal.dao;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import br.com.resource.webservice_spedfiscal.beans.Usuario;

public class GenericDao {
	public Usuario getUsuarioLogado(){
		ServletRequestAttributes request = (ServletRequestAttributes) RequestContextHolder
            .currentRequestAttributes();
		HttpSession session = request.getRequest().getSession();
		return (Usuario)session.getAttribute("usuario");
	}
}
