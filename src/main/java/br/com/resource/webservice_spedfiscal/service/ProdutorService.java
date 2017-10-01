package br.com.resource.webservice_spedfiscal.service;

import java.sql.SQLException;
import java.util.List;

import br.com.resource.webservice_spedfiscal.beans.Produtor;

public interface ProdutorService {

	void insereProdutor(Produtor produtor) throws ClassNotFoundException, SQLException;

	Produtor buscarProdutorPorId(int id) throws ClassNotFoundException, SQLException;

	Produtor buscaProdutorPorNome() throws ClassNotFoundException, SQLException; 
	
	List<Produtor> listarProdutores() throws ClassNotFoundException, SQLException;

	Produtor buscarAssProdutor(Integer id) throws Exception; 
	
}
