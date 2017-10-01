package br.com.resource.webservice_spedfiscal.vo;

public class EstoqueEscrituradoK200VO extends BlocoKVO{
	
	
	 
	
	public EstoqueEscrituradoK200VO(String dataEstoque, String codItem, String qtdEstoque,
			String estIndustrializador, String codParticipante){
		setReg("K200"); 
		setDataEstoque(dataEstoque);
		setCodItem(codItem);
		setQtdEstoque(qtdEstoque);
		setEstIndustrializador(estIndustrializador);
		setCodParticipante(codParticipante);
	}

	private String dataEstoque;
	private String codItem;
	private String qtdEstoque;
	private String estIndustrializador;
	private String codParticipante;
		
	public String getDataEstoque() {
		return dataEstoque;
	}


	public void setDataEstoque(String dataEstoque) {
		this.dataEstoque = dataEstoque;
	}


	public String getCodItem() {
		return codItem;
	}


	public void setCodItem(String codItem) {
		this.codItem = codItem;
	}


	public String getQtdEstoque() {
		return qtdEstoque;
	}


	public void setQtdEstoque(String qtdEstoque) {
		this.qtdEstoque = qtdEstoque;
	}


	public String getEstIndustrializador() {
		return estIndustrializador;
	}


	public void setEstIndustrializador(String estIndustrializador) {
		this.estIndustrializador = estIndustrializador;
	}


	public String getCodParticipante() {
		return codParticipante;
	}


	public void setCodParticipante(String codParticipante) {
		this.codParticipante = codParticipante;
	}


	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getDataEstoque() + SEPARATOR
        		+ getCodItem() + SEPARATOR + getQtdEstoque() + SEPARATOR 
        		+ getEstIndustrializador() + SEPARATOR + getCodParticipante() + SEPARATOR;
     } 
}
