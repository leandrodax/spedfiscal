package br.com.resource.webservice_spedfiscal.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class EmpresaController {
	 
	
	@RequestMapping(value="/adicionarEmpresa", method=RequestMethod.GET)
	public String registraUsuario(Model model){
		
		//empresaServiceImpl.insereEmpresa(empresa);
		return "empresas/adicionarEmpresa";	 
	}
}
