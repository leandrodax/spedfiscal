package br.com.resource.webservice_spedfiscal.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.resource.webservice_spedfiscal.beans.Usuario;
import br.com.resource.webservice_spedfiscal.dao.UsuarioDao;

@Service
public class UsuarioServiceImpl implements UsuarioService{
	@Autowired
	UsuarioDao usuarioDao;
	
	public void insereUsuario(Usuario usuario) throws ClassNotFoundException, SQLException{
		usuarioDao.insereUsuario(usuario);
	}

	public boolean alteraUsuario(Usuario usuario) {
		// TODO Auto-generated method stub
		return false;
	}

	public Usuario buscaUsuarioPorId(Usuario usuario) {
		// TODO Auto-generated method stub
		return null;
	}

	public Usuario validaUsuario(Usuario usuario) throws ClassNotFoundException, SQLException  { 
		Usuario userLogado = null; 
		userLogado = usuarioDao.validaUsuario(usuario);	 
		return userLogado;
	}

	public Usuario buscaUsuarioPorNome(Usuario usuario) {
		// TODO Auto-generated method stub
		return null;
	}

}
