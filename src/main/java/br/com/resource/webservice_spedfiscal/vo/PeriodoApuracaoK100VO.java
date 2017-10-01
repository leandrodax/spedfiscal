package br.com.resource.webservice_spedfiscal.vo;

public class PeriodoApuracaoK100VO extends BlocoKVO {
	
	public PeriodoApuracaoK100VO(String dtInicio, String dtFim){
		setReg("K100");
		setDtInicio(dtInicio); 
		setDtFim(dtFim); 
	}
	
	private String dtInicio;
	private String dtFim;
	
	public String getDtInicio() {
		return dtInicio;
	}

	public void setDtInicio(String dtInicio) {
		this.dtInicio = dtInicio;
	}

	public String getDtFim() {
		return dtFim;
	}

	public void setDtFim(String dtFim) {
		this.dtFim = dtFim;
	}

	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getDtInicio() + SEPARATOR + getDtFim() + SEPARATOR;
     } 
}
