
package br.com.resource.webservice_spedfiscal.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Repository;

import br.com.resource.webservice_spedfiscal.beans.Produto;
import br.com.resource.webservice_spedfiscal.beans.Produtor;
import br.com.resource.webservice_spedfiscal.beans.Usuario;
import br.com.resource.webservice_spedfiscal.factory.ConnectionFactory;

@Repository
public class ProdutoDaoImpl extends GenericDao implements ProdutoDao{

	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#insereUsuario(br.com.resource.webservice_spedfiscal.beans.Usuario)
	 */
	public void insereProduto(Produto produto)throws Exception{
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "INSERT INTO produto(cod_produto, descricao,posse,"
				+ "tipo_produto,data_producao,qtd_estoque,qtd_produzida,data_saida_estoque,"
				+ "ordem_procucao,cod_item_destino,bloco_tipo_produto,data_alteracao,"
				+ "data_criacao,id_usuario) "
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try{
			java.sql.PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, produto.getCodProduto());
			stmt.setString(2, produto.getDescricao());
			stmt.setString(3, produto.getPosse());
			stmt.setString(4, produto.getTipoProduto());
			stmt.setString(5, produto.getDataProducao());
			stmt.setString(6, produto.getQtdEstoque());
			stmt.setString(7, produto.getQtdProduzida());
			stmt.setString(8, produto.getDataSaidaEstoque() != null ? produto.getDataSaidaEstoque() : "");
			stmt.setString(9, produto.getOrdemProducao() != null ? produto.getOrdemProducao() : "");
			stmt.setString(10, produto.getCodItemDestino() != null ? produto.getCodItemDestino() : "");
			stmt.setString(11, produto.getBlocoTipoProduto());
			 			
			stmt.setDate(12, getCurrentDatetime()); 
			stmt.setDate(13, getCurrentDatetime());
			
			stmt.setInt(14, getUsuarioLogado().getId()); 
			
			stmt.executeUpdate();
			stmt.close();
		}catch(Exception e){
			e.printStackTrace();
			throw new Exception("Erro ao cadastrar produto.");
		}finally{		
			conexao.close();
		}
		
	}

	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#insereUsuario(br.com.resource.webservice_spedfiscal.beans.Usuario)
	 */
	public void insereAssProduto(Produto produto)throws Exception{
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "INSERT INTO produto_produtor(id_produto, id_produtor,id_usuario) "
				+ "VALUES(?,?,?)";
		
		try{
			java.sql.PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, produto.getId()); 
			stmt.setInt(2, Integer.parseInt(produto.getCodProdutor())); 			
			stmt.setInt(3, getUsuarioLogado().getId()); 
			
			stmt.executeUpdate();
			stmt.close();
		}catch(Exception e){
			e.printStackTrace();
			throw new Exception("Erro ao cadastrar produto.");
		}finally{		
			conexao.close();
		}
		
	}

	 


	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#buscarUsuarioPorCnpj(java.lang.String)
	 */
	public Produto buscarProdutoPorCodigo(String codigo) throws ClassNotFoundException, SQLException {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "SELECT p.*, pr.id id_produtor, pr.cod_produtor, pr.nome FROM produto p"
				+ " INNER JOIN produto_produtor pp on pp.id_produto = p.id"
				+ " INNER JOIN produtor pr on pp.id_produtor = pr.id"
				+ " where p.cod_produto = ? and p.id_usuario = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql);
		ps.setString(1, codigo);
		ps.setInt(2, getUsuarioLogado().getId());
		
		ResultSet rs = ps.executeQuery();

		Produto produto = null; 
		while (rs.next()) {
			produto = new Produto();
			produto.setId(rs.getInt("id")); 
			produto.setCodProduto(rs.getString("cod_produto")); 
			produto.setDescricao(rs.getString("descricao")); 
			produto.setPosse(rs.getString("posse")); 
			produto.setTipoProduto(rs.getString("tipo_produto")); 
			produto.setDataProducao(rs.getString("data_producao")); 
			produto.setQtdEstoque(rs.getString("qtd_estoque")); 
			produto.setQtdProduzida(rs.getString("qtd_produzida")); 
			produto.setDataSaidaEstoque(rs.getString("data_saida_estoque")!= null ?rs.getString("data_saida_estoque"):""); 
			produto.setOrdemProducao(rs.getString("ordem_procucao")!= null ?rs.getString("ordem_procucao"):""); 
			produto.setCodItemDestino(rs.getString("cod_item_destino")!= null ?rs.getString("cod_item_destino"):""); 
			produto.setBlocoTipoProduto(rs.getString("bloco_tipo_produto"));
			
			produto.setUsuario(getUsuarioLogado()); 
			
			Produtor produtor = new Produtor();
			produtor.setCodProdutor(rs.getString("cod_produtor"));
			produtor.setId(rs.getInt("id_produtor"));
			produtor.setNome(rs.getString("nome"));
			produto.setProdutor(produtor);
		 
			
		}

		ps.close();
		conexao.close();
		
		
		return produto;
	}
	
	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#buscarUsuarioPorCnpj(java.lang.String)
	 */
	public Integer buscarIdProdutoUltimo() throws Exception {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "select  id  from produto where id_usuario = ? order by id desc LIMIT 1"; 
		PreparedStatement ps = conexao.prepareStatement(sql); 
		ps.setInt(1, getUsuarioLogado().getId());
		
		ResultSet rs = ps.executeQuery();

		Produto produto = null; 
		while (rs.next()) {
			produto = new Produto();
			produto.setId(rs.getInt("id"));  
		 
			
		}

		ps.close();
		conexao.close();
		
		
		return produto.getId();
	}
	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#buscarUsuarioPorCnpj(java.lang.String)
	 */ 
	public Produto buscarProdutoPorId(int id) throws ClassNotFoundException, SQLException {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "SELECT p.*, pr.id id_produtor, pr.cod_produtor, pr.nome FROM produto p"
				+ " INNER JOIN produto_produtor pp on pp.id_produto = p.id"
				+ " INNER JOIN produtor pr on pp.id_produtor = pr.id"
				+ " where p.id = ? and p.id_usuario = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql);
		ps.setInt(1, id);
		ps.setInt(2, getUsuarioLogado().getId());
		
		ResultSet rs = ps.executeQuery();

		Produto produto = null; 
		while (rs.next()) {
			produto = new Produto();
			produto.setId(rs.getInt("id")); 
			produto.setCodProduto(rs.getString("cod_produto")); 
			produto.setDescricao(rs.getString("descricao")); 
			produto.setPosse(rs.getString("posse")); 
			produto.setTipoProduto(rs.getString("tipo_produto")); 
			produto.setDataProducao(rs.getString("data_producao")); 
			produto.setQtdEstoque(rs.getString("qtd_estoque")); 
			produto.setQtdProduzida(rs.getString("qtd_produzida")); 
			produto.setDataSaidaEstoque(rs.getString("data_saida_estoque")!= null ?rs.getString("data_saida_estoque"):""); 
			produto.setOrdemProducao(rs.getString("ordem_procucao")!= null ?rs.getString("ordem_procucao"):""); 
			produto.setCodItemDestino(rs.getString("cod_item_destino")!= null ?rs.getString("cod_item_destino"):""); 
			produto.setBlocoTipoProduto(rs.getString("bloco_tipo_produto")); 

			produto.setUsuario(getUsuarioLogado()); 
			
			Produtor produtor = new Produtor();
			produtor.setCodProdutor(rs.getString("cod_produtor"));
			produtor.setId(rs.getInt("id_produtor"));
			produtor.setNome(rs.getString("nome"));
			produto.setProdutor(produtor);
	   
		}

		ps.close();
		conexao.close();
		
		
		return produto;
	}

 
	public List<Produto> ListarProdutos() throws ClassNotFoundException, SQLException {
		Connection conexao = ConnectionFactory.createConnection(); 
		String sql = "SELECT p.*, pr.id id_produtor, pr.cod_produtor, pr.nome FROM produto p"
				+ " INNER JOIN produto_produtor pp on pp.id_produto = p.id"
				+ " INNER JOIN produtor pr on pp.id_produtor = pr.id"
				+ " where p.id_usuario = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql); 
		ps.setInt(1, getUsuarioLogado().getId());
		
		ResultSet rs = ps.executeQuery();

		List<Produto> produtos = new  ArrayList<Produto>();
		Produto produto = null; 
		while (rs.next()) {
			produto = new Produto();
			produto.setId(rs.getInt("id")); 
			produto.setCodProduto(rs.getString("cod_produto")); 
			produto.setDescricao(rs.getString("descricao")); 
			produto.setPosse(rs.getString("posse")); 
			produto.setTipoProduto(rs.getString("tipo_produto")); 
			produto.setDataProducao(rs.getString("data_producao")); 
			produto.setQtdEstoque(rs.getString("qtd_estoque")); 
			produto.setQtdProduzida(rs.getString("qtd_produzida")); 
			produto.setDataSaidaEstoque(rs.getString("data_saida_estoque")); 
			produto.setOrdemProducao(rs.getString("ordem_procucao")); 
			produto.setCodItemDestino(rs.getString("cod_item_destino")); 
			produto.setBlocoTipoProduto(rs.getString("bloco_tipo_produto")); 
 
			produto.setUsuario(getUsuarioLogado()); 
			
			Produtor produtor = new Produtor();
			produtor.setCodProdutor(rs.getString("cod_produtor"));
			produtor.setId(rs.getInt("id_produtor"));
			produtor.setNome(rs.getString("nome"));
			produto.setProdutor(produtor);
			
			produtos.add(produto);
		}

		ps.close();
		conexao.close();
		
		
		return produtos;
	}
 
	public java.sql.Date getCurrentDatetime() {
	    java.util.Date today = new java.util.Date();
	    return new java.sql.Date(today.getTime());
	}

	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#buscarUsuarioPorCnpj(java.lang.String)
	 */ 
	public void deletarProduto(int id) throws Exception {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "delete from produto where id = ? and id_usuario = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql);
		ps.setInt(1, id);
		ps.setInt(2, getUsuarioLogado().getId());
		ps.executeUpdate();
 
		ps.close(); 
		conexao.close(); 		
	}

	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.dao.UsuarioDao#buscarUsuarioPorCnpj(java.lang.String)
	 */ 
	public void deletarAssProduto(int id) throws Exception {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "delete from produto_produtor where id_produto = ? and id_usuario = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql);
		ps.setInt(1, id);
		ps.setInt(2, getUsuarioLogado().getId());
		ps.executeUpdate();
 
		ps.close(); 
		conexao.close(); 		
	}



}