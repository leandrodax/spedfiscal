package br.com.resource.webservice_spedfiscal.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.resource.webservice_spedfiscal.beans.Produtor;
import br.com.resource.webservice_spedfiscal.dao.ProdutorDao;

@Service
public class ProdutorServiceImpl implements ProdutorService{
	@Autowired
	ProdutorDao produtorDao;

	public void insereProdutor(Produtor produtor) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		produtorDao.insereProdutor(produtor);
	}

	public Produtor buscarProdutorPorId(int id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return produtorDao.buscarProdutorPorId(id); 
	}

	public Produtor buscaProdutorPorNome() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Produtor> listarProdutores() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return produtorDao.ListarProdutores();
	}

	public Produtor buscarAssProdutor(Integer idProduto) throws Exception {
		// TODO Auto-generated method stub
		return produtorDao.buscarAssProdutor(idProduto);
	}
	 
	 

}
