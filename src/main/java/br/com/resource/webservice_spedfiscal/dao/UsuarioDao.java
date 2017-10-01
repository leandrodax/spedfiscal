package br.com.resource.webservice_spedfiscal.dao;

import java.sql.SQLException;

import br.com.resource.webservice_spedfiscal.beans.Usuario;

public interface UsuarioDao {

	void insereUsuario(Usuario usuario) throws SQLException, ClassNotFoundException;

	Usuario validaUsuario(Usuario usuario) throws ClassNotFoundException, SQLException;

	Usuario buscarUsuarioPorCnpj(String cnpj) throws ClassNotFoundException, SQLException;

}