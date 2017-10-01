package br.com.resource.webservice_spedfiscal.vo;

public class DesmontagemDestinoK215VO extends BlocoKVO{

	public DesmontagemDestinoK215VO(){
		setReg("K215");
	}
	private String codItemOrigem;
	private String qtdOrigem;
	
	public String getCodItemOrigem() {
		return codItemOrigem;
	}

	public void setCodItemOrigem(String codItemOrigem) {
		this.codItemOrigem = codItemOrigem;
	}

	public String getQtdOrigem() {
		return qtdOrigem;
	}

	public void setQtdOrigem(String qtdOrigem) {
		this.qtdOrigem = qtdOrigem;
	}

	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getCodItemOrigem() + SEPARATOR + getQtdOrigem() + SEPARATOR;
     } 
}
