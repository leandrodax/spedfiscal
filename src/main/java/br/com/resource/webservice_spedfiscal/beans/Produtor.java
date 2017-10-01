package br.com.resource.webservice_spedfiscal.beans;

public class Produtor {

	private Integer id;
	private String codProdutor;
	private String nome;
	private Usuario usuario;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCodProdutor() {
		return codProdutor;
	}
	public void setCodProdutor(String codProdutor) {
		this.codProdutor = codProdutor;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}
