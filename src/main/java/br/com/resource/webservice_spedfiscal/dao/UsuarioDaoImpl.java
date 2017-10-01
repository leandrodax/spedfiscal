
package br.com.resource.webservice_spedfiscal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import br.com.resource.webservice_spedfiscal.beans.Usuario;
import br.com.resource.webservice_spedfiscal.factory.ConnectionFactory;

@Repository
public class UsuarioDaoImpl implements UsuarioDao{

	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#insereUsuario(br.com.resource.webservice_spedfiscal.beans.Usuario)
	 */
	public void insereUsuario(Usuario usuario)throws SQLException, ClassNotFoundException{
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "INSERT INTO usuario(razao_social, fantasia,cnpj,"
				+ "logradouro,bairro,numero,cep,complemento,"
				+ "cidade,estado,representante,usuario,senha) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try{
			java.sql.PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, usuario.getRazaoSocial());
			stmt.setString(2, usuario.getFantasia());
			stmt.setString(3, usuario.getCnpj().replace(".", "").replace("/", "").replace("-", ""));
			stmt.setString(4, usuario.getLogradouro());
			stmt.setString(5, usuario.getBairro());
			stmt.setString(6, usuario.getNumero());
			stmt.setString(7, usuario.getCep().replace(".", "").replace("-", ""));
			stmt.setString(8, usuario.getComplemento());
			stmt.setString(9, usuario.getCidade());
			stmt.setString(10, usuario.getEstado());
			stmt.setString(11, usuario.getRepresentante());
			stmt.setString(12, usuario.getEmail());
			stmt.setString(13, usuario.getSenha());
			
			stmt.executeUpdate();
			stmt.close();
		}catch(Exception e){
			System.out.println(e);
		}finally{		
			conexao.close();
		}
		
	}

	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#validaUsuario(br.com.resource.webservice_spedfiscal.beans.Usuario)
	 */
	public Usuario validaUsuario(Usuario usuario) throws ClassNotFoundException, SQLException {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "SELECT * FROM usuario where usuario = ? and senha = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql);
		ps.setString(1, usuario.getEmail());
		ps.setString(2, usuario.getSenha());
		
		ResultSet rs = ps.executeQuery();

		Usuario retorno = null; 
		while (rs.next()) {
			retorno = new Usuario();
			retorno.setId(rs.getInt("id")); 
			retorno.setCnpj(rs.getString("cnpj")); 
			retorno.setRazaoSocial(rs.getString("razao_social")); 
			retorno.setFantasia(rs.getString("fantasia")); 
			retorno.setLogradouro(rs.getString("logradouro")); 
			retorno.setBairro(rs.getString("bairro")); 
			retorno.setNumero(rs.getString("numero")); 
			retorno.setComplemento(rs.getString("complemento")); 
			retorno.setCep(rs.getString("cep")); 
			retorno.setCidade(rs.getString("cidade")); 
			retorno.setEstado(rs.getString("estado")); 
			retorno.setRepresentante(rs.getString("representante")); 
			retorno.setEmail(rs.getString("usuario")); 
			retorno.setSenha(rs.getString("senha"));   
		}

		ps.close();
		conexao.close();
		
		
		return retorno == null ? null : retorno;
	}


	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#buscarUsuarioPorCnpj(java.lang.String)
	 */
	public Usuario buscarUsuarioPorCnpj(String cnpj) throws ClassNotFoundException, SQLException {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "SELECT * FROM empresa where cnpj = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql);
		ps.setString(1, cnpj);
		
		ResultSet rs = ps.executeQuery();

		Usuario usuario = null; 
		while (rs.next()) {
			usuario = new Usuario();
			usuario.setId(rs.getInt("id")); 
			usuario.setCnpj(rs.getString("cnpj")); 
			usuario.setRazaoSocial(rs.getString("razao_social")); 
			usuario.setFantasia(rs.getString("fantasia")); 
			usuario.setLogradouro(rs.getString("logradouro")); 
			usuario.setBairro(rs.getString("bairro")); 
			usuario.setNumero(rs.getString("numero")); 
			usuario.setComplemento(rs.getString("complemento")); 
			usuario.setCep(rs.getString("cep")); 
			usuario.setCidade(rs.getString("cidade")); 
			usuario.setEstado(rs.getString("estado")); 
			usuario.setRepresentante(rs.getString("representante")); 
			usuario.setEmail(rs.getString("email")); 
			usuario.setSenha(rs.getString("senha"));   
		}

		ps.close();
		conexao.close();
		
		
		return usuario;
	}



}