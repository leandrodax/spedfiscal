package br.com.resource.webservice_spedfiscal.controllers;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.resource.webservice_spedfiscal.beans.Usuario;
import br.com.resource.webservice_spedfiscal.service.UsuarioService;
@Controller
public class UsuarioController{
	
	
	
	@Autowired
	UsuarioService usuarioService;

	@RequestMapping(value="/registraUsuario", method=RequestMethod.GET)
	public String registraUsuario(Model model){
		return "registraUsuario";	 
	}
	
	@RequestMapping(value="/insereUsuario", method=RequestMethod.POST)
	public String insereUsuario(Usuario usuario, Model model){
		try {
			usuarioService.insereUsuario(usuario);
		} catch (ClassNotFoundException e) {
			model.addAttribute("msgError",e);
			return "index";	
		} catch (SQLException e) {
			model.addAttribute("msgError",e);
			return "index";	
		} 

		model.addAttribute("msgSuccess","Cadastro realizado com sucesso!");
		return "index";	 
	}

	
	@RequestMapping(value="/protected/usuario/gerenciamentoUsuario")
	public String gerenciarUser(){
		
		return "usuario/gerenciamentoUsuario";	 
	}

}
