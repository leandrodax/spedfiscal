package br.com.resource.webservice_spedfiscal.vo;

public class CorrecaoApontamentoRetornoInsumosRegistrosK275VO extends BlocoKVO {
	
	public CorrecaoApontamentoRetornoInsumosRegistrosK275VO (){
		setReg("K275");
	} 
	private String codItem;
	private String qtdCorrecaoPositiva;
	private String qtdCorrecaoNegativa;
	private String codInsumoSubstituido;
 

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


	public String getCodInsumoSubstituido() {
		return codInsumoSubstituido;
	}


	public void setCodInsumoSubstituido(String codInsumoSubstituido) {
		this.codInsumoSubstituido = codInsumoSubstituido;
	}


	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getCodItem() + SEPARATOR + getQtdCorrecaoPositiva()
        + SEPARATOR + getQtdCorrecaoNegativa() + SEPARATOR + getCodInsumoSubstituido() + SEPARATOR;
     } 

}