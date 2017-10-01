
package br.com.resource.webservice_spedfiscal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import br.com.resource.webservice_spedfiscal.beans.Produto;
import br.com.resource.webservice_spedfiscal.beans.Produtor;
import br.com.resource.webservice_spedfiscal.beans.Usuario;
import br.com.resource.webservice_spedfiscal.factory.ConnectionFactory;

@Repository
public class ProdutorDaoImpl extends GenericDao implements ProdutorDao{

	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#insereUsuario(br.com.resource.webservice_spedfiscal.beans.Usuario)
	 */
	public void insereProdutor(Produtor produtor)throws SQLException, ClassNotFoundException{
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "INSERT INTO produtor(cod_produtor,nome,id_usuario) "
				+ "VALUES(?,?,?)";
		
		try{
			java.sql.PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, produtor.getCodProdutor());
			stmt.setString(2, produtor.getNome()); 
			stmt.setInt(3, getUsuarioLogado().getId()); 
			
			stmt.executeUpdate();
			stmt.close();
		}catch(Exception e){
			System.out.println(e);
		}finally{		
			conexao.close();
		}
		
	}

	 


	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#buscarUsuarioPorCnpj(java.lang.String)
	 */
	public Produtor buscarProdutorPorId(int id) throws ClassNotFoundException, SQLException {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "SELECT * FROM produtor where id = ? and id_usuario = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql);
		ps.setInt(1, id);
		ps.setInt(2, getUsuarioLogado().getId());
		
		ResultSet rs = ps.executeQuery();

		Produtor produtor = null; 
		while (rs.next()) {
			produtor = new Produtor();
			produtor.setId(rs.getInt("id")); 
			produtor.setCodProdutor(rs.getString("cod_produtor")); 
			produtor.setNome(rs.getString("nome"));   
			Usuario usuario = new Usuario();
			usuario.setId(rs.getInt("id_usuario"));
			produtor.setUsuario(usuario);   
		}

		ps.close();
		conexao.close();
		
		
		return produtor;
	}
 
	public List<Produtor> ListarProdutores() throws ClassNotFoundException, SQLException {
		Connection conexao = ConnectionFactory.createConnection(); 
		String sql = "SELECT * FROM produtor where id_usuario = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql); 
		ps.setInt(1, getUsuarioLogado().getId());
		
		ResultSet rs = ps.executeQuery();

		List<Produtor> produtores = new  ArrayList<Produtor>();
		Produtor produtor = null; 
		while (rs.next()) {
			produtor = new Produtor();
			produtor.setId(rs.getInt("id"));  
			produtor.setCodProdutor(rs.getString("cod_produtor")); 
			produtor.setNome(rs.getString("nome"));   
			Usuario usuario = new Usuario();
			usuario.setId(rs.getInt("id_usuario"));
			produtor.setUsuario(usuario);  
			produtores.add(produtor);
		}

		ps.close();
		conexao.close(); 
		return produtores;
	} 
 
	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#buscarUsuarioPorCnpj(java.lang.String)
	 */
	public Produtor buscarAssProdutor(Integer idProduto) throws Exception {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "SELECT p.* FROM produto_produtor pp"
				+ " inner join produtor p on pp.id_produtor = p.id"
				+ " where pp.id_produto = ? and pp.id_usuario = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql);
		ps.setInt(1, idProduto);
		ps.setInt(2, getUsuarioLogado().getId());
		
		ResultSet rs = ps.executeQuery();

		Produtor produtor = null; 
		while (rs.next()) {
			produtor = new Produtor();
			produtor.setId(rs.getInt("id")); 
			produtor.setCodProdutor(rs.getString("cod_produtor")); 
			produtor.setNome(rs.getString("nome"));   
			Usuario usuario = new Usuario();
			usuario.setId(rs.getInt("id_usuario"));
			produtor.setUsuario(usuario);   
		}

		ps.close();
		conexao.close();		
		
		return produtor;
	}


}