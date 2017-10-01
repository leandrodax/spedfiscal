package br.com.resource.webservice_spedfiscal.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory{
	
	public static Connection createConnection() throws SQLException, ClassNotFoundException{
		String driver = "com.mysql.jdbc.Driver";
		Class.forName(driver);
		
		String url = "jdbc:mysql://localhost:3306/spedFiscal?useUnicode=true&characterEncoding=UTF-8"; //Nome da base de dados
		String user = "root"; //nome do usuário do MySQL
		String password = ""; //senha do MySQL
		
		Connection conexao = null;
		conexao = DriverManager.getConnection(url, user, password);
		
		return conexao;
	}
}
