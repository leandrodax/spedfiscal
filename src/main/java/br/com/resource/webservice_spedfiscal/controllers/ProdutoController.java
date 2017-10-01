package br.com.resource.webservice_spedfiscal.controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.resource.webservice_spedfiscal.beans.Produto;
import br.com.resource.webservice_spedfiscal.service.ProdutoService;
import br.com.resource.webservice_spedfiscal.service.ProdutorService;

@Controller
public class ProdutoController {

	@Autowired
	ProdutoService produtoService;
	
	@Autowired
	ProdutorService produtorService;

	@RequestMapping(value="/protected/produto/listar", method=RequestMethod.GET)
	public String listaProduto(Model model){
		try {
			model.addAttribute("produtos",produtoService.ListarProdutos());
		} catch (Exception e) {
			model.addAttribute("msgErro","Erro ao listar produtos");
			e.printStackTrace();
		}  
		return "produtos/listarProdutos";	 
	} 

	@RequestMapping(value="/protected/produto/adicionar", method=RequestMethod.GET)
	public String adicionaProduto(Model model){

		try {
			model.addAttribute("produtores",produtorService.listarProdutores());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return "produtos/adicionarProduto";
	} 
	
	@RequestMapping(value="/protected/produto/inserir", method=RequestMethod.POST)
	public String adicionarProduto(Produto produto, Model model){
		try {
			model.addAttribute("produtores",produtorService.listarProdutores());
			produtoService.insereProduto(produto);
			model.addAttribute("msgSuccess","Produto inserido com sucesso.");
		} catch (Exception e) {
			model.addAttribute("msgErro","Erro ao inserir produto");
			e.printStackTrace();
		}  
		return "produtos/adicionarProduto";
	}  

	@RequestMapping(value="/protected/produto/altera", method=RequestMethod.GET)
	public String alteraProduto(@RequestParam("id") int id, Model model){
		
		try {
			//model.addAttribute("produto",produtoService.buscarProdutoPorId(id));
		} catch (Exception e) {
			model.addAttribute("msgErro","Erro ao encontrar o produto.");
			e.printStackTrace();
		}
		return "produtos/listarProdutos";
	} 

	@RequestMapping(value="/protected/produto/alterar", method=RequestMethod.GET)
	public String alteraProdutor(Produto produto, Model model){
		
		try {
			//produtoService.alteraProduto(produto);
		} catch (Exception e) {
			model.addAttribute("msgErro","Erro ao encontrar o produto.");
			e.printStackTrace();
		}
		return "redirect:/protected/produto/listar";
	} 
	
	@RequestMapping(value="/protected/produto/deletar", method=RequestMethod.GET)
	public String deletarProduto(@RequestParam("id") int id, Model model){
		try {
			produtoService.deletarProduto(id);
		} catch (Exception e) {
			model.addAttribute("msgErro","Erro ao deletar o produto.");
			e.printStackTrace();
		} 
		model.addAttribute("msgSuccess","Produto deletado com sucesso.");
		return "redirect:/protected/produto/listar";
	}  
}
