package br.com.resource.webservice_spedfiscal.service;

import java.sql.SQLException;
import java.util.List;

import br.com.resource.webservice_spedfiscal.beans.Produto;
import br.com.resource.webservice_spedfiscal.beans.Usuario;

public interface ProdutoService {

	void insereProduto(Produto produto) throws Exception;

	Produto buscarProdutoPorCodigo(String codigo) throws Exception;

	List<Produto> ListarProdutos() throws Exception;

	Produto buscarProdutoPorId(int id) throws Exception;

	void deletarProduto(int id) throws Exception; 
	
}
