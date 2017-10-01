package br.com.resource.webservice_spedfiscal.dao;

import java.sql.SQLException;
import java.util.List;

import br.com.resource.webservice_spedfiscal.beans.Produto;
import br.com.resource.webservice_spedfiscal.beans.Produtor;

public interface ProdutorDao {

	void insereProdutor(Produtor produtor) throws SQLException, ClassNotFoundException; 

	Produtor buscarProdutorPorId(int id) throws ClassNotFoundException, SQLException;
	
	List<Produtor> ListarProdutores() throws ClassNotFoundException, SQLException;

	Produtor buscarAssProdutor(Integer idProduto) throws Exception;

}