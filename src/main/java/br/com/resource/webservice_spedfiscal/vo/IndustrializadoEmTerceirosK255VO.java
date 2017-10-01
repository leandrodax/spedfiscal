package br.com.resource.webservice_spedfiscal.vo;

public class IndustrializadoEmTerceirosK255VO extends BlocoKVO{
	
	public IndustrializadoEmTerceirosK255VO(String dataConsumo,String codItem,
			String qtdProducao, String codInsumoSubstituido){
		setReg("K255");
		setDataConsumo(dataConsumo);
		setCodItem(codItem); 
		setQtdConsumo(qtdProducao); 
		setCodInsumoSubstituido(codInsumoSubstituido);
		
	}
	private String dataConsumo;
	private String codItem;
	private String qtdConsumo;
	private String codInsumoSubstituido;
	
	public String getDataConsumo() {
		return dataConsumo;
	}

	public void setDataConsumo(String dataConsumo) {
		this.dataConsumo = dataConsumo;
	}

	public String getCodItem() {
		return codItem;
	}

	public void setCodItem(String codItem) {
		this.codItem = codItem;
	}

	public String getQtdConsumo() {
		return qtdConsumo;
	}

	public void setQtdConsumo(String qtdConsumo) {
		this.qtdConsumo = qtdConsumo;
	}

	public String getCodInsumoSubstituido() {
		return codInsumoSubstituido;
	}

	public void setCodInsumoSubstituido(String codInsumoSubstituido) {
		this.codInsumoSubstituido = codInsumoSubstituido;
	}

	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getDataConsumo() + SEPARATOR + getCodItem() + SEPARATOR
        		 + getQtdConsumo() + SEPARATOR + getCodInsumoSubstituido() + SEPARATOR;
     } 

}
