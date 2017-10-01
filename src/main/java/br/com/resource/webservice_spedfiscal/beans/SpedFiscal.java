package br.com.resource.webservice_spedfiscal.beans;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class SpedFiscal {

	private int id;
	private String pathXML;
	private String pathTXT;
	private String nomeFileXML;
	private String nomeFileTXT;
	private String processo;
	private Date dataProcessamento;
	private String dataProcessamentoFormatada;
	private List<Produto> produtos;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPathXML() {
		return pathXML;
	}
	public void setPathXML(String pathXML) {
		this.pathXML = pathXML;
	}
	public String getPathTXT() {
		return pathTXT;
	}
	public void setPathTXT(String pathTXT) {
		this.pathTXT = pathTXT;
	}
	public String getNomeFileXML() {
		return nomeFileXML;
	}
	public void setNomeFileXML(String nomeFileXML) {
		this.nomeFileXML = nomeFileXML;
	}
	public String getNomeFileTXT() {
		return nomeFileTXT;
	}
	public void setNomeFileTXT(String nomeFileTXT) {
		this.nomeFileTXT = nomeFileTXT;
	}
	public String getProcesso() {
		return processo;
	}
	public void setProcesso(String string) {
		this.processo = string;
	}
	public Date getDataProcessamento() {
		return dataProcessamento;
	}
	public void setDataProcessamento(Date dataProcessamento) {
		this.dataProcessamento = dataProcessamento;
	}
	
	public String getDataProcessamentoFormatada() {
		return dataProcessamentoFormatada;
	}
	public void setDataProcessamentoFormatada(Date dataProcessamentoFormatada) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		this.dataProcessamentoFormatada = sdf.format(dataProcessamentoFormatada);
	}
	public List<Produto> getProdutos() {
		return produtos;
	}
	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

	
}
