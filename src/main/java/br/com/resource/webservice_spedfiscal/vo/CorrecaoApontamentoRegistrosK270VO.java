package br.com.resource.webservice_spedfiscal.vo;

public class CorrecaoApontamentoRegistrosK270VO extends BlocoKVO{

	public CorrecaoApontamentoRegistrosK270VO(){
		setReg("K270");
	}

	private String dataInicioApuracao;
	private String dataFimApuracao;
	private String codOrdemProducaoServico;
	private String codItem;
	private String qtdCorrecaoPositiva;
	private String qtdCorrecaoNegativa;
	private String origem;
	 
	public String getDataInicioApuracao() {
		return dataInicioApuracao;
	}

	public void setDataInicioApuracao(String dataInicioApuracao) {
		this.dataInicioApuracao = dataInicioApuracao;
	}

	public String getDataFimApuracao() {
		return dataFimApuracao;
	}

	public void setDataFimApuracao(String dataFimApuracao) {
		this.dataFimApuracao = dataFimApuracao;
	}

	public String getCodOrdemProducaoServico() {
		return codOrdemProducaoServico;
	}

	public void setCodOrdemProducaoServico(String codOrdemProducaoServico) {
		this.codOrdemProducaoServico = codOrdemProducaoServico;
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

	public String getOrigem() {
		return origem;
	}

	public void setOrigem(String origem) {
		this.origem = origem;
	}

	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getDataInicioApuracao() + SEPARATOR + getDataFimApuracao() 
        + SEPARATOR + getCodOrdemProducaoServico() + SEPARATOR + getCodItem() + SEPARATOR + getQtdCorrecaoPositiva()
        + SEPARATOR + getQtdCorrecaoNegativa() + SEPARATOR + getOrigem() + SEPARATOR;
     } 

}
