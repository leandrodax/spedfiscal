package br.com.resource.webservice_spedfiscal.vo;

public class ReprocessamentoMercadoriasConsumoK265VO extends BlocoKVO{
	
	
	public ReprocessamentoMercadoriasConsumoK265VO(){
		setReg("K265");
	}

	private String codItem; 
	private String qtdConsumida;
	private String qtdRetorno;
	
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

	public String getQtdRetorno() {
		return qtdRetorno;
	}

	public void setQtdRetorno(String qtdRetorno) {
		this.qtdRetorno = qtdRetorno;
	}

	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getCodItem() + SEPARATOR + getQtdConsumida() + SEPARATOR
        		 + getQtdRetorno() + SEPARATOR;
     } 

}
