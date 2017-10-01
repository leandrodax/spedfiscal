package br.com.resource.webservice_spedfiscal.controllers;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.resource.webservice_spedfiscal.beans.Usuario;
import br.com.resource.webservice_spedfiscal.service.UsuarioService;
import br.com.resource.webservice_spedfiscal.vo.UserVO;

@Controller
public class AcessoController {
	
	@Autowired
	UsuarioService usuarioService;
 
	@RequestMapping(value="/", method=RequestMethod.GET)
    public String index() {
        return "index";
    }
	
	@RequestMapping(value="/expirada", method=RequestMethod.GET)
    public String expirada(Model model) {
		model.addAttribute("msgErro","Sua sessão foi expirada ou foi "
        			+ "efetuada uma requisição sem ter realizado o login.");
        return "index";
    }
	
	@RequestMapping(value="/usuario/fazerLogoff")
	public String logoff(HttpSession session){
		session.invalidate();  
		return "index";
	}

	@RequestMapping(value="/verificaAcesso", method=RequestMethod.POST)
	public String verificaAcesso(Usuario usuario, HttpSession session, Model model){  
		Usuario usuarioLogado = new Usuario();
		try {
			usuarioLogado = usuarioService.validaUsuario(usuario);
			if(usuarioLogado != null){
				usuarioLogado.setRepresReduzido(usuarioLogado.getRepresentante().split(" ")[0]);
				session.setAttribute("usuario", usuarioLogado);  
				return "redirect:/protected/home";					
			}else{
				model.addAttribute("msgError", "Usuário ou senha incorreto!");
				return "index";
			}
		} catch (ClassNotFoundException e) {
			model.addAttribute("msgError","Ocorreu um erro inesperado. Entre em contato com a equipe desenvolvedora.");
			return "index";	
		} catch (SQLException e) {
			model.addAttribute("msgError","Ocorreu um erro de conexão. Por favor, tente mais tarde.");
			return "index";	
		} 
	}
	
	@RequestMapping(value="/protected/home", method=RequestMethod.GET)
	public String voltarHome(){ 
		return "protected/home";	 
	}
	
	public UserVO convertToUserVo(Usuario usuario){
		UserVO uservo = new UserVO();
		uservo.setId(usuario.getId());
		uservo.setRepresentante(usuario.getRepresentante());
		uservo.setEmail(usuario.getEmail());
		return uservo;
	}
}
