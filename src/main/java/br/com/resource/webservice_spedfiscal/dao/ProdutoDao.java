package br.com.resource.webservice_spedfiscal.dao;

import java.sql.SQLException;
import java.util.List;

import br.com.resource.webservice_spedfiscal.beans.Produto;

public interface ProdutoDao {

	void insereProduto(Produto produto) throws SQLException, ClassNotFoundException, Exception; 

	Produto buscarProdutoPorCodigo(String codigo) throws ClassNotFoundException, SQLException;
	
	List<Produto> ListarProdutos() throws ClassNotFoundException, SQLException;

	Produto buscarProdutoPorId(int id) throws ClassNotFoundException, SQLException;

	void deletarProduto(int id) throws Exception;

	void deletarAssProduto(int id) throws Exception;

	void insereAssProduto(Produto produto) throws Exception;

	Integer buscarIdProdutoUltimo() throws Exception;

}