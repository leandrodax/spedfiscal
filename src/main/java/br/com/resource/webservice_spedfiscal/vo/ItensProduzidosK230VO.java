package br.com.resource.webservice_spedfiscal.vo;

public class ItensProduzidosK230VO extends BlocoKVO{
	
	public ItensProduzidosK230VO(String dataInicioOP,String dataFimOP,
			String codDocOP,String codItem,String qtdProducaoAcabada){
		setReg("K230");
		setDataInicioOP(dataInicioOP);
		setDataFimOP(dataFimOP);
		setCodDocOP(codDocOP);
		setCodItem(codItem);
		setQtdProducaoAcabada(qtdProducaoAcabada);
	}

	private String dataInicioOP;
	private String dataFimOP;
	private String codDocOP;
	private String codItem;
	private String qtdProducaoAcabada;
	
	public String getDataInicioOP() {
		return dataInicioOP;
	}
	public void setDataInicioOP(String dataInicioOP) {
		this.dataInicioOP = dataInicioOP;
	}
	public String getDataFimOP() {
		return dataFimOP;
	}
	public void setDataFimOP(String dataFimOP) {
		this.dataFimOP = dataFimOP;
	}
	public String getCodDocOP() {
		return codDocOP;
	}
	public void setCodDocOP(String codDocOP) {
		this.codDocOP = codDocOP;
	}
	public String getCodItem() {
		return codItem;
	}
	public void setCodItem(String codItem) {
		this.codItem = codItem;
	}
	public String getQtdProducaoAcabada() {
		return qtdProducaoAcabada;
	}
	public void setQtdProducaoAcabada(String qtdProducaoAcabada) {
		this.qtdProducaoAcabada = qtdProducaoAcabada;
	}

	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getDataInicioOP() + SEPARATOR + getDataFimOP() + SEPARATOR
        		 + getCodDocOP() + SEPARATOR + getCodItem() + SEPARATOR + getQtdProducaoAcabada() + SEPARATOR;
     } 

}
