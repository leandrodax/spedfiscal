package br.com.resource.webservice_spedfiscal.vo;

public class IndustrializadoPorTerceirosK250VO extends BlocoKVO{

	public IndustrializadoPorTerceirosK250VO(String dataProducao,String codItem,String qtdProducao){
		setReg("K250");
		setDataProducao(dataProducao);
		setCodItem(codItem); 
		setQtdConsumo(qtdProducao);
	}
	private String dataProducao;
	private String codItem;
	private String qtdProducao; 
	
	public String getDataProducao() {
		return dataProducao;
	}

	public void setDataProducao(String dataConsumo) {
		this.dataProducao = dataConsumo;
	}

	public String getCodItem() {
		return codItem;
	}

	public void setCodItem(String codItem) {
		this.codItem = codItem;
	}

	public String getQtdProducao() {
		return qtdProducao;
	}

	public void setQtdConsumo(String qtdProducao) {
		this.qtdProducao = qtdProducao;
	}

 
	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getDataProducao() + SEPARATOR + getCodItem() + SEPARATOR
        		 + getQtdProducao() + SEPARATOR;
     } 
}
