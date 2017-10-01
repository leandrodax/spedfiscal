package br.com.resource.webservice_spedfiscal.vo;

public class CorrecaoApontamentoEstoqueEscrituradoK280VO  extends BlocoKVO {
	
	public CorrecaoApontamentoEstoqueEscrituradoK280VO (){
		setReg("K280");
	} 
	private String DataEstoque;
	private String codItem;
	private String qtdCorrecaoPositiva;
	private String qtdCorrecaoNegativa;
	private String indicadorEstoque;
	private String codParticipante;
 
 
	public String getDataEstoque() {
		return DataEstoque;
	}


	public void setDataEstoque(String dataEstoque) {
		DataEstoque = dataEstoque;
	}


	public String getCodItem() {
		return codItem;
	}


	public void setCodItem(String codItem) {
		this.codItem = codItem;
	}


	public String getQtdCorrecaoPositiva() {
		return qtdCorrecaoPositiva;
	}


	public void setQtdCorrecaoPositiva(String qtdCorrecaoPositiva) {
		this.qtdCorrecaoPositiva = qtdCorrecaoPositiva;
	}


	public String getQtdCorrecaoNegativa() {
		return qtdCorrecaoNegativa;
	}


	public void setQtdCorrecaoNegativa(String qtdCorrecaoNegativa) {
		this.qtdCorrecaoNegativa = qtdCorrecaoNegativa;
	}


	public String getIndicadorEstoque() {
		return indicadorEstoque;
	}


	public void setIndicadorEstoque(String indicadorEstoque) {
		this.indicadorEstoque = indicadorEstoque;
	}


	public String getCodParticipante() {
		return codParticipante;
	}


	public void setCodParticipante(String codParticipante) {
		this.codParticipante = codParticipante;
	}


	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getDataEstoque() + SEPARATOR + getCodItem() 
        + SEPARATOR + getQtdCorrecaoPositiva() + SEPARATOR + getQtdCorrecaoNegativa()
        + SEPARATOR + getIndicadorEstoque() + SEPARATOR + SEPARATOR + getCodParticipante() + SEPARATOR;
     } 

}
