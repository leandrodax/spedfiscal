package br.com.resource.webservice_spedfiscal.vo;

public class ReprocessamentoProdutoInsumoK260VO extends BlocoKVO{
	
	public ReprocessamentoProdutoInsumoK260VO(){
		setReg("K260");
	}
	
	private String codOrdemProducaoServico;
	private String codItem;
	private String dataSaida;
	private String qtdSaida;
	private String dataRetorno;

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

	public String getDataSaida() {
		return dataSaida;
	}

	public void setDataSaida(String dataSaida) {
		this.dataSaida = dataSaida;
	}

	public String getQtdSaida() {
		return qtdSaida;
	}

	public void setQtdSaida(String qtdSaida) {
		this.qtdSaida = qtdSaida;
	}

	public String getDataRetorno() {
		return dataRetorno;
	}

	public void setDataRetorno(String dataRetorno) {
		this.dataRetorno = dataRetorno;
	}

	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getCodOrdemProducaoServico() + SEPARATOR + getCodItem() + SEPARATOR
        		 + getDataSaida() + SEPARATOR + getQtdSaida() + SEPARATOR + getDataRetorno() + SEPARATOR;
     } 
}
