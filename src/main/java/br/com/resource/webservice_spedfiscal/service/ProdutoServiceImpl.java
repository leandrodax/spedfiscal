package br.com.resource.webservice_spedfiscal.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.resource.webservice_spedfiscal.beans.Produto;
import br.com.resource.webservice_spedfiscal.beans.Produtor;
import br.com.resource.webservice_spedfiscal.dao.ProdutoDao;

@Service
public class ProdutoServiceImpl implements ProdutoService{
	@Autowired
	ProdutoDao produtoDao;
	
	@Autowired
	ProdutorService produtorService;
	 
	public void insereProduto(Produto produto) throws Exception{ 
		produtoDao.insereProduto(produto);		
		produto.setId(produtoDao.buscarIdProdutoUltimo());		
		produtoDao.insereAssProduto(produto);
	}

	public Produto buscarProdutoPorCodigo(String codigo) throws Exception { 
		Produto produto = new Produto(); 
		produto = produtoDao.buscarProdutoPorCodigo(codigo);
		produto.setProdutor(produtorService.buscarAssProdutor(produto.getId())); 
		return produto; 
	} 
	
	public Produto buscarProdutoPorId(int id) throws Exception { 
		Produto produto = new Produto();
		produto = produtoDao.buscarProdutoPorId(id);
		produto.setProdutor(produtorService.buscarAssProdutor(produto.getId())); 
		return produto;
	}
 
	public List<Produto> ListarProdutos() throws Exception {  
		List<Produto> produtos = new ArrayList<Produto>(); 
		for(Produto produto : produtoDao.ListarProdutos()){
			produto.setProdutor(produtorService.buscarAssProdutor(produto.getId()));
			
			produto.setDataProducaoFormatada(produto.getDataProducao());
			
			if(!("").equals(produto.getDataSaidaEstoque())){
				produto.setDataSaidaEstoqueFormatada(produto.getDataSaidaEstoque());
			}
			produtos.add(produto);
		}
		return produtos;
	}
 
	public void deletarProduto(int id) throws Exception{ 
		produtoDao.deletarAssProduto(id);
		produtoDao.deletarProduto(id);
	}
	 
}
