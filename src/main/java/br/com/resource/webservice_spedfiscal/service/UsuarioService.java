package br.com.resource.webservice_spedfiscal.service;

import java.sql.SQLException;

import br.com.resource.webservice_spedfiscal.beans.Usuario;

public interface UsuarioService {

	void insereUsuario(Usuario usuario) throws ClassNotFoundException, SQLException;
	boolean alteraUsuario(Usuario usuario);
	Usuario buscaUsuarioPorId(Usuario usuario);
	Usuario validaUsuario(Usuario usuario) throws ClassNotFoundException, SQLException;
	Usuario buscaUsuarioPorNome(Usuario usuario);
	
}
