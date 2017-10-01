
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
import br.com.resource.webservice_spedfiscal.beans.SpedFiscal;
import br.com.resource.webservice_spedfiscal.beans.Usuario;
import br.com.resource.webservice_spedfiscal.factory.ConnectionFactory;

@Repository
public class SpedFiscalDaoImpl extends GenericDao implements SpedFiscalDao{
 
 


	public List<Produto> listarProdutosAssProcesso(int idProcesso) throws Exception {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = " select p.*,pr.id id_produtor, pr.cod_produtor, pr.nome from sped s "
				+ " inner join sped_produto sp on sp.id_sped = s.id "
				+ " inner join produto p on p.id = sp.id_produto "
				+ " inner join produto_produtor pp on pp.id_produto = p.id "
				+ " inner join produtor pr on pp.id_produtor = pr.id "
				+ " where sp.id_sped = ? and s.id_usuario = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql); 
		ps.setInt(1,idProcesso);
		ps.setInt(2, getUsuarioLogado().getId());
		
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



	public List<SpedFiscal> listarProcessos(String tipoProcesso) throws Exception {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "select  *  from sped where processo = ? and id_usuario = ?"; 
		PreparedStatement ps = conexao.prepareStatement(sql); 
		ps.setString(1,tipoProcesso);
		ps.setInt(2, getUsuarioLogado().getId());
		
		ResultSet rs = ps.executeQuery();

		List<SpedFiscal> processos = new ArrayList<SpedFiscal>();
		SpedFiscal sped = null; 
		while (rs.next()) {
			sped = new SpedFiscal();
			sped.setId(rs.getInt("id"));  
			sped.setPathXML(rs.getString("path_arquivo_xml"));
			sped.setPathTXT(rs.getString("path_arquivo_txt"));
			sped.setNomeFileXML(sped.getPathXML() != null ? sped.getPathXML().replace("\\", "/").split("/")[11] : "");
			sped.setNomeFileTXT(sped.getPathTXT().replace("\\", "/").split("/")[11]);
			sped.setProcesso(rs.getString("processo"));
			sped.setDataProcessamento(rs.getDate("data_processamento"));
			processos.add(sped); 
		}

		ps.close();
		conexao.close(); 
		
		return processos;
	}




	public void insereProcesso(SpedFiscal spedFiscal) throws SQLException, ClassNotFoundException{
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "INSERT INTO sped(path_arquivo_xml,path_arquivo_txt,processo, "
				+ "data_processamento,id_usuario) "
				+ "VALUES(?,?,?,?,?)";
		
		try{
			java.sql.PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setString(1, spedFiscal.getPathXML() == null ? null: spedFiscal.getPathXML());
			stmt.setString(2, spedFiscal.getPathTXT()); 
			stmt.setString(3, spedFiscal.getProcesso()); 
			stmt.setDate(4, getCurrentDatetime()); 
			stmt.setInt(5, getUsuarioLogado().getId()); 
			
			stmt.executeUpdate();
			stmt.close();
		}catch(Exception e){
			System.out.println(e);
		}finally{		
			conexao.close();
		} 
	}
	public java.sql.Date getCurrentDatetime() {
	    java.util.Date today = new java.util.Date();
	    return new java.sql.Date(today.getTime());
	}

	public int listarUltimoProcesso() throws Exception {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "select  id  from sped where id_usuario = ? order by id desc LIMIT 1"; 
		PreparedStatement ps = conexao.prepareStatement(sql); 
		ps.setInt(1, getUsuarioLogado().getId());
		
		ResultSet rs = ps.executeQuery();

		SpedFiscal sped = null; 
		while (rs.next()) {
			sped = new SpedFiscal();
			sped.setId(rs.getInt("id"));  
		 
			
		}

		ps.close();
		conexao.close();
		
		
		return sped.getId();
	}

	public void insereAssSpedProduto(int idSped, Integer idProduto) throws ClassNotFoundException, SQLException {
		Connection conexao = ConnectionFactory.createConnection();
		
		String sql = "INSERT INTO sped_produto(id_produto, id_sped) "
				+ "VALUES(?,?)";
		
		try{
			java.sql.PreparedStatement stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, idProduto);  
			stmt.setInt(2, idSped);
			
			stmt.executeUpdate();
			stmt.close();
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{		
			conexao.close();
		} 
		
	}

}