package br.com.resource.webservice_spedfiscal.vo;

public class EncerramentoBlocoK290VO extends BlocoKVO{
	
	public EncerramentoBlocoK290VO(){
		setReg("K290");
	}
	
	private String qtdLinhas;

	public String getQtdLinhas() {
		return qtdLinhas;
	}

	public void setQtdLinhas(String qtdLinhas) {
		this.qtdLinhas = qtdLinhas;
	}
	
	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getQtdLinhas() + SEPARATOR;
    } 
}