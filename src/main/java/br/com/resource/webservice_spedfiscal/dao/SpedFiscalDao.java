package br.com.resource.webservice_spedfiscal.dao;

import java.sql.SQLException;
import java.util.List;

import br.com.resource.webservice_spedfiscal.beans.Produto;
import br.com.resource.webservice_spedfiscal.beans.SpedFiscal;

public interface SpedFiscalDao { 
	
	List<Produto> listarProdutosAssProcesso(int idProcesso) throws Exception;
	List<SpedFiscal> listarProcessos(String tipoProcesso) throws Exception;
	int listarUltimoProcesso() throws Exception;
	void insereProcesso(SpedFiscal spedFiscal) throws Exception;
	void insereAssSpedProduto(int idSped, Integer idProduto) throws ClassNotFoundException, SQLException;;
}
