package br.com.resource.webservice_spedfiscal.vo;

public class InsumosConsumidosK235VO extends BlocoKVO {
	
	public InsumosConsumidosK235VO(String dataSaida,String codItem,
			String qtdConsumida,String codInsumoSubstituido){
		setReg("K235");
		setDataSaida(dataSaida);
		setCodItem(codItem);
		setQtdConsumida(qtdConsumida);
		setCodInsumoSubstituido(codInsumoSubstituido);
		
	}

	private String dataSaida;
	private String codItem;
	private String qtdConsumida;
	private String codInsumoSubstituido;
	
	
	public String getDataSaida() {
		return dataSaida;
	}


	public void setDataSaida(String dataSaida) {
		this.dataSaida = dataSaida;
	}


	public String getCodItem() {
		return codItem;
	}


	public void setCodItem(String codItem) {
		this.codItem = codItem;
	}


	public String getQtdConsumida() {
		return qtdConsumida;
	}


	public void setQtdConsumida(String qtdConsumida) {
		this.qtdConsumida = qtdConsumida;
	}


	public String getCodInsumoSubstituido() {
		return codInsumoSubstituido;
	}


	public void setCodInsumoSubstituido(String codInsumoSubstituido) {
		this.codInsumoSubstituido = codInsumoSubstituido;
	}


	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getDataSaida() + SEPARATOR + getCodItem() + SEPARATOR
        		 + getQtdConsumida() + SEPARATOR + getCodInsumoSubstituido() + SEPARATOR;
	}
}
