package br.com.resource.webservice_spedfiscal.vo;

public class DesmontagemOrigemK210VO extends BlocoKVO{

	public DesmontagemOrigemK210VO(){
		setReg("K210");
	}
	
	private String dataInicioOS;
	private String dataFimOS;
	private String codDocOS;
	private String codItemOrigem;
	private String qtdOrigem;
	
	public String getDataInicioOS() {
		return dataInicioOS;
	}

	public void setDataInicioOS(String dataInicioOS) {
		this.dataInicioOS = dataInicioOS;
	}

	public String getDataFimOS() {
		return dataFimOS;
	}

	public void setDataFimOS(String dataFimOS) {
		this.dataFimOS = dataFimOS;
	}

	public String getCodDocOS() {
		return codDocOS;
	}

	public void setCodDocOS(String codDocOS) {
		this.codDocOS = codDocOS;
	}

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
        return  SEPARATOR + getReg() + SEPARATOR + getDataInicioOS() + SEPARATOR + getDataFimOS() + SEPARATOR
        		 + getCodDocOS() + SEPARATOR + getCodItemOrigem() + SEPARATOR + getQtdOrigem() + SEPARATOR;
    } 
}
