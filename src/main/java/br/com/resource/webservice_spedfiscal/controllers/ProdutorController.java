package br.com.resource.webservice_spedfiscal.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.resource.webservice_spedfiscal.beans.Produtor;
import br.com.resource.webservice_spedfiscal.service.ProdutorService;

@Controller
public class ProdutorController {

	@Autowired
	ProdutorService produtorService;
	
	@RequestMapping(value="/protected/produtor/listar", method=RequestMethod.GET)
	public String listaProdutores(Model model){
		try {
			model.addAttribute("produtor",produtorService.listarProdutores()); 
		} catch (Exception e) {
			model.addAttribute("msgErro",e.getMessage());
			e.printStackTrace();
		}  
		return "produtores/listarProdutores";	 
	} 

	@RequestMapping(value="/protected/produtor/adicionar", method=RequestMethod.GET)
	public String adicionarProdutores(Model model){

		return "produtores/adicionarProdutor";
	} 
	
	@RequestMapping(value="/protected/produtor/insere", method=RequestMethod.POST)
	public String insereProdutores(Produtor produtor, Model model){
		try {
			produtorService.insereProdutor(produtor);
			model.addAttribute("msgSuccess","Produtor inserido com sucesso.");
		} catch (Exception e) {
			model.addAttribute("msgErro",e.getMessage());
			e.printStackTrace();
		}  
		return "produtores/adicionarProdutor";
	} 

	@RequestMapping(value="/protected/produtor/alterar", method=RequestMethod.GET)
	public String alterarProdutor(@RequestParam("id") int id, Model model){

		return "produtores/listarProdutores";
	} 
	@RequestMapping(value="/protected/produtor/deletar", method=RequestMethod.GET)
	public String deletarProdutor(@RequestParam("id") int id, Model model){

		return "produtores/listarProdutor";
	} 
}
