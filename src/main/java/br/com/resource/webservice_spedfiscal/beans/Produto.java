package br.com.resource.webservice_spedfiscal.beans;

public class Produto {

	private Integer id;
	private String codProduto;
	private String descricao;
	private String dataProducao;
	private String dataProducaoFormatada;
	private String dataSaidaEstoqueFormatada;
	//private String dataPosicaoEstoque;
	private String dataSaidaEstoque;
	private String qtdEstoque;
	private String qtdProduzida; 
	private String tipoProduto;
	private String posse;
	private String ordemProducao;
	private String blocoTipoProduto;
	private String codProdutor;
	private Produtor produtor;
	private Usuario usuario;
	
	
	//k220
	private String codItemDestino;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCodProduto() {
		return codProduto;
	}
	public void setCodProduto(String codProduto) {
		this.codProduto = codProduto;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getTipoProduto() {
		return tipoProduto;
	}
	public void setTipoProduto(String tipoProduto) {
		this.tipoProduto = tipoProduto;
	}
	
	public String getPosse() {
		return posse;
	}
	public void setPosse(String posse) {
		this.posse = posse;
	}
	public String getQtdEstoque() {
		return qtdEstoque;
	}
	public void setQtdEstoque(String qtdEstoque) {
		this.qtdEstoque = qtdEstoque;
	}
	public String getQtdProduzida() {
		return qtdProduzida;
	}
	public void setQtdProduzida(String qtdProduzida) {
		this.qtdProduzida = qtdProduzida;
	}
 
	public String getDataProducao() {
		return dataProducao;
	}
	public void setDataProducao(String dataProducao) {
		this.dataProducao = dataProducao;
	}
	/*public String getDataPosicaoEstoque() {
		return dataPosicaoEstoque;
	}
	public void setDataPosicaoEstoque(String dataPosicaoEstoque) {
		this.dataPosicaoEstoque = dataPosicaoEstoque;
	}*/
	
	public String getDataProducaoFormatada() {
		return dataProducaoFormatada;
	}
	public void setDataProducaoFormatada(String dataProducaoFormatada) {
		this.dataProducaoFormatada = dataFormatada(dataProducaoFormatada);
	}
	public String getDataSaidaEstoqueFormatada() {
		return dataSaidaEstoqueFormatada;
	}
	public void setDataSaidaEstoqueFormatada(String dataSaidaEstoqueFormatada) {
		this.dataSaidaEstoqueFormatada = dataFormatada(dataSaidaEstoqueFormatada);
	}
	public String getOrdemProducao() {
		return ordemProducao;
	}
	public void setOrdemProducao(String ordemProducao) {
		this.ordemProducao = ordemProducao;
	}
	public String getCodProdutor() {
		return codProdutor;
	}
	public void setCodProdutor(String codProdutor) {
		this.codProdutor = codProdutor;
	}
	public String getDataSaidaEstoque() {
		return dataSaidaEstoque;
	}
	public void setDataSaidaEstoque(String dataSaidaEstoque) {
		this.dataSaidaEstoque = dataSaidaEstoque;
	}
	public String getCodItemDestino() {
		return codItemDestino;
	}
	public void setCodItemDestino(String codItemDestino) {
		this.codItemDestino = codItemDestino;
	}
	
	public String getBlocoTipoProduto() {
		return blocoTipoProduto;
	}
	public void setBlocoTipoProduto(String blocoTipoProduto) {
		this.blocoTipoProduto = blocoTipoProduto;
	}
	public Produtor getProdutor() {
		return produtor;
	}
	public void setProdutor(Produtor produtor) {
		this.produtor = produtor;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public String dataFormatada(String data){
		
		String obj[] = data.split("-");
		String ano = obj[0];
		String mes = obj[1];
		String dia = obj[2]; 
		
		return dia+"/"+mes+"/"+ano;
	}
	 
	
}
